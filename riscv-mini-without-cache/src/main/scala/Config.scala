// See LICENSE for license details.

package mini

import chisel3.Module
import freechips.rocketchip.config.{Config, Field, Parameters}
import junctions._


case object NWays extends Field[Int]
case object NSets extends Field[Int]
case object CacheBlockBytes extends Field[Int]
case object NBytes extends Field[Int]

class MiniConfig extends Config((site, here, up) => {
    // Core
    case XLEN => 32
    case Trace => true
    case BuildALU    => (p: Parameters) => Module(new ALUArea()(p))
    case BuildImmGen => (p: Parameters) => Module(new ImmGenWire()(p))
    case BuildBrCond => (p: Parameters) => Module(new BrCondArea()(p))
    // Cache
    case NWays => 1 // TODO: set-associative
    case NSets => 256 
    case CacheBlockBytes => 4 * (here(XLEN) >> 3) // 4 x 32 bits = 16B
    // Memory
    case NBytes => 0x1000
    // NastiIO
    case NastiKey => new NastiParameters(
      idBits   = 5,
      dataBits = 64,
      addrBits = here(XLEN))
  }
)
