use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Schedule::SGELK',
    AUTHOR           => q{Lee Katz <lkatz@cdc.gov>},
    VERSION          => '2019.01.28',
    ABSTRACT         => 'Perl module for scheduling tasks, with only using qsub/qstat/qdel',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    PREREQ_PM => {
        'Data::Dumper'       => 0,
        'File::Basename'     => 0,
        'File::Spec'         => 0,
        'File::Slurp'        => 0,
        'File::Temp'         => 0,
        'String::Escape'     => 0,
    },
);
