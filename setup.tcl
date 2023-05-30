# setup file for tclinstaller.tcl

array set setup {
  name citer
  version 0.1.0
  url https://github.com/mittelmark/citer
  author {Detlef Groth}
  license {BSD 3.0}
  include {citer/*.tcl citer/citer.md}
}

if {$::argv0 eq [info script]} {
    package require tclinstall
    set ::argv0 "tclinstall"
    tclinstall::install [info script]
}
