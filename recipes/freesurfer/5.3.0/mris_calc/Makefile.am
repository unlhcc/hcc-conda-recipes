##
## Makefile.am 
##

AM_CFLAGS=-I$(top_srcdir)/include
AM_CXXFLAGS=-I$(top_srcdir)/include

bin_PROGRAMS = mris_calc

mris_calc_SOURCES=mris_calc.c mris_calc.help.xml.h
mris_calc_LDADD= $(addprefix $(top_builddir)/, $(LIBS_MGH))
mris_calc_LDFLAGS=$(OS_LDFLAGS)

foodir=$(prefix)/docs/xml
foo_DATA=mris_calc.help.xml

TESTS=$(top_builddir)/scripts/help_xml_validate

clean-local:
	rm -f $(BUILT_SOURCES) 

EXTRA_DIST=$(foo_DATA) $(BUILT_SOURCES)

EXCLUDE_FILES=
include $(top_srcdir)/Makefile.extra

BUILT_SOURCES=mris_calc.help.xml.h

