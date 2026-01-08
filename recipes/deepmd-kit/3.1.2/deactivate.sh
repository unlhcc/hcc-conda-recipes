export LAMMPS_PLUGIN_PATH=$(echo ${LAMMPS_PLUGIN_PATH} | awk -v RS=: -v ORS=: '/deepmd_lmp/ {next} {print}' | sed 's/:*$//')
