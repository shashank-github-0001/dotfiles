if status is-interactive
    fish_vi_key_bindings
end


set -x fish_user_paths ~/.cargo/bin $fish_user_paths
set -x fish_user_paths ~/.cargo/env $fish_user_paths
set -x fish_user_paths ~/binaries $fish_user_paths
set -x fish_user_paths ~/.config/scripts $fish_user_paths
set -x BUN_INSTALL ~/.bun
set -x fish_user_paths $BUN_INSTALL/bin $fish_user_paths
set -x fish_user_paths /home/shashank/.nimble/bin $fish_user_paths
set -x fish_user_paths ~/flutter/bin $fish_user_paths
set -x fish_user_paths /opt/intelFPGA/20.1/modelsim_ase/bin $fish_user_paths
set -gx EDITOR nvim
set -g STARSHIP_CONFIG ~/example/non/default/path/starship.toml
set fish_greeting


alias l 'exa -al'
alias ls 'exa'
alias f 'cd $(fd -t d -H | fzf)'
alias rate 'sudo rate-mirrors --allow-root --protocol https arch | tee /etc/pacman.d/mirrorlist'
alias backupmirrors 'sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak'
alias z 'zellij'
alias gall 'git add . && git commit -am "$(date)" && git push -u origin main'
alias t 'set -x a $(fd -t d -H | fzf) && tmux new-session -c "$a" -s "$(basename "$a")"'


eval (starship init fish | source)
