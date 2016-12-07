if ! type 'rustc' &> /dev/null; then
    return
fi

local rust_sysroot="$( rustc --print sysroot 2> /dev/null )"
if [[ -z "${rust_sysroot}" || ! -d "${rust_sysroot}" ]]; then
    return
fi

local rust_sysroot_src="${rust_sysroot}/lib/rustlib/src/rust/src"
if [[ -d "${rust_sysroot_src}" ]]; then
    export RUST_SRC_PATH="${rust_sysroot_src}"
fi

if type 'rustup' &> /dev/null; then
    rustup completions zsh >! "${0:h}/external/_rustup"
    fpath=("${0:h}/external" $fpath)

    local rustup_home="${RUSTUP_HOME:-$HOME/.multirust}"
    if [[ "${rust_sysroot}" == "${rustup_home}/"* ]]; then
        fpath=("${rust_sysroot}/share/zsh/site-functions" $fpath)
    fi
fi
