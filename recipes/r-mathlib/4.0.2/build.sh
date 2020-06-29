#!/bin/bash

aclocal -I m4
autoconf

# Filter out -std=.* from CXXFLAGS as it disrupts checks for C++ language levels.
re='(.*[[:space:]])\-std\=[^[:space:]]*(.*)'
if [[ "${CXXFLAGS}" =~ $re ]]; then
  export CXXFLAGS="${BASH_REMATCH[1]}${BASH_REMATCH[2]}"
fi

re2='(.*[[:space:]])\-I.*[^[:space:]]*(.*)'
if [[ "${CPPFLAGS}" =~ $re2 ]]; then
  export CPPFLAGS="${BASH_REMATCH[1]}${BASH_REMATCH[2]}"
fi
# if [[ "${CFLAGS}" =~ $re2 ]]; then
#   export CFLAGS="${BASH_REMATCH[1]}${BASH_REMATCH[2]}"
# fi
re3='(.*[[:space:]])\-L.*[^[:space:]]*(.*)'
if [[ "${CPPFLAGS}" =~ $re3 ]]; then
  export CPPFLAGS="${BASH_REMATCH[1]}${BASH_REMATCH[2]}"
fi
# if [[ "${CFLAGS}" =~ $re3 ]]; then
#   export CFLAGS="${BASH_REMATCH[1]}${BASH_REMATCH[2]}"
# fi
# if [[ "${LDFLAGS}" =~ $re3 ]]; then
#   export LDFLAGS="${BASH_REMATCH[1]}${BASH_REMATCH[2]}"
# fi

# Without this, dependency scanning fails (but with it CDT libuuid / Xt fails to link
# which we hack around with config.site)
export CPPFLAGS="${CPPFLAGS} -I$PREFIX/include"

export TCL_CONFIG=${PREFIX}/lib/tclConfig.sh
export TK_CONFIG=${PREFIX}/lib/tkConfig.sh
export TCL_LIBRARY=${PREFIX}/lib/tcl8.6
export TK_LIBRARY=${PREFIX}/lib/tk8.6
# BUILD_PREFIX does not get considered for prefix replacement.
[[ -n ${AR} ]] && export AR=$(basename ${AR})
[[ -n ${CC} ]] && export CC=$(basename ${CC})
[[ -n ${GCC} ]] && export GCC=$(basename ${GCC})
[[ -n ${CXX} ]] && export CXX=$(basename ${CXX})
[[ -n ${F77} ]] && export F77=$(basename ${F77})
[[ -n ${FC} ]] && export FC=$(basename ${FC})
[[ -n ${LD} ]] && export LD=$(basename ${LD})
[[ -n ${RANLIB} ]] && export RANLIB=$(basename ${RANLIB})
[[ -n ${STRIP} ]] && export STRIP=$(basename ${STRIP})
export OBJC=${CC}
INSTALL_NAME_TOOL=${INSTALL_NAME_TOOL:-install_name_tool}

Linux() {
    # If lib/R/etc/javaconf ends up with anything other than ~autodetect~
    # for any value (except JAVA_HOME) then 'R CMD javareconf' will never
    # change it, so we prevent configure from finding Java.  post-install
    # and activate scripts now call 'R CMD javareconf'.
    unset JAVA_HOME

    export CPPFLAGS="${CPPFLAGS} -Wl,-rpath-link,${PREFIX}/lib"
    export LDFLAGS="${LDFLAGS} -Wl,-rpath-link,${PREFIX}/lib"

    mkdir -p ${PREFIX}/lib
    # Tricky libuuid resolution issues against CentOS6's libSM. I may need to add some symbols to our libuuid library.
    # Works for configure:
    # . /opt/conda/bin/activate /home/rdonnelly/r-base-bld/_build_env
    # x86_64-conda_cos6-linux-gnu-cc -o conftest -L/home/rdonnelly/r-base-bld/_build_env/x86_64-conda_cos6-linux-gnu/sysroot/usr/lib64 conftest.c -lXt -lX11 -lrt -ldl -lm -luuid -L$PREFIX/lib -licuuc -licui18n
    # if [[ ${ARCH} == 32 ]]; then
    #   export CPPFLAGS="-L${BUILD_PREFIX}/${HOST}/sysroot/usr/lib ${CPPFLAGS}"
    #   export CFLAGS="-I${BUILD_PREFIX}/${HOST}/sysroot/usr/lib ${CFLAGS}"
    #   export CXXFLAGS="-I${BUILD_PREFIX}/${HOST}/sysroot/usr/lib ${CXXFLAGS}"
    # else
    #   export CPPFLAGS="-L${BUILD_PREFIX}/${HOST}/sysroot/usr/lib64 ${CPPFLAGS}"
    #   export CFLAGS="-I${BUILD_PREFIX}/${HOST}/sysroot/usr/lib64 ${CFLAGS}"
    #   export CXXFLAGS="-I${BUILD_PREFIX}/${HOST}/sysroot/usr/lib64 ${CXXFLAGS}"
    # fi
    echo "ac_cv_lib_Xt_XtToolkitInitialize=yes" > config.site
    export CONFIG_SITE=${PWD}/config.site
    ./configure --prefix=${PREFIX}               \
                --host=${HOST}                   \
                --build=${BUILD}                 \
                --enable-shared                  \
                --enable-R-shlib                 \
                --with-blas=-lblas               \
                --with-lapack=-llapack           \
                --disable-prebuilt-html          \
                --enable-memory-profiling        \
                --with-tk-config=${TK_CONFIG}    \
                --with-tcl-config=${TCL_CONFIG}  \
                --with-x                         \
                --with-pic                       \
                --with-cairo                     \
                --with-readline                  \
                --with-recommended-packages=no   \
                --without-libintl-prefix         \
                LIBnn=lib

    if cat src/include/config.h | grep "undef HAVE_PANGOCAIRO"; then
        echo "Did not find pangocairo, refusing to continue"
        cat config.log | grep pango
        exit 1
    fi

    pushd src/nmath/standalone
    make
    make install
}


Darwin() {
    unset JAVA_HOME

    # --without-internal-tzcode to avoid warnings:
    # unknown timezone 'Europe/London'
    # unknown timezone 'GMT'
    # https://stat.ethz.ch/pipermail/r-devel/2014-April/068745.html

    # May want to strip these from Makeconf at the end.
    CFLAGS="-isysroot ${CONDA_BUILD_SYSROOT} "${CFLAGS}
    LDFLAGS="-Wl,-dead_strip_dylibs -isysroot ${CONDA_BUILD_SYSROOT} "${LDFLAGS}
    CPPFLAGS="-isysroot ${CONDA_BUILD_SYSROOT} "${CPPFLAGS}

    # Our libuuid causes problems:
    # In file included from qdPDF.c:29:
    # In file included from ./qdPDF.h:3:
    # In file included from ../../../../include/R_ext/QuartzDevice.h:103:
    # In file included from /opt/MacOSX10.9.sdk/System/Library/Frameworks/ApplicationServices.framework/Headers/ApplicationServices.h:23:
    # In file included from /opt/MacOSX10.9.sdk/System/Library/Frameworks/CoreServices.framework/Headers/CoreServices.h:23:
    # In file included from /opt/MacOSX10.9.sdk/System/Library/Frameworks/CoreServices.framework/Frameworks/AE.framework/Headers/AE.h:20:
    # In file included from /opt/MacOSX10.9.sdk/System/Library/Frameworks/CoreServices.framework/Frameworks/CarbonCore.framework/Headers/CarbonCore.h:208:
    # In file included from /opt/MacOSX10.9.sdk/System/Library/Frameworks/CoreServices.framework/Frameworks/CarbonCore.framework/Headers/HFSVolumes.h:25:
    # .. apart from this issue there seems to be a segfault:
    # https://rt.cpan.org/Public/Bug/Display.html?id=104394
    # http://openradar.appspot.com/radar?id=6069753579831296
    # .. anyway, uuid is part of libc on Darwin, so let's just try to use that.
    rm -f "${PREFIX}"/include/uuid/uuid.h

    # Make sure curl is found from PREFIX instead of BUILD_PREFIX
    rm "${BUILD_PREFIX}/bin/curl-config"

    ./configure --prefix=${PREFIX}                  \
                --host=${HOST}                      \
                --build=${BUILD}                    \
                --with-sysroot=${CONDA_BUILD_SYSROOT}  \
                --enable-shared                     \
                --enable-R-shlib                    \
                --with-tk-config=${TK_CONFIG}       \
                --with-tcl-config=${TCL_CONFIG}     \
                --with-blas=-lblas                  \
                --with-lapack=-llapack              \
                --enable-R-shlib                    \
                --enable-memory-profiling           \
                --without-x                         \
                --without-internal-tzcode           \
                --enable-R-framework=no             \
                --with-included-gettext=yes         \
                --with-recommended-packages=no || (cat config.log; false)

    # Horrendous hack to make up for what seems to be bugs (or over-cautiousness?) in ld64's -dead_strip_dylibs (and/or -no_implicit_dylibs)
    sed -i'.bak' 's|-lgobject-2.0 -lglib-2.0 -lintl||g' src/library/grDevices/src/cairo/Makefile
    rm src/library/grDevices/src/cairo/Makefile.bak

    pushd src/nmath/standalone
    make
    make install

}

if [[ $target_platform == osx-64 ]]; then
  Darwin
elif [[ $target_platform =~ .*linux.* ]]; then
  Linux
fi
