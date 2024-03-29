#!/usr/bin/fish

abbr -a e nvim
abbr -a vim nvim
abbr -a ls exa
abbr -a cat bat

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

set -g fish_prompt_pwd_dir_length 3

source $HOME/.cargo/env

for f in $HOME/.config/fish/private/*
  source $f
end

function fish_prompt
  set_color a86f06
  echo -n (prompt_pwd)
  set_color a2a806
  echo -n ' $ '
  set_color normal
end

function fish_greeting
end
