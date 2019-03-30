use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;
 
WriteMakefile(
    NAME         => 'DotLib',
    AUTHOR       => q{Marten Boetzer and Walter Pirovano},
    VERSION_FROM => 'lib/DotLib.pm',
    PL_FILES  => {},
    EXE_FILES => [ qw(SSPACE_Standard_v3.0.pl) ],
    clean => { FILES => 'DotLib' },
);
