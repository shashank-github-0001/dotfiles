if status is-interactive
    fish_vi_key_bindings
end


set -x PATH "$HOME/.cargo/env" $PATH
set -x PATH "$HOME/binaries" $PATH
set -x PATH "$HOME/.config/scripts" $PATH
set -x BUN_INSTALL "$HOME/.bun"
set -x PATH "$BUN_INSTALL/bin" $PATH
set -x PATH "/home/shashank/.nimble/bin" $PATH
set -x PATH "$HOME/flutter/bin" $PATH


alias l 'exa -al'
alias ls 'exa'
alias f 'cd $(fd -t d -H | fzf)'
alias rate 'sudo rate-mirrors --allow-root --protocol https arch | tee /etc/pacman.d/mirrorlist'
alias backupmirrors 'sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak'
alias z 'zellij'
alias gall 'git add . && git commit -am "$(date)" && git push -u origin main'
alias t 'set -x a $(fd -t d -H | fzf) && tmux new-session -c "$a" -s "$(basename "$a")"'


eval (starship init fish | source)
