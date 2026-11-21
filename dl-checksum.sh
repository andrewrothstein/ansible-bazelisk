#!/usr/bin/env sh
set -e
DIR=$(mktemp -d)
trap 'rm -rf "$DIR"' EXIT
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

    curl -fsSL --proto '=https' --tlsv1.2 -o "$lfile" "$url"
    local sum
    sum=$(sha256sum "$lfile" | awk '{print $1}')
    if ! printf '%s' "$sum" | grep -Eq '^[0-9a-f]{64}$'
    then
        echo "bad or missing checksum for $url: '$sum'" >&2
        exit 1
    fi
    printf "    # %s\n" "$url"
    printf "    %s: sha256:%s\n" "$platform" "$sum"
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver darwin amd64
    dl $ver darwin arm64
    dl $ver linux amd64
    dl $ver linux arm64
    dl $ver windows amd64 .exe
    dl $ver windows arm64 .exe
}

dl_ver ${1:-v1.30.0}
