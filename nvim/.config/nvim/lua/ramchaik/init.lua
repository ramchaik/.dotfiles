require("ramchaik.telescope")
require("ramchaik.lsp")
require("ramchaik.cmp")
require("ramchaik.lualine")
--require("ramchaik.git-worktree")
--require("ramchaik.debugger")
--require("ramchaik.harpoon")

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
