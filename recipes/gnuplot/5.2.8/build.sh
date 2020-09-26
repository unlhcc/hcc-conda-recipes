#!/bin/bash

export CXXFLAGS="$CXXFLAGS -std=c++11"

if [ "$(uname)" == "Linux" ]
then
	export LDFLAGS="$LDFLAGS -L $PREFIX/lib -liconv"
fi


./configure \
	--prefix=$PREFIX \
	--without-lua \
	--without-latex \
	--without-libcerf \
	--with-qt=qt4 \
	--with-readline=$PREFIX \
	--without-tutorial

export GNUTERM=dumb
make PREFIX=$PREFIX
make check PREFIX=$PREFIX
make install PREFIX=$PREFIX
