#!/bin/bash

outdir=$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM
mkdir -p $outdir

ln -s $PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM $PREFIX/share/$PKG_NAME

mkdir -p $PREFIX/bin
cp -R ./* $outdir/

# Create and copy all jars

mv $outdir/batik-rasterizer-$PKG_VERSION.jar $outdir/batik-rasterizer.jar
cp $RECIPE_DIR/batik-rasterizer.py $outdir/batik-rasterizer
chmod +x $outdir/batik-rasterizer
ln -s $outdir/batik-rasterizer $PREFIX/bin

mv $outdir/batik-slideshow-$PKG_VERSION.jar $outdir/batik-slideshow.jar
cp $RECIPE_DIR/batik-slideshow.py $outdir/batik-slideshow
chmod +x $outdir/batik-slideshow
ln -s $outdir/batik-slideshow $PREFIX/bin

mv $outdir/batik-squiggle-$PKG_VERSION.jar $outdir/batik-squiggle.jar
cp $RECIPE_DIR/batik-squiggle.py $outdir/batik-squiggle
chmod +x $outdir/batik-squiggle
ln -s $outdir/batik-squiggle $PREFIX/bin

mv $outdir/batik-svgpp-$PKG_VERSION.jar $outdir/batik-svgpp.jar
cp $RECIPE_DIR/batik-svgpp.py $outdir/batik-svgpp
chmod +x $outdir/batik-svgpp
ln -s $outdir/batik-svgpp $PREFIX/bin

mv $outdir/batik-ttf2svg-$PKG_VERSION.jar $outdir/batik-ttf2svg.jar
cp $RECIPE_DIR/batik-ttf2svg.py $outdir/batik-ttf2svg
chmod +x $outdir/batik-ttf2svg
ln -s $outdir/batik-ttf2svg $PREFIX/bin
