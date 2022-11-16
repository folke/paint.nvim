local M = {}

---@param opts? PaintOptions
function M.setup(opts)
  require("paint.config").setup(opts)
  require("paint.highlight").enable()
end

return M
