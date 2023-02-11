local api = vim.api
local M = {}
local notify = vim.notify
local log_levels = vim.log.levels

local function ninfo(config)
  local self = setmetatable({}, { __index = M })
  self.group = vim.api.nvim_create_augroup('NInfo', {
    clear = true
  })
  self.config = config
  if self.config.openinfo.enable == true then
    M.openinfo(self.group)
  end
end

function M.setup(opts)
  local config = require(ninfo.config)
  config.setup(opts)

  ninfo(config)
end

function M.openinfo(group)
  local title = 'Open Info'
  api.nvim_create_autocmd({ 'BufRead' }, {
    group = group,
    pattern = { '*' },
    callback = notify(title, log_levels.INFO, {
      title = title + ':BufRead',
      on_open = function()
        notify(vim.fn.expand('%'))
      end
    })
  })
  api.nvim_create_autocmd({ 'BufEnter' }, {
    group = group,
    pattern = { '*' },
    callback = notify(title, log_levels.INFO, {
      title = title + ':BufEnter',
      on_open = function()
        notify(vim.fn.expand('%'))
      end
    })
  })
end
