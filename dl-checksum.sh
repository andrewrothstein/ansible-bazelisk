#!/usr/bin/env sh
VER=v0.0.8
DIR=~/Downloads
MIRROR=https://github.com/bazelbuild/bazelisk/releases/download/${VER}

dl()
{
    OS=$1
    ARCH=$2
    SUFFIX=${3:-}
    PLATFORM=${OS}-${ARCH}
    RFILE=bazelisk-${PLATFORM}${SUFFIX}
    URL=$MIRROR/$RFILE
    LFILE=$DIR/bazelisk-${PLATFORM}-${VER}${SUFFIX}

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "    # %s\n" $URL
    printf "    %s: sha256:%s\n" $PLATFORM `sha256sum $LFILE | awk '{print $1}'`
}

printf "  %s:\n" $VER
dl darwin amd64
dl linux amd64
dl windows amd64 .exe


