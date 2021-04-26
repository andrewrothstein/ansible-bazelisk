#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/bazelbuild/bazelisk/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local suffix=${4:-}
    local platform="${os}-${arch}"
    local rfile=bazelisk-${platform}${suffix}
    local url=$MIRROR/$ver/$rfile
    local lfile=$DIR/bazelisk-${platform}-${ver}${suffix}

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `sha256sum $lfile | awk '{print $1}'`
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver darwin amd64
    dl $ver linux amd64
    dl $ver windows amd64 .exe
}

dl_ver ${1:-v1.8.0}
