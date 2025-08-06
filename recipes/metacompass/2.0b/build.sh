#!/bin/bash
set -eu -o pipefail


mkdir -p ${PREFIX}/bin
mkdir -p ${PREFIX}/lib

cp -rf ${SRC_DIR}/MetaCompass-2.0-beta $PREFIX/lib/metacompass

cd $PREFIX/lib/metacompass

${CXX} -Wall -W -O3 -o ./bin/extractSeq ./src/utils/extractSeq.cpp
${CXX} -Wall -W -O3 -o ./bin/formatFASTA ./src/utils/formatFASTA.cpp
${CXX} -Wall -W -O3 -std=gnu++11 -o bin/breadth src/utils/breadth.cpp
${CXX} -Wall -W -O3 -std=gnu++11 -o bin/extractContigs src/utils/extractContigs.cpp
${CXX} -Wall -W -O3 -std=gnu++11 -o bin/processmash src/utils/processmash.cpp
${CXX} -Wall -W -O3 -std=gnu++11 -o bin/fq2fa src/utils/fq2fa.cpp
${CXX} -Wall -W -O3 -o ./bin/buildcontig ./src/buildcontig/buildcontig.cpp ./src/buildcontig/cmdoptions.cpp ./src/buildcontig/memory.cpp ./src/buildcontig/procmaps.cpp ./src/buildcontig/outputfiles.cpp

cp ${SRC_DIR}/kmer-mask ${PREFIX}/bin/kmer-mask
chmod +x ${PREFIX}/bin/kmer-mask

ln -sf $PREFIX/lib/metacompass/go_metacompass.py $PREFIX/bin/go_metacompass.py
ln -sf "${PREFIX}/lib/metacompass/bin/extractSeq"     "${PREFIX}/bin/extractSeq"     
ln -sf "${PREFIX}/lib/metacompass/bin/formatFASTA"   "${PREFIX}/bin/formatFASTA"  
ln -sf "${PREFIX}/lib/metacompass/bin/buildcontig"   "${PREFIX}/bin/buildcontig"   
ln -sf "${PREFIX}/lib/metacompass/bin/breadth"       "${PREFIX}/bin/breadth"      
ln -sf "${PREFIX}/lib/metacompass/bin/extractContigs" "${PREFIX}/bin/extractContigs" 
ln -sf "${PREFIX}/lib/metacompass/bin/processmash"   "${PREFIX}/bin/processmash"   
ln -sf "${PREFIX}/lib/metacompass/bin/fq2fa"         "${PREFIX}/bin/fq2fa"       
