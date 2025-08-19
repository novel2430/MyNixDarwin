local M = {}
local wezterm = require 'wezterm'
local act = wezterm.action
local copy_action = act.Multiple {
  { CopyTo = 'ClipboardAndPrimarySelection' },
  { CopyMode = 'ClearSelectionMode' },
}


local copy_mode = nil
local search_mode = nil
if wezterm.gui then
  -- Change Default Copy Mode
  copy_mode = wezterm.gui.default_key_tables().copy_mode
  table.insert(
    copy_mode,
    {
      key = 'y',
      mods = 'NONE',
      action = copy_action,
    }
  )
  table.insert(
    copy_mode,
    {
      key = 'q',
      mods = 'NONE',
      action = act.CopyMode 'ClearSelectionMode',
    }
  )
  -- Change Default Search Mode
  search_mode = wezterm.gui.default_key_tables().search_mode
  table.insert(
    search_mode,
    {
      key = 'q',
      mods = 'CTRL',
      action = act.CopyMode 'ClearSelectionMode',
    }
  )
  table.insert(
    search_mode,
    {
      key = 'v',
      mods = 'CTRL',
      action = act.CopyMode { SetSelectionMode = 'Cell' },
    }
  )
  table.insert(
    search_mode,
    {
      key = 'y',
      mods = 'CTRL',
      action = copy_action,
    }
  )
  table.insert(
    search_mode,
    {
      key = 'h',
      mods = 'CTRL',
      action = act.CopyMode 'MoveLeft',
    }
  )
  table.insert(
    search_mode,
    {
      key = 'j',
      mods = 'CTRL',
      action = act.CopyMode 'MoveDown',
    }
  )
  table.insert(
    search_mode,
    {
      key = 'k',
      mods = 'CTRL',
      action = act.CopyMode 'MoveUp',
    }
  )
  table.insert(
    search_mode,
    {
      key = 'l',
      mods = 'CTRL',
      action = act.CopyMode 'MoveRight',
    }
  )
end

M.keybind = {
  -- Moving
  { key = 'PageUp',   mods = 'CTRL|SHIFT', action = act.ScrollByPage(-1) },
  { key = 'PageDown', mods = 'CTRL|SHIFT', action = act.ScrollByPage(1) },
  { key = 'k',        mods = 'CTRL|SHIFT', action = act.ScrollByLine(-1) },
  { key = 'j',        mods = 'CTRL|SHIFT', action = act.ScrollByLine(1) },
  -- CopyMode
  { key = 'x',        mods = 'CTRL|SHIFT', action = wezterm.action.ActivateCopyMode },
}

M.keytable = {
  copy_mode = copy_mode,
  search_mode = search_mode,
}
return M
