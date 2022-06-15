require("ramchaik.telescope")
require("ramchaik.lsp")
require("ramchaik.lualine")
require("ramchaik.harpoon")
require("ramchaik.nvim-treesitter")
require("ramchaik.comment")
-- require("ramchaik.git-worktree")
require("ramchaik.plugins")

require("ramchaik.sets")
require("ramchaik.mappings")

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

-- Fix for eslint lsp; until next release; 
-- eslint: https://github.com/microsoft/vscode-eslint/issues/1393
-- neovim: https://github.com/neovim/neovim/issues/16673#issuecomment-997222902
vim.diagnostic.set = (function(orig)
    return function(namespace, bufnr, diagnostics, opts)
        for _, v in ipairs(diagnostics) do
            v.col = v.col or 0
        end
        return orig(namespace, bufnr, diagnostics, opts)
    end
end)(vim.diagnostic.set)
