# Setup fzf
# ---------
if [[ $(uname) = "Darwin" ]]; then
    if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
      export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
    fi

    # Auto-completion
    # ---------------
    [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null

    # Key bindings
    # ------------
    source "/usr/local/opt/fzf/shell/key-bindings.bash"
elif [[ $(uname) = *"Linux"* ]]; then
    # Auto-completion
    # ---------------
    [[ $- == *i* ]] && source "/usr/share/fzf/completion.bash" 2> /dev/null

    # Key bindings
    # ------------
    source "/usr/share/fzf/key-bindings.bash"
fi
