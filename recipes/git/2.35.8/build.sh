#!/bin/bash

set -x

# NO_INSTALL_HARDLINKS uses symlinks which makes the package 85MB slimmer (8MB instead of 93MB!)

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == 1 && "$target_platform" == "osx-arm64" ]]; then
  export ac_cv_iconv_omits_bom=no
  export ac_cv_fread_reads_directories=yes
  export ac_cv_snprintf_returns_bogus=no
fi

pushd code

# Add a place for git config files.
mkdir -p $PREFIX/etc
make configure
./configure \
    --prefix="${PREFIX}" \
    --with-gitattributes="${PREFIX}/etc/gitattributes" \
    --with-gitconfig="${PREFIX}/etc/gitconfig" \
    --with-libpcre \
    --with-iconv="${PREFIX}/lib" \
    --with-perl="${PREFIX}/bin/perl" \
    --with-tcltk="${PREFIX}/bin/tclsh"
make \
    --jobs="$CPU_COUNT" \
    NO_INSTALL_HARDLINKS=1 \
    STRIP=$STRIP \
    all strip install

# build osxkeychain
if [[ "$target_platform" == osx-* ]]; then
  pushd contrib/credential/osxkeychain
  make -e
  cp -avf git-credential-osxkeychain $PREFIX/bin
  popd
fi

if [[ -z "${REQUESTS_CA_BUNDLE}" ]] 
then
    cert_file="${PREFIX}/ssl/cacert.pem"
else
    cert_file="${REQUESTS_CA_BUNDLE}"
fi

mkdir -p $PREFIX/etc
echo "[http]"                            >  $PREFIX/etc/gitconfig
echo "        sslVerify = true"          >> $PREFIX/etc/gitconfig
echo "        sslCAPath = ${cert_file}"  >> $PREFIX/etc/gitconfig
echo "        sslCAInfo = ${cert_file}"  >> $PREFIX/etc/gitconfig

# Install completion files
mkdir -p $PREFIX/share/bash-completion/completions
cp contrib/completion/git-completion.bash $PREFIX/share/bash-completion/completions/git

popd # code

# Install manpages
mkdir -p $PREFIX/man
cp -r manpages/* $PREFIX/man
# Add symlinks in $PREFIX/share/man so that manpages work on macOS
if [[ $(uname) == "Darwin" ]]; then
  ln -s $PREFIX/man/man1/git* $PREFIX/share/man/man1/
  ln -s $PREFIX/man/man5/git* $PREFIX/share/man/man5/
  ln -s $PREFIX/man/man7/git* $PREFIX/share/man/man7/
fi

# Install htmldocs
mkdir -p $PREFIX/share/doc/git
cp -r htmldocs/* $PREFIX/share/doc/git
