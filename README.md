# dotfiles

## Sway dependencies

- `sway`, `waybar`, `fuzzel`, `dunst` — core WM stack
- `alacritty`, `brave` — terminal and browser
- `dolphin`, `kbuildsycoca6` — file manager
- `swaylock` — screen locker
- `grim`, `slurp`, `wl-clipboard` — screenshots
- `imagemagick` — crop for `shot-area.sh`
- `wf-recorder` — screen recording
- `ffmpeg`, `gifski` — gif conversion for `recgif.sh` (gifski: `cargo install` on Ubuntu)
- `wpctl` (wireplumber), `brightnessctl`, `playerctl` — media/brightness keys
- `polkit-kde-agent`, `blueman`, `pavucontrol`, `qt6ct` — system utilities
- `papirus-icon-theme` — dunst and fuzzel icons
- battery notifications — the dunst `[battery]` rule matches appname "Power Manager"
- `prock` — custom window switcher binary, install separately
- `Inconsolata Nerd Font` — UI and terminal font
- Wallpapers in `~/Pictures/wallpapers/`

## Nord palette

How to grep for colors used:
```sh
grep -rin 2e3440 .config .tmux.conf      # catches all three hex forms
grep -rn "59, 66, 82" .config            # catches the CSS rgba() form
```

| Color | Hex | RGB | Role in this setup |
|---|---|---|---|
| nord0 | `#2e3440` | `46, 52, 64` | Window backgrounds, hint text |
| nord1 | `#3b4252` | `59, 66, 82` | Waybar bar + tooltip, dunst notifications, unfocused borders |
| nord2 | `#434c5e` | `67, 76, 94` | Selection / hover |
| nord3 | `#4c566a` | `76, 86, 106` | Borders and frames |
| nord4 | `#d8dee9` | `216, 222, 233` | Primary text, waybar modules, terminal caret, active tmux window |
| nord5 | `#e5e9f0` | `229, 233, 240` | Terminal normal white |
| nord6 | `#eceff4` | `236, 239, 244` | Text accents, critical notification body |
| nord7 | `#8fbcbb` | `143, 188, 187` | Alacritty/tmux focused search match |
| nord8 | `#88c0d0` | `136, 192, 208` | Fuzzel match, alacritty/tmux search match, tmux active pane border |
| nord9 | `#81a1c1` | `129, 161, 193` | Inactive workspaces, fuzzel prompt |
| nord10 | `#5e81ac` | `94, 129, 172` | Sway focused window, waybar focused workspace, fuzzel border |
| nord11 | `#bf616a` | `191, 97, 106` | Critical battery, urgent window, wrong password |
| nord12 | `#d08770` | `208, 135, 112` | Almost never used |
| nord13 | `#ebcb8b` | `235, 203, 139` | Low battery, disconnected network |
| nord14 | `#a3be8c` | `163, 190, 140` | Not used |
| nord15 | `#b48ead` | `180, 142, 173` | Not used |

## Shell dependencies

- `fish`, `exa`, `neovim`, `tmux`
- `fzf`, `fd` — on Ubuntu `fd` is the `fd-find` package, binary `fdfind`
