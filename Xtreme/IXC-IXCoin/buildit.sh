#!/bin/sh

# Build the IXC-IXCoin executables from source code dated 2018-08.

# 1. alpine and git
docker build -t cd/0 -f ../Dockerfile.0 ..

# 2. Add the tools to pass autogen
docker build -t cd/00 -f ../Dockerfile.00 ..

# 3. Add a suitable version of boost
docker build -t cd/000 -f ../Dockerfile.000 ..

# 4. Add the tools to pass configure
docker build -t cd/0001 -f ../Dockerfile.0001 ..

# 5. Add the packages for QT, DB, and X11
docker build -t cd/00010 -f ../Dockerfile.00010 ..

# 6. Get the source code dated 2018-08
docker build -t cd/ixc-ixcoin:base -f Dockerfile.base . \
  --build-arg SOURCE_ORIGIN=https://github.com/IXCore/IXCoin \
  --build-arg SOURCE_LOCAL_ROOT=/IXCoin \
  --build-arg COMMIT=fa9299
