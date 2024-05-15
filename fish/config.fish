if status is-interactive
    set fish_greeting
    fish_vi_key_bindings
end


# ranking mirror
# first go to su -
# cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
# then do the 
# rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
# all of this should be done while youre in su -
# if anything gets fucked up just try this
# sudo reflector --country 'India' --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
# this is using reflector
# i saw once for converting the doc files and stuff you can use soffice
# its from libreoffice 
# you can do soffice --headless --convert-to pdf *.docx

alias l 'lsd -Al --color always --group-dirs first'
alias ls 'lsd -A --color always --group-dirs first'
alias d 'cd (fd -t d -H | fzf)'
alias f 'fd -t f -H | fzf'
alias convertpng 'mogrify -format jpg *.png'
alias mc 'java -jar ~/TLauncher-2.899.jar'
alias vate 'source env/bin/activate.fish'
alias t 'todo-rs'

# git alias
alias gs 'git status'
alias ga 'git add .'
alias gc 'git commit -m $1'
alias gp 'git push -u origin main'

# for the pass-rs program i wrote
alias pa 'pass-rs --add $1'
alias pl 'pass-rs --list'
alias pr 'pass-rs --remove $1'

set -x EDITOR "nvim"
set -x STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
set -x XDG_CURRENT_DESKTOP "Sway"
set -x SWAY_SCREENSHOT_DIR "~/Screenshots/"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x BUN_INSTALL "$HOME/.bun"
set -x PATH "$HOME/.cargo/bin" $PATH
set -x PATH "$HOME/.cargo/env" $PATH
set -x PATH "$HOME/binaries" $PATH
set -x PATH "$HOME/.config/scripts" $PATH
set -x PATH "$BUN_INSTALL/bin" $PATH
set -x PATH "/home/shashank/.nimble/bin" $PATH
set -x PATH "$HOME/.local/share/" $PATH
set -x PATH "$HOME/.local/bin" $PATH
set -x PATH "$HOME/.zfunc/" $PATH
set -x PATH "$HOME/todo-rs/target/release/" $PATH
set -x PATH "$HOME/pass-rs/target/release/" $PATH

set -x HISTSIZE 1000
set -x SAVEHIST 1000
set -x HISTFILE "$HOME/.histfile"

# Evaluate zoxide initialization
zoxide init fish | source
source "$HOME/.cargo/env.fish"
