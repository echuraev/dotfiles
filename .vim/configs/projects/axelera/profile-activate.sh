#!/bin/bash

REPO_DIR="${HOME}/Workspace/Axelera/software-platform/"
BUILD_TYPE="RelWithDebInfo"

#export LD_LIBRARY_PATH=${REPO_DIR}/build-${BUILD_TYPE}/workspace/chroot/lib
LIB_DIR=${REPO_DIR}/build-${BUILD_TYPE}/workspace/chroot/opt/axelera/runtime/lib/
LIB_PROFILE_DIR=${REPO_DIR}/build-${BUILD_TYPE}/workspace/chroot/opt/axelera/runtime/lib_profile
mkdir -p $LIB_PROFILE_DIR
cp -f ${LIB_DIR}*tvm*.so ${LIB_PROFILE_DIR}
cp -f ${LIB_DIR}libze* ${LIB_PROFILE_DIR}
export LD_LIBRARY_PATH=${REPO_DIR}/build-${BUILD_TYPE}/workspace/chroot/lib:$LIB_PROFILE_DIR

if [[ ! -z "${REPO_DIR}host/tvm/tvm-src" ]]; then
    export TVM_HOME="${REPO_DIR}host/tvm/tvm-src"
fi

if [[ ! -z "" ]]; then
    export TVM_LIBRARY_PATH=""
fi

. ${REPO_DIR}/build-${BUILD_TYPE}/workspace/chroot/bin/activate
