#!/bin/sh

VERSION="7.0.1"

# Download the source code
echo "Extracting llvm-${VERSION}"
curl -fsSL https://releases.llvm.org/${VERSION}/llvm-${VERSION}.src.tar.xz | tar -Jxf -
mv llvm-${VERSION}.src llvm
cd llvm/tools
echo "Extracting cfe-${VERSION}"
curl -fsSL https://releases.llvm.org/${VERSION}/cfe-${VERSION}.src.tar.xz | tar -Jxf -
mv cfe-${VERSION}.src clang
cd clang/tools
echo "Extracting clang-tools-extra-${VERSION}"
curl -fsSL https://releases.llvm.org/${VERSION}/clang-tools-extra-${VERSION}.src.tar.xz | tar -Jxf -
mv clang-tools-extra-${VERSION}.src extra

# Create a separate directory for building
echo "Create a directory for building"
cd ../../../..
mkdir llvm-build
cd llvm-build

# Build and install
echo "Build and Install"
LLVM_DIR=$HOME/.bin/llvm
mkdir -p $LLVM_DIR
cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$LLVM_DIR ../llvm
make -j8
make -j8 install

# Clean-up
echo "Clean-up"
cd ..
rm -r llvm llvm-build
