#!/bin/bash

$PYTHON setup.py install
mv ${PREFIX}/bin/cm1_geninit ${PREFIX}/bin/cm1_geninit.py
cat > ${PREFIX}/bin/cm1_geninit <<EOF 
#!/bin/bash
QT_API=pyqt5 QT_QPA_PLATFORM_PLUGIN_PATH=/opt/anaconda1anaconda2anaconda3/lib/qt5/plugins/platforms cm1_geninit.py
EOF
chmod +x ${PREFIX}/bin/cm1_geninit
# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
