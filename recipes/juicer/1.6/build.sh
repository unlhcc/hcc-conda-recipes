#!/bin/bash

OUTPUT="$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM"
[ -d "$OUTPUT" ] || mkdir -p "$OUTPUT"
[ -d "${PREFIX}/bin" ] || mkdir -p "${PREFIX}/bin"

# Copy scripts
mkdir -p $OUTPUT/scripts/
chmod -R +x juicer/AWS/ juicer/CPU/ juicer/LSF/ juicer/PBS/ juicer/SLURM/ juicer/UGER/ juicer/misc/
cp -r juicer/AWS/ juicer/CPU/ juicer/LSF/ juicer/PBS/ juicer/SLURM/ juicer/UGER/ juicer/misc/ $OUTPUT/scripts/

# Copy JuiceTools .jar file
cp -p juicer/juicer_tools.jar "$OUTPUT"

cp $RECIPE_DIR/juicer_tools.sh $OUTPUT/juicer_tools
ln -s $OUTPUT/juicer_tools $PREFIX/bin
chmod 0755 "${PREFIX}/bin/juicer_tools"
