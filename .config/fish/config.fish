#!/usr/bin/fish

abbr -a e nvim
abbr -a ls exa

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

set -g fish_prompt_pwd_dir_length 3

function fish_right_prompt
  set_color 5e81ac
  echo (prompt_pwd)
  set_color normal
end

function fish_prompt
  set_color 81a1c1
  echo -n '$ '
  set_color normal
end

function fish_greeting
end
