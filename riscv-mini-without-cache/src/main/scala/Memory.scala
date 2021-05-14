package mini

import chisel3._
import chisel3.util._
import freechips.rocketchip.config.Parameters

/**
 * @author YueChen
 * @date 2021/3/6 12:44
 * @version 1.0
 */

class MemoryReq(implicit p: Parameters) extends CoreBundle()(p) {
  val addr = UInt(xlen.W)
  val data = UInt(xlen.W)
  val mask = UInt((xlen/8).W)
}

class MemoryResp(implicit p: Parameters) extends CoreBundle()(p) {
  val data = UInt(xlen.W)
}

class MemoryIO(implicit val p: Parameters) extends Bundle {
  val abort = Input(Bool())
  val req = Flipped(Valid(new MemoryReq))
  val resp = Valid(new MemoryResp)
}

trait MemoryParams extends CoreParams {
  val nSets  = p(NSets)
  val bBytes = p(CacheBlockBytes)
  val bBits  = bBytes << 3
  val blen   = log2Ceil(bBytes)
  val slen   = log2Ceil(nSets)
  val tlen   = xlen - (slen + blen)
  val nWords = bBits / xlen
  val wBytes = xlen / 8
  val byteOffsetBits = log2Ceil(wBytes)
}

class Memory(implicit val p: Parameters) extends Module with MemoryParams {
  val io = IO(new MemoryIO)

  val dataMem = Seq.fill(nWords)(SyncReadMem(nSets, Vec(wBytes, UInt(8.W))))

  val s_IDLE :: s_READ_MEM :: s_WRITE_MEM :: Nil = Enum(3)
  val state = RegInit(s_IDLE)

  val addr_reg = Reg(io.req.bits.addr.cloneType)
  val cpu_data = Reg(io.req.bits.data.cloneType)
  val cpu_mask = Reg(io.req.bits.mask.cloneType)

  val is_idle = state === s_IDLE
  val is_read = state === s_READ_MEM
  val is_write = state === s_WRITE_MEM
  val wen = is_write && !io.abort
  val ren = !wen && (is_idle || is_read) && io.req.valid
  val ren_reg = RegNext(ren)

  val addr     = io.req.bits.addr
  val idx      = addr(slen+blen-1, blen)
  val tag_reg  = addr_reg(xlen-1, slen+blen)
  val idx_reg  = addr_reg(slen+blen-1, blen)
  val off_reg  = addr_reg(blen-1, byteOffsetBits)

  val rdata = Cat((dataMem map (_.read(idx, ren).asUInt)).reverse)
  val rdata_buf = RegEnable(rdata, ren_reg)
  val read = Mux(ren_reg, rdata, rdata_buf)

  io.resp.bits.data := Vec.tabulate(nWords)(i => read((i+1)*xlen-1, i*xlen))(off_reg)
  io.resp.valid     := is_idle || is_read || !cpu_mask.orR

  when(io.resp.valid) {
    addr_reg  := addr
    cpu_data  := io.req.bits.data
    cpu_mask  := io.req.bits.mask
  }

  val wmask = (cpu_mask << Cat(off_reg, 0.U(byteOffsetBits.W))).zext
  val wdata = Fill(nWords, cpu_data)
  when(wen) {
    dataMem.zipWithIndex foreach { case (mem, i) =>
      val data = Vec.tabulate(wBytes)(k => wdata(i*xlen+(k+1)*8-1, i*xlen+k*8))
      mem.write(idx_reg, data, wmask((i+1)*wBytes-1, i*wBytes).toBools)
      mem suggestName s"dataMem_${i}"
    }
  }

  switch(state) {
    is(s_IDLE) {
      when(io.req.valid) {
        state := Mux(io.req.bits.mask.orR, s_WRITE_MEM, s_READ_MEM)
      }
    }
    is(s_READ_MEM) {
      when(io.req.valid) {
        state := Mux(io.req.bits.mask.orR, s_WRITE_MEM, s_READ_MEM)
      }.otherwise {
        state := s_IDLE
      }
    }
    is(s_WRITE_MEM) {
      state := Mux(cpu_mask.orR, s_WRITE_MEM, s_IDLE)
    }
  }
}
