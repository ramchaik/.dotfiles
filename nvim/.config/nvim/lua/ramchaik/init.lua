require("ramchaik.telescope")
require("ramchaik.lsp")
require("ramchaik.lualine")
require("ramchaik.harpoon")
-- require("ramchaik.debugger")
-- require("ramchaik.git-worktree")

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
