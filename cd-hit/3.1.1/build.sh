mkdir -pv $PREFIX/bin
make
cp {cd-hit,mcd-hit,cd-hit-est,cd-hit-2d,cd-hit-est-2d,cd-hit-div} $PREFIX/bin
cp *.pl $PREFIX/bin
