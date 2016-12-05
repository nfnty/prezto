if type 'rustup' &> /dev/null; then
    rustup completions zsh >! "${XDG_CONFIG_HOME}/zsh/.zprezto/modules/rust/external/_rustup"
fi

fpath=("${0:h}/external" $fpath)
