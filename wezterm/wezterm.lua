local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end


config.color_scheme = 'carbonfox'
config.font = wezterm.font ("JetBrainsMono Nerd Font")
config.font_size = 18
config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
}
config.keys = {
    {
        key = 'm',
        mods = 'CMD',
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = 'Enter',
        mods = 'CTRL',
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = '|',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '-',
        mods = 'CTRL',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 't',
        mods = 'CTRL',
        action = wezterm.action.SpawnTab'DefaultDomain',
    },
    {
        key = "w",
        mods = "CTRL",
        action = wezterm.action{ CloseCurrentTab={ confirm = false } }
    },
    {
        key = "l",
        mods = "CTRL",
        action = wezterm.action{ ActivateTabRelative=1 } },
    }




    return config
