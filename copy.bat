@echo off
mkdir %LOCALAPPDATA%\nvim
copy /Y .\.config\nvim\init.lua %LOCALAPPDATA%\nvim\init.lua

mkdir %APPDATA%\alacritty
copy /Y .\.config\alacritty\alacritty.toml %APPDATA%\alacritty\alacritty.toml
