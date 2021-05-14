// See LICENSE for license details.

package mini

import chisel3._
import chisel3.util._
import freechips.rocketchip.config.Parameters

object Const {
  val PC_START = 0x200
  val PC_EVEC  = 0x100
}

class DatapathIO(implicit p: Parameters) extends CoreBundle()(p) {
//  val host = new HostIO
  val imemory = Flipped(new MemoryIO)
  val dmemory = Flipped(new MemoryIO)
  val ctrl = Flipped(new ControlSignals)
  val rvfi = new RvfiIO
}

class Datapath(implicit val p: Parameters) extends Module with CoreParams {
  val io      = IO(new DatapathIO)
  val csr     = Module(new CSR)
  val regFile = Module(new RegFile)
  val alu     = p(BuildALU)(p)
  val immGen  = p(BuildImmGen)(p)
  val brCond  = p(BuildBrCond)(p)


  import Control._


  /********* RVFI   ********************/
  val rvfi_valid_reg = RegInit(false.B)
  val rvfi_order_reg = RegInit(0.U(64.W))
  val rvfi_insn_reg = RegInit(0.U(32.W))
  val rvfi_trap_reg = RegInit(false.B)
  val rvfi_halt_reg = RegInit(false.B)
  val rvfi_intr_reg = RegInit(false.B)
  val rvfi_mode_reg = RegInit(3.U(2.W))
  val rvfi_ixl_reg = RegInit(1.U(2.W))
  val rvfi_rs1_addr_reg = RegInit(0.U(5.W))
  val rvfi_rs2_addr_reg = RegInit(0.U(5.W))
  val rvfi_rs1_rdata_reg = RegInit(0.U(32.W))
  val rvfi_rs2_rdata_reg = RegInit(0.U(32.W))
  val rvfi_rd_addr_reg = RegInit(0.U(5.W))
  val rvfi_rd_wdata_reg = RegInit(0.U(32.W))
  val rvfi_pc_rdata_reg = RegInit(0.U(32.W))
  val rvfi_pc_wdata_reg = RegInit(0.U(32.W))
  val rvfi_mem_addr_reg = RegInit(0.U(32.W))
  val rvfi_mem_rmask_reg = RegInit(0.U(4.W))
  val rvfi_mem_wmask_reg = RegInit(0.U(4.W))
  val rvfi_mem_rdata_reg = RegInit(0.U(32.W))
  val rvfi_mem_wdata_reg = RegInit(0.U(32.W))

  io.rvfi.valid := rvfi_valid_reg
  io.rvfi.order := rvfi_order_reg
  io.rvfi.insn := rvfi_insn_reg
  io.rvfi.trap := rvfi_trap_reg
  io.rvfi.halt := rvfi_halt_reg
  io.rvfi.intr := rvfi_intr_reg
  io.rvfi.mode := rvfi_mode_reg
  io.rvfi.ixl := rvfi_ixl_reg
  io.rvfi.rs1_addr := rvfi_rs1_addr_reg
  io.rvfi.rs2_addr := rvfi_rs2_addr_reg
  io.rvfi.rs1_rdata := rvfi_rs1_rdata_reg
  io.rvfi.rs2_rdata := rvfi_rs2_rdata_reg
  io.rvfi.rd_addr := rvfi_rd_addr_reg
  io.rvfi.rd_wdata := rvfi_rd_wdata_reg
  io.rvfi.pc_rdata := rvfi_pc_rdata_reg
  io.rvfi.pc_wdata := rvfi_pc_wdata_reg
  io.rvfi.mem_addr := rvfi_mem_addr_reg
  io.rvfi.mem_rmask := rvfi_mem_rmask_reg
  io.rvfi.mem_wmask := rvfi_mem_wmask_reg
  io.rvfi.mem_rdata := rvfi_mem_rdata_reg
  io.rvfi.mem_wdata := rvfi_mem_wdata_reg


  /***** Fetch / Execute Registers *****/
  val fe_inst = RegInit(Instructions.NOP)
  val fe_pc   = Reg(UInt())

  /***** Execute / Write Back Registers *****/
  val ew_inst = RegInit(Instructions.NOP)
  val ew_pc   = Reg(UInt())
  val ew_alu  = Reg(UInt())
  val csr_in  = Reg(UInt())

  // rvfi ...
  val ew_rs1_addr = Reg(UInt(5.W))
  val ew_rs2_addr = Reg(UInt(5.W))
  val ew_rs1_rdata = Reg(UInt(32.W))
  val ew_rs2_rdata = Reg(UInt(32.W))
  val ew_mem_addr = Reg(UInt(32.W))
  val ew_mem_rmask = Reg(UInt(4.W))
  val ew_mem_wmask = Reg(UInt(4.W))
  val ew_mem_wdata = Reg(UInt(32.W))

  /****** Control signals *****/
  val st_type  = Reg(io.ctrl.st_type.cloneType)
  val ld_type  = Reg(io.ctrl.ld_type.cloneType)
  val wb_sel   = Reg(io.ctrl.wb_sel.cloneType)
  val wb_en    = Reg(Bool())
  val csr_cmd  = Reg(io.ctrl.csr_cmd.cloneType)
  val illegal  = Reg(Bool())
  val pc_check = Reg(Bool())
 
  /****** Fetch *****/
  val started = RegNext(reset.toBool)
  val stall = !io.imemory.resp.valid || !io.dmemory.resp.valid
  val pc   = RegInit(Const.PC_START.U(xlen.W) - 4.U(xlen.W))
  val npc  = Mux(stall, pc, Mux(csr.io.expt, csr.io.evec,
             Mux(io.ctrl.pc_sel === PC_EPC,  csr.io.epc,
             Mux(io.ctrl.pc_sel === PC_ALU || brCond.io.taken, alu.io.sum >> 1.U << 1.U,
             Mux(io.ctrl.pc_sel === PC_0, pc, pc + 4.U)))))
  val inst = Mux(started || io.ctrl.inst_kill || brCond.io.taken || csr.io.expt, Instructions.NOP, io.imemory.resp.bits.data)
  pc                      := npc 
  io.imemory.req.bits.addr := npc
  io.imemory.req.bits.data := 0.U
  io.imemory.req.bits.mask := 0.U
  io.imemory.req.valid     := !stall
  io.imemory.abort         := false.B
 
  // Pipelining
  when (!stall) {
    fe_pc   := pc
    fe_inst := inst
  }

  /****** Execute *****/
  // Decode
  io.ctrl.inst  := fe_inst

  // regFile read
  val rs1_addr = fe_inst(19, 15)
  val rs2_addr = fe_inst(24, 20)
  regFile.io.raddr1 := rs1_addr
  regFile.io.raddr2 := rs2_addr

  // gen immdeates
  immGen.io.inst := fe_inst
  immGen.io.sel  := io.ctrl.imm_sel

  // bypass
  val wb_rd_addr = ew_inst(11, 7)
  val rs1hazard = wb_en && rs1_addr.orR && (rs1_addr === wb_rd_addr)
  val rs2hazard = wb_en && rs2_addr.orR && (rs2_addr === wb_rd_addr)
  val rs1 = Mux(wb_sel === WB_ALU && rs1hazard, ew_alu, regFile.io.rdata1)
  val rs2 = Mux(wb_sel === WB_ALU && rs2hazard, ew_alu, regFile.io.rdata2)
 
  // ALU operations
  alu.io.A := Mux(io.ctrl.A_sel === A_RS1, rs1, fe_pc)
  alu.io.B := Mux(io.ctrl.B_sel === B_RS2, rs2, immGen.io.out)
  alu.io.alu_op := io.ctrl.alu_op

  // Branch condition calc
  brCond.io.rs1 := rs1 
  brCond.io.rs2 := rs2
  brCond.io.br_type := io.ctrl.br_type

  // D$ access
  val daddr   = Mux(stall, ew_alu, alu.io.sum) >> 2.U << 2.U
  val woffset = alu.io.sum(1) << 4.U | alu.io.sum(0) << 3.U
  val ddata   = rs2 << woffset
  val mem_wmask = Wire(UInt(4.W))
  mem_wmask := MuxLookup(Mux(stall, st_type, io.ctrl.st_type),
    "b0000".U, Seq(
      ST_SW ->  "b1111".U,
      ST_SH -> ("b11".U << alu.io.sum(1,0)),
      ST_SB -> ("b1".U  << alu.io.sum(1,0))))
  io.dmemory.req.valid     := !stall && (io.ctrl.st_type.orR || io.ctrl.ld_type.orR)
  io.dmemory.req.bits.addr := daddr
  io.dmemory.req.bits.data := ddata
  io.dmemory.req.bits.mask := mem_wmask


  
  // Pipelining
  when(reset.toBool || !stall && csr.io.expt) {
    st_type   := 0.U
    ld_type   := 0.U
    wb_en     := false.B
    csr_cmd   := 0.U
    illegal   := false.B
    pc_check  := false.B
  }.elsewhen(!stall && !csr.io.expt) {
    ew_pc     := fe_pc
    ew_inst   := fe_inst
    ew_alu    := alu.io.out
    csr_in    := Mux(io.ctrl.imm_sel === IMM_Z, immGen.io.out, rs1)
    st_type   := io.ctrl.st_type
    ld_type   := io.ctrl.ld_type
    wb_sel    := io.ctrl.wb_sel
    wb_en     := io.ctrl.wb_en
    csr_cmd   := io.ctrl.csr_cmd
    illegal   := io.ctrl.illegal
    pc_check  := io.ctrl.pc_sel === PC_ALU

    // rvfi...
    ew_rs1_addr := rs1_addr
    ew_rs2_addr := rs2_addr
    ew_rs1_rdata := rs1
    ew_rs2_rdata := rs2
    ew_mem_addr := daddr
    ew_mem_rmask := Mux(mem_wmask.orR, 0.U, ~0.U)
    ew_mem_wmask := mem_wmask
    ew_mem_wdata := ddata

  }

  // Load
  val loffset = ew_alu(1) << 4.U | ew_alu(0) << 3.U
  val lshift  = io.dmemory.resp.bits.data >> loffset
  val load    = Wire(SInt(xlen.W))
  load := MuxLookup(ld_type, io.dmemory.resp.bits.data.zext, Seq(
    LD_LH  -> lshift(15, 0).asSInt, LD_LB  -> lshift(7, 0).asSInt,
    LD_LHU -> lshift(15, 0).zext,   LD_LBU -> lshift(7, 0).zext))
    
  // CSR access
  csr.io.stall    := stall
  csr.io.in       := csr_in
  csr.io.cmd      := csr_cmd
  csr.io.inst     := ew_inst
  csr.io.pc       := ew_pc
  csr.io.addr     := ew_alu
  csr.io.illegal  := illegal
  csr.io.pc_check := pc_check
  csr.io.ld_type  := ld_type
  csr.io.st_type  := st_type
//  io.host <> csr.io.host

  // Regfile Write
  val regWrite = Wire(UInt(32.W))
  regWrite := MuxLookup(wb_sel, ew_alu.zext, Seq(
    WB_MEM -> load,
    WB_PC4 -> (ew_pc + 4.U).zext,
    WB_CSR -> csr.io.out.zext) ).asUInt

  when(wb_rd_addr === 0.U) {
    regWrite := 0.U
  }

  regFile.io.wen   := wb_en && !stall && !csr.io.expt 
  regFile.io.waddr := wb_rd_addr
  regFile.io.wdata := regWrite

  // Abort store when there's an excpetion
  io.dmemory.abort := csr.io.expt

  if (p(Trace)) {
    printf("PC: %x, INST: %x, REG[%d] <- %x\n", ew_pc, ew_inst,
      Mux(regFile.io.wen, wb_rd_addr, 0.U),
      Mux(regFile.io.wen, regFile.io.wdata, 0.U))
  }


  // rvfi...
  rvfi_valid_reg := !stall && !csr.io.expt && ew_inst =/= Instructions.NOP
  rvfi_order_reg := rvfi_order_reg + rvfi_valid_reg

  rvfi_insn_reg := ew_inst
  rvfi_trap_reg := stall
  rvfi_halt_reg := stall
  rvfi_intr_reg := false.B
  rvfi_mode_reg := 3.U
  rvfi_ixl_reg := 1.U

  rvfi_rs1_addr_reg := ew_rs1_addr
  rvfi_rs2_addr_reg := ew_rs2_addr
  rvfi_rs1_rdata_reg := ew_rs1_rdata
  rvfi_rs2_rdata_reg := ew_rs2_rdata
  rvfi_rd_addr_reg := Mux(wb_en, wb_rd_addr, 0.U)
  rvfi_rd_wdata_reg := Mux(wb_en, regWrite, 0.U)

  rvfi_pc_rdata_reg := ew_pc
  rvfi_pc_wdata_reg := Mux(fe_inst === Instructions.NOP, pc, fe_pc)

  rvfi_mem_addr_reg := ew_mem_addr
  rvfi_mem_rmask_reg := ew_mem_rmask
  rvfi_mem_wmask_reg := ew_mem_wmask
  rvfi_mem_rdata_reg := load.asUInt
  rvfi_mem_wdata_reg := ew_mem_wdata

}
