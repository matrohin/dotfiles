#!/usr/bin/fish

abbr -a e nvim.exe
abbr -a cat bat
abbr -a ls exa

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

set -g fish_prompt_pwd_dir_length 3

function fish_right_prompt
  set_color a86f06
  echo (prompt_pwd)
  set_color normal
end

function fish_prompt
  set_color a2a806
  echo -n '$ '
  set_color normal
end

function fish_greeting
end
