#!/bin/bash

bash aspera-cli-3.7.7.608.927cce8-linux-64-release.sh

# Workaround for Unicode chars in filenames causing conda-build to error out
mv ~/.aspera/cli/certs/Certinomis* ~/.aspera/cli/certs/'Certinomis - Autorite Racine.crt'
mv ~/.aspera/cli/certs/NetLock\ Arany* ~/.aspera/cli/certs/'NetLock Arany (Class Gold) Fotanusitvany.crt'

cp -R ~/.aspera/cli/* ${PREFIX}
