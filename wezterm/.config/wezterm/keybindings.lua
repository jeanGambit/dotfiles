local wezterm = require 'wezterm'

return {
  { key = 't', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnTab 'DefaultDomain' },
  { key = 'n', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnWindow },
  { key = 'l', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'k', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'h', mods = 'ALT', action = wezterm.action.ActivateTabRelative(-1) },
  { key = 'l', mods = 'ALT', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'j', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'w', mods = 'CTRL', action = wezterm.action.CloseCurrentTab { confirm = true } },
  { key = 'w', mods = 'ALT', action = wezterm.action.CloseCurrentPane { confirm = true } },
{
  key = 'Space',
  mods = 'CTRL|SHIFT',
  action = wezterm.action.ActivateCopyMode,
},
}


