local M = {}

M.ns = vim.api.nvim_create_namespace("paint.nvim")

---@alias PaintFilterFun fun(buf):boolean
---@class PaintFilter: table<string,any>|PaintFilterFun
---@field filetype? string

---@class PaintHighlight
---@field filter PaintFilter
---@field pattern string
---@field hl string

--- @class PaintOptions
M.defaults = {
  ---@type PaintHighlight[]
  highlights = {
    {
      -- filter can be a table of buffer options that should match,
      -- or a function called with buf as param that should return true.
      -- The example below will paint @something in comments with Constant
      filter = { filetype = "lua" },
      pattern = "%s*%-%-%-%s*(@%w+)",
      hl = "Constant",
    },
  },
}

--- @type PaintOptions
M.options = {}

function M.setup(options)
  options = options or {}

  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options)
end

return M
