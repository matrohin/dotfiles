local wezterm = require("wezterm");

local config = {
  use_fancy_tab_bar = true,
  tab_bar_at_bottom = true,
  leader = {key = "a", mods="ALT"},
  keys = {
    {key = "[", mods="LEADER", action=wezterm.action.ActivateCopyMode },

    {key = "n", mods="LEADER", action=wezterm.action.ActivateTabRelative(1) },
    {key = "p", mods="LEADER", action=wezterm.action.ActivateTabRelative(-1) },

    {key = "c", mods="LEADER", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    {key = "d", mods="LEADER", action=wezterm.action{CloseCurrentTab={confirm=false}}},

    {key = "v", mods="LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    {key = "h", mods="LEADER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},

    {key = "h", mods = "ALT",       action=wezterm.action{ActivatePaneDirection="Left"}},
    {key = "j", mods = "ALT",       action=wezterm.action{ActivatePaneDirection="Down"}},
    {key = "k", mods = "ALT",       action=wezterm.action{ActivatePaneDirection="Up"}},
    {key = "l", mods = "ALT",       action=wezterm.action{ActivatePaneDirection="Right"}},

    {key = "H", mods = "ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 2}}},
    {key = "J", mods = "ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 2}}},
    {key = "K", mods = "ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 2}}},
    {key = "L", mods = "ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 2}}},
  }
}

return config
