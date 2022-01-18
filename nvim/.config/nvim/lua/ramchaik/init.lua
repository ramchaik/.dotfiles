require("ramchaik.telescope")
require("ramchaik.lsp")
require("ramchaik.lualine")
require("ramchaik.harpoon")
require("ramchaik.nvim-treesitter")
require("ramchaik.comment")
require("ramchaik.debugger")
-- require("ramchaik.git-worktree")

-- Plugins
require('gitsigns').setup()


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
