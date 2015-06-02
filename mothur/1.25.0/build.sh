mkdir -pv $PREFIX/bin
cd Mothur.source
chmod +x uchime_src/mk
make -j 4
cp {mothur,uchime} $PREFIX/bin
