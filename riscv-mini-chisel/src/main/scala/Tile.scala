// See LICENSE for license details.

package mini

import chisel3._
import chisel3.util._
import junctions._
import freechips.rocketchip.config.Parameters

class MemArbiterIO(implicit val p: Parameters) extends Bundle {
  val icache = Flipped(new NastiIO)
  val dcache = Flipped(new NastiIO)
  val nasti  = new NastiIO
}

class MemArbiter(implicit p: Parameters) extends Module {
  val io = IO(new MemArbiterIO)

  val s_IDLE :: s_ICACHE_READ :: s_DCACHE_READ :: s_DCACHE_WRITE :: s_DCACHE_ACK :: Nil = Enum(5)
  val state = RegInit(s_IDLE)

  // Write Address
  io.nasti.aw.bits := io.dcache.aw.bits
  io.nasti.aw.valid := io.dcache.aw.valid && state === s_IDLE
  io.dcache.aw.ready := io.nasti.aw.ready && state === s_IDLE
  io.icache.aw := DontCare

  // Write Data 
  io.nasti.w.bits  := io.dcache.w.bits
  io.nasti.w.valid := io.dcache.w.valid && state === s_DCACHE_WRITE
  io.dcache.w.ready := io.nasti.w.ready && state === s_DCACHE_WRITE
  io.icache.w := DontCare

  // Write Ack
  io.dcache.b.bits := io.nasti.b.bits
  io.dcache.b.valid := io.nasti.b.valid && state === s_DCACHE_ACK
  io.nasti.b.ready := io.dcache.b.ready && state === s_DCACHE_ACK
  io.icache.b := DontCare

  // Read Address
  io.nasti.ar.bits := NastiReadAddressChannel(
    Mux(io.dcache.ar.valid, io.dcache.ar.bits.id,   io.icache.ar.bits.id),
    Mux(io.dcache.ar.valid, io.dcache.ar.bits.addr, io.icache.ar.bits.addr),
    Mux(io.dcache.ar.valid, io.dcache.ar.bits.size, io.icache.ar.bits.size),
    Mux(io.dcache.ar.valid, io.dcache.ar.bits.len,  io.icache.ar.bits.len))
  io.nasti.ar.valid := (io.icache.ar.valid || io.dcache.ar.valid) && 
    !io.nasti.aw.valid && state === s_IDLE
  io.dcache.ar.ready := io.nasti.ar.ready && !io.nasti.aw.valid && state === s_IDLE
  io.icache.ar.ready := io.dcache.ar.ready && !io.dcache.ar.valid

  // Read Data
  io.icache.r.bits  := io.nasti.r.bits
  io.dcache.r.bits  := io.nasti.r.bits
  io.icache.r.valid := io.nasti.r.valid && state === s_ICACHE_READ
  io.dcache.r.valid := io.nasti.r.valid && state === s_DCACHE_READ
  io.nasti.r.ready := io.icache.r.ready && state === s_ICACHE_READ || 
                      io.dcache.r.ready && state === s_DCACHE_READ

  switch(state) {
    is(s_IDLE) {
      when(io.dcache.aw.fire()) {
        state := s_DCACHE_WRITE
      }.elsewhen(io.dcache.ar.fire()) {
        state := s_DCACHE_READ
      }.elsewhen(io.icache.ar.fire()) {
        state := s_ICACHE_READ
      }
    }
    is(s_ICACHE_READ) {
      when(io.nasti.r.fire() && io.nasti.r.bits.last) {
        state := s_IDLE
      }
    }
    is(s_DCACHE_READ) {
      when(io.nasti.r.fire() && io.nasti.r.bits.last) {
        state := s_IDLE
      }
    }
    is(s_DCACHE_WRITE) {
      when(io.dcache.w.fire() && io.dcache.w.bits.last) {
        state := s_DCACHE_ACK
      }
    }
    is(s_DCACHE_ACK) {
      when(io.nasti.b.fire()) {
        state := s_IDLE
      }
    }
  }
}

class TileIO(implicit val p: Parameters) extends Bundle {
//  val host  = new HostIO
//  val nasti = new NastiIO
  val rvfi = new RvfiIO
}

class RvfiIO() extends Bundle {
  val valid = Output(Bool())
  val order = Output(UInt(64.W))
  val insn = Output(UInt(32.W))
  val trap = Output(Bool())
  val halt = Output(Bool())
  val intr = Output(Bool())
  val mode = Output(UInt(2.W))
  val ixl = Output(UInt(2.W))
  val rs1_addr = Output(UInt(5.W))
  val rs2_addr = Output(UInt(5.W))
  val rs1_rdata = Output(UInt(32.W))
  val rs2_rdata = Output(UInt(32.W))
  val rd_addr = Output(UInt(5.W))
  val rd_wdata = Output(UInt(32.W))
  val pc_rdata = Output(UInt(32.W))
  val pc_wdata = Output(UInt(32.W))
  val mem_addr = Output(UInt(32.W))
  val mem_rmask = Output(UInt(4.W))
  val mem_wmask = Output(UInt(4.W))
  val mem_rdata = Output(UInt(32.W))
  val mem_wdata = Output(UInt(32.W))

//  val rvfi_csr_mcycle_rmask = Output(UInt(64.W))
//  val rvfi_csr_mcycle_wmask = Output(UInt(64.W))
//  val rvfi_csr_mcycle_rdata = Output(UInt(64.W))
//  val rvfi_csr_mcycle_wdata = Output(UInt(64.W))
//
//  val rvfi_csr_minstret_rmask = Output(UInt(64.W))
//  val rvfi_csr_minstret_wmask = Output(UInt(64.W))
//  val rvfi_csr_minstret_rdata = Output(UInt(64.W))
//  val rvfi_csr_minstret_wdata = Output(UInt(64.W))

}

trait TileBase extends core.BaseModule {
  def io: TileIO
  def clock: Clock
  def reset: core.Reset
}

class Tile(tileParams: Parameters) extends Module with TileBase {
  implicit val p = tileParams
  val io     = IO(new TileIO)
  val core   = Module(new Core)
//  val icache = Module(new Cache)
//  val dcache = Module(new Cache)
  val imemory = Module(new Memory)
  val dmemory = Module(new Memory)
//  val arb    = Module(new MemArbiter)

  io.rvfi <> core.io.rvfi

//  io.host <> core.io.host
  core.io.imemory <> imemory.io
  core.io.dmemory <> dmemory.io
//  arb.io.icache <> icache.io.nasti
//  arb.io.dcache <> dcache.io.nasti
//  io.nasti <> arb.io.nasti
}
