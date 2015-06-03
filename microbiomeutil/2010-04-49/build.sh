mkdir -pv ${PREFIX}/bin
make 
make test
cp -R {ChimeraSlayer,NAST-iEr,WigeoN,RESOURCES} ${PREFIX}/bin
