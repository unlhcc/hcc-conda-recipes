## 
## Makefile.am 
##

AM_CFLAGS=-I$(top_srcdir)/include -I$(top_srcdir)/include/dicom
AM_LDFLAGS=

bin_PROGRAMS = mri_cal_normalize mri_ca_normalize
mri_cal_normalize_SOURCES=mri_cal_normalize.c
mri_cal_normalize_LDADD= $(addprefix $(top_builddir)/, $(LIBS_MGH))
mri_cal_normalize_LDFLAGS=$(OS_LDFLAGS)


mri_ca_normalize_SOURCES=mri_ca_normalize.c
mri_ca_normalize_LDADD= $(addprefix $(top_builddir)/, $(LIBS_MGH))
mri_ca_normalize_LDFLAGS=$(OS_LDFLAGS)

foodir=$(prefix)/docs/xml
foo_DATA=mri_ca_normalize.help.xml
foo2dir=$(prefix)/docs/html

# trick to get test data into the build directory (during make distcheck)
foo_SOURCES=
foo:
	if ! test -f "$(top_builddir)/distribution/average/RB_all_2016-05-10.vc700.gca"; \
	then \
		cp -v $(top_srcdir)/distribution/average/RB_all_2016-05-10.vc700.gca \
					$(top_builddir)/distribution/average/; fi;
	if ! test -f "$(top_builddir)/mri_ca_normalize/testdata.tar.gz"; then \
		cp -v $(top_srcdir)/mri_ca_normalize/testdata.tar.gz \
					$(top_builddir)/mri_ca_normalize/; fi;

check_PROGRAMS=foo

TESTS=test_mri_ca_normalize $(top_builddir)/scripts/help_xml_validate

clean-local:
	rm -f $(BUILT_SOURCES)

EXTRA_DIST=testdata.tar.gz test_mri_ca_normalize $(foo_DATA) $(BUILT_SOURCES)

# Our release target. Include files to be excluded here. They will be
# found and removed after 'make install' is run during the 'make
# release' target.
EXCLUDE_FILES=""
include $(top_srcdir)/Makefile.extra

BUILT_SOURCES=mri_ca_normalize.help.xml.h
