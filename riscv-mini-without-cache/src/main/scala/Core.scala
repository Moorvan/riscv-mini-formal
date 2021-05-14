// See LICENSE for license details.

package mini

import chisel3._
import chisel3.util.Valid
import freechips.rocketchip.config.{Parameters, Field}

case object XLEN extends Field[Int]
case object Trace extends Field[Boolean]
case object BuildALU extends Field[Parameters => ALU]
case object BuildImmGen extends Field[Parameters => ImmGen]
case object BuildBrCond extends Field[Parameters => BrCond]

abstract trait CoreParams {
  implicit val p: Parameters
  val xlen = p(XLEN)
}

abstract class CoreBundle(implicit val p: Parameters) extends Bundle with CoreParams

//class HostIO(implicit p: Parameters) extends CoreBundle()(p) {
//  val fromhost = Flipped(Valid( UInt(xlen.W)))
//  val tohost   = Output(UInt(xlen.W))
//}

class CoreIO(implicit p: Parameters) extends CoreBundle()(p) {
//  val host = new HostIO
  val rvfi = new RvfiIO
  val imemory = Flipped(new MemoryIO)
  val dmemory = Flipped(new MemoryIO)
}

class Core(implicit val p: Parameters) extends Module with CoreParams {
  val io = IO(new CoreIO)
  val dpath = Module(new Datapath)
  val ctrl  = Module(new Control)

  io.rvfi <> dpath.io.rvfi
  dpath.io.imemory <> io.imemory
  dpath.io.dmemory <> io.dmemory
  dpath.io.ctrl <> ctrl.io
}
