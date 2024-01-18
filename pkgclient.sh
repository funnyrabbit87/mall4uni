#!/bin/bash
if [ ! -d "./dist/build/h5" ]; then
    echo "building uni..."
    pnpm run build:h5
else
    echo "./dist/build/h5 already exists."
fi


curdir=$(pwd)
distdir="${curdir}/dist/build"
if [ ! -d "${distdir}/admin" ]; then
    echo "building admin..."
    cd ../mall4v
    echo "$(pwd)"
    pnpm run build --out-dir "${distdir}/admin"

else
    echo "admin already exis#ts."
fi

cd "${curdir}"
echo "${curdir}"
docker build -t wineweb:2.0 -f ./Dockerfile .
# docker build \
# --build-arg http_proxy=http://172.29.32.1:10809 \
# --build-arg https_proxy=http://172.29.32.1:10809 \
# -t wineweb:1.0 -f ./Dockerfile .


