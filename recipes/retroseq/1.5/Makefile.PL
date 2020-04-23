use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;
 
WriteMakefile(
    NAME         => 'RetroSeq',
    AUTHOR       => q{Thomas Keane and Rob Ness},
    PL_FILES  => {},
    EXE_FILES => [ qw(retroseq.pl) ],
    clean => { FILES => 'RetroSeq' },
);
