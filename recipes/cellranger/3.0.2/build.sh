#!/bin/bash

# copy executables
cp cellranger-shell ${PREFIX}/bin/
cp cellranger-cs/3.0.2/bin/{aggr,cellranger,count,mat2csv,mkfastq,mkgtf,mkref,mkvdjref,reanalyze,testrun,vdj} ${PREFIX}/bin/
cp cellranger-cs/3.0.2/tenkit/bin/{check_fastq_params,check_fastq_paths,demux,docopts,get_flowcell,get_max_index_len,_mkfastq,sitecheck,tarmri,_truncate,upload} ${PREFIX}/bin
cp cellranger-cs/3.0.2/tenkit/lib/bin/{barcodeqc,godemux,q30count} ${PREFIX}/bin/
cp cellranger-cs/3.0.2/lib/bin/{annotate_reads,bamtofastq,chunk_reads,convert,crconverter,cr_stage,detect_chemistry,fetch-imgt,louvain,vdj_asm,vlconverter} ${PREFIX}/bin/
cp -r cellranger-cs/3.0.2/bin/common* ${PREFIX}/bin
mkdir -p ${PREFIX}/bin/tenkit/bin
cp -r cellranger-cs/3.0.2/tenkit/bin/common* ${PREFIX}/bin/tenkit/bin


# copy tenxpy library, GitHub url is broken :/
mkdir -p ${PREFIX}/lib/python2.7/site-packages
cp -r miniconda-cr-cs/4.3.21-miniconda-cr-cs-c10/lib/python2.7/site-packages/tenxpy* ${PREFIX}/lib/python2.7/site-packages/


# copy MRO directories
mkdir -p ${PREFIX}/share/cellranger
mkdir -p ${PREFIX}/share/cellranger/tenkit
cp -r cellranger-cs/3.0.2/mro* ${PREFIX}/share/cellranger
cp -r cellranger-cs/3.0.2/tenkit/mro* ${PREFIX}/share/cellranger/tenkit


# copy other Python libraries
cp -r cellranger-cs/3.0.2/lib/python/* ${PREFIX}/lib/python2.7/site-packages/
cp -r cellranger-cs/3.0.2/tenkit/lib/python/* ${PREFIX}/lib/python2.7/site-packages/


# Martian looks in $PREFIX for adapters and jobmanagers files...
ln -s ${PREFIX}/share/martian-3.2.2/jobmanagers/ ${PREFIX}
ln -s ${PREFIX}/share/martian-3.2.2/adapters/ ${PREFIX}



# set source.bash variables on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d

if [ ! -f ${PREFIX}/etc/conda/activate.d/env_vars.sh ]; then
    echo "#!/bin/bash" > ${PREFIX}/etc/conda/activate.d/env_vars.sh
fi
echo "export LD_LIBRARY_PATH=${PREFIX}/lib:${LD_LIBRARY_PATH}" >> ${PREFIX}/etc/conda/activate.d/env_vars.sh
echo "export MROPATH=${PREFIX}/share/cellranger/mro:${PREFIX}/share/cellranger/tenkit/mro:${MROPATH}" >> ${PREFIX}/etc/conda/activate.d/env_vars.sh
echo "export PYTHONPATH=${PREFIX}/lib/python2.7/site-packages:${PREFIX}/bin:${PYTHONPATH}" >> ${PREFIX}/etc/conda/activate.d/env_vars.sh
echo "export TENX_SCRIPTDIR=${PREFIX}/bin" >> ${PREFIX}/etc/conda/activate.d/env_vars.sh
echo "export _TENX_LD_LIBRARY_PATH=${LD_LIBRARY_PATH}" >> ${PREFIX}/etc/conda/activate.d/env_vars.sh
echo "export MROFLAGS="--vdrmode=rolling"" >> ${PREFIX}/etc/conda/activate.d/env_vars.sh


if [ ! -f ${PREFIX}/etc/conda/deactivate.d/env_vars.sh ]; then
    echo "#!/bin/bash" > ${PREFIX}/etc/conda/deactivate.d/env_vars.sh
fi
echo "unset LD_LIBRARY_PATH" >> ${PREFIX}/etc/conda/deactivate.d/env_vars.sh
echo "unset MROPATH" >> ${PREFIX}/etc/conda/deactivate.d/env_vars.sh
echo "unset PYTHONPATH" >> ${PREFIX}/etc/conda/deactivate.d/env_vars.sh
echo "unset TENX_SCRIPTDIR" >> ${PREFIX}/etc/conda/deactivate.d/env_vars.sh
echo "unset _TENX_LD_LIBRARY_PATH" >> ${PREFIX}/etc/conda/deactivate.d/env_vars.sh
echo "unset MROFLAGS" >> ${PREFIX}/etc/conda/deactivate.d/env_vars.sh
