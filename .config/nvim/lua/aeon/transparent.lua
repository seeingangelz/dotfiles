local status_ok, transparent = pcall(require, "transparent")
if not status_ok then
	return
end

transparent.setup({
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {
    "NormalFloat",
    "BufferLineBufferSelected",
    "BufferLineDevIconLuaSelected",
    "BufferLineDevIconLuaInactive",
    "BufferLineTabClose",
    "BufferLineBuffer",
    "BufferLineInfo",
    "BufferLineHint",
    "BufferLineFill",
    "BufferLineBufferSelected",
    "BufferLineCloseButton",
    "BufferLineCloseButtonSelected",
    "BufferLineCloseButtonVisible",
    "BufferLineGroupLabel",
    "BufferLineGroupSeparator",
    "BufferLineBackground",
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    "NvimTreeNormalFloat",
    "NvimTreeEndOfBuffer",
    "NvimTreeFolderIcon",
    "lualine_c_terminal",
    "lualine_b_terminal",
    "lualine_b_inactive",
    "lualine_a_terminal",
    "lualine_a_inactive",
    "lualine_c_replace",
    "lualine_c_command",
    "lualine_b_replace",
    "lualine",
    "CursorLine",
    "IndentBlankLineChar",
    "lualine_c_visual",
    "lualine_c_normal",
    "lualine_c_insert",
    "lualine_b_visual",
    "lualine_b_normal",
    "lualine_b_insert",
    "TelescopeNormal",
    "TelescopeResultsLineNr",
    "TelescopeResultsBorder",
    "TelescopePreviewBorder",
    "TelescopePromptBorder",
    "TelescopeBorder",
    "NvimComma",
    "NvimInvalidComma",
    "MsgArea",
    "FloatBorder",
    "CmpItemAbbr",
    "CmpItemKind",
    "CmpItemMenu",
    "CmpItemAbbrMatch",
  }, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd(":TransparentEnable")
    end,
})
