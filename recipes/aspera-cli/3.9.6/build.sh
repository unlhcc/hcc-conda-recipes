#!/bin/bash

export HOME=`mktemp -d`

if [ `uname` == Darwin ]; then
    bash aspera.sh
    cp -R $HOME/Applications/Aspera\ CLI/* ${PREFIX}
else
    bash aspera.sh
    cp -R $HOME/.aspera/cli/* ${PREFIX}
fi

# Workaround for Unicode chars in filenames causing conda-build to error out
# mv ~/.aspera/cli/certs/Certinomis* ~/.aspera/cli/certs/'Certinomis - Autorite Racine.crt'
# mv ~/.aspera/cli/certs/NetLock\ Arany* ~/.aspera/cli/certs/'NetLock Arany (Class Gold) Fotanusitvany.crt'
