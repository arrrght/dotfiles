export BASH_SILENCE_DEPRECATION_WARNING=1
alias vv="nvim +NERDTree"
alias v="vim +NERDTree"
alias l="ls -lah"
alias ls="exa"
alias ll="exa --long --grid"
source "$HOME/.cargo/env"
# export PATH="/Users/a3r/.hb/sbin:/Users/a3r/.hb/bin:/Users/a3r/go/bin:/Users/a3r/.hb/opt/libpq/bin:/Users/a3r/.hb/opt/mysql-client/bin:$PATH"
export PATH="${PATH}:${HOME}/.krew/bin"
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
export GOPATH="/Users/a3r/go"
export EDITOR=vim
export VISUAL="$EDITOR"

# export NVM_DIR="$HOME/.nvm"
# [ -s "/Users/a3r/.hb/opt/nvm/nvm.sh" ] && \. "/Users/a3r/.hb/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/Users/a3r/.hb/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/Users/a3r/.hb/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# export CC_x86_64_unknown_linux_musl=x86_64-unknown-linux-musl-gcc
# export CXX_x86_64_unknown_linux_musl=x86_64-unknown-linux-musl-g++
# export AR_x86_64_unknown_linux_musl=x86_64-unknown-linux-musl-ar
# export CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER=x86_64-unknown-linux-musl-gcc

# eval "$(rbenv init -)";

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
