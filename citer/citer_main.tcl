#!/usr/bin/env tclsh

# Standalone executable for the package citer

source [file join [file dirname [info script]] citer.tcl] 

if {[info exists argv0] && $argv0 eq [info script] && [regexp citer $argv0]} {
    proc usage {} {
        puts "Usage: tclmain -m citer main ?BIBFILE? ?KEY1 KEY2 ...?\n"
        puts "  Displays all keys for a given Bibtex file or\n"
        puts "  outputs the references for the given key(s)"
        puts "  Possible  OUTFILE file extensions are svg (default), png, pdf!"
        puts "\nExamples:\n"
        puts "  tclmain -m citer main assets/literature.bib           -> shows all references in this file"
        puts "  tclmain -m citer main assets/literature.bib Groth2013 -> shows this reference from the file"
    }
    if {[llength $argv] > 0} {
        if {[lindex $argv 0] eq "--help"} {
            citer::usage
        } elseif  {[lindex $argv 0] eq "--version"} {
            puts "[package present citer]"
        } elseif {[lindex $argv 0] eq "--test"} {
            package require tcltest
            set argv [list] 
            tcltest::test dummy-1.1 {
                Calling my proc should always return a list of at least length 3
            } -body {
                set result 1
            } -result {1}
            tcltest::cleanupTests
            catch { destroy . }
        } else {
            set filename [lindex $argv 0]
            set keys [lrange $argv 1 end]
            if {[llength $keys] == 0} {
                foreach key [citer::getKeys $filename] {
                    puts $key
                }
            } else {
                foreach key $keys {
                    puts [citer::getReference $filename $key]
                }
            }
        }
    } else {
        citer::usage
    }   
}

