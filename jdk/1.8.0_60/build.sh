mkdir -p ${PREFIX}/bin
mkdir -p ${PREFIX}/lib/jvm

cp -R ${SRC_DIR} ${PREFIX}/lib/jvm/
ln -s ${PREFIX}/lib/jvm/jdk1.8.0_60 ${PREFIX}/lib/jvm/jdk

FILELIST=`ls -1 ${PREFIX}/lib/jvm/jdk1.8.0_60/bin`
for file in $FILELIST; 
  do ln -s ${PREFIX}/lib/jvm/jdk1.8.0_60/bin/$file ${PREFIX}/bin/$file
done
