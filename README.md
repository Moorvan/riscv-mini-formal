# riscv-mini-formal
通过使用 riscv-formal 框架验证 riscv-mini

riscv-mini  参考：[ucb-bar/riscv-mini: Simple RISC-V 3-stage Pipeline in Chisel (github.com)](https://github.com/ucb-bar/riscv-mini) 此处 riscv-mini-chisel 屏蔽了设计中和内存、host 交互部分的接口 ，同时实现了对 RISCV-formal 的接口支持。

riscv-formal 参考：[SymbioticEDA/riscv-formal: RISC-V Formal Verification Framework (github.com)](https://github.com/SymbioticEDA/riscv-formal) 此处在 ./riscv-formal/cores/ 下增加了对 riscv-mini 的支持