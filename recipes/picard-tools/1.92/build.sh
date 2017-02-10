mkdir -p ${PREFIX}/bin
ant -lib lib/ant package-commands
cp -R dist/* ${PREFIX}/bin
