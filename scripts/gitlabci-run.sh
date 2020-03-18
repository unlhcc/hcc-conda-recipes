#!/bin/bash
set -euo pipefail
# Set some defaults
set +u
[[ -z $DOCKER_ARG ]] && DOCKER_ARG=""
[[ -z $GITLAB_CI ]] && GITLAB_CI="false"
[[ -z $BIOCONDA_UTILS_LINT_ARGS ]] && BIOCONDA_UTILS_LINT_ARGS=""
[[ -z $BIOCONDA_UTILS_BUILD_ARGS ]] && BIOCONDA_UTILS_BUILD_ARGS=""
[[ -z $RANGE_ARG ]] && RANGE_ARG=""
[[ -z $DISABLE_BIOCONDA_UTILS_BUILD_GIT_RANGE_CHECK  ]] && DISABLE_BIOCONDA_UTILS_BUILD_GIT_RANGE_CHECK="false"
set -u

export HOST_USER_ID=`id -u`
SKIP_LINTING=false

# determine recipes to build. If building locally, build anything that changed
# since master. If on travis, only build the commit range included in the push
# or the pull request.
if [[ $GITLAB_CI == "true" ]]
then
    RANGE="master HEAD"
    RANGE_ARG="--git-range $RANGE"
    export PATH=$ANACONDA_PREFIX/bin:$PATH
fi

# On travis we always run on docker for linux. This may not always be the case
# for local testing.
if [[ `uname` == Linux && $GITLAB_CI == "true" ]]
then
    DOCKER_ARG="--docker"
fi

# When building master or bulk, upload packages to anaconda and quay.io.
if [[  $CI_BUILD_REF_NAME == "master"  ]]
then
        UPLOAD_ARG="--anaconda-upload"
        RANGE_ARG="--git-range ${CI_COMMIT_BEFORE_SHA} ${CI_COMMIT_SHA}"
else
    UPLOAD_ARG=""
    LINT_COMMENT_ARG=""
    if [[ $SKIP_LINTING == "false"  ]]
    then
        set -x; bioconda-utils lint recipes config.yml $RANGE_ARG $BIOCONDA_UTILS_LINT_ARGS $LINT_COMMENT_ARG; set +x
    fi
fi


if [[ $DISABLE_BIOCONDA_UTILS_BUILD_GIT_RANGE_CHECK == "true" ]]
then
    echo
    echo "DISABLE_BIOCONDA_UTILS_BUILD_GIT_RANGE_CHECK is true."
    echo "A comprehensive check will be performed to see what needs to be built."
    RANGE_ARG=""
fi
set -x; bioconda-utils build recipes config.yml $UPLOAD_ARG $DOCKER_ARG $BIOCONDA_UTILS_BUILD_ARGS $RANGE_ARG ; set +x;

