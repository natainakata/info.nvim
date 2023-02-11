local M = {}

--- @class NInfoOptions
M.defaults = {
  openinfo = {
    enable = true
  }
}

--- @type NInfoOptions
M.options = {}

function M.setup(options)
  M.options = vim.tbl_deep_extend('force', M.defaults, options or {})
end

return M
