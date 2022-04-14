local config = {

  -- Set colorscheme
  colorscheme = "default_theme",

  -- Default theme configuration
  default_theme = {
    diagnostics_style = "none",
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },

  -- Disable default plugins
  enabled = {
    bufferline = true,
    neo_tree = true,
    lualine = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = true,
    dashboard = true,
    which_key = true,
    neoscroll = true,
    ts_rainbow = true,
    ts_autotag = true,
  },

  -- Disable AstroVim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
      { "github/copilot.vim" },
      { 
        "ThePrimeagen/harpoon",
        config = function()
          require("harpoon").setup({
              nav_first_in_list = true,
              -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
              save_on_toggle = false,

              -- saves the harpoon file upon every change. disabling is unrecommended.
              save_on_change = true,

              -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
              enter_on_sendcmd = false,

              -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
              tmux_autoclose_windows = false,

              -- filetypes that you want to prevent from adding to the harpoon list menu.
              excluded_filetypes = { "harpoon" },
          })
        end,
      },
      {
        "mfussenegger/nvim-dap",
        config = function()
          local dap = require('dap')
          dap.adapters.node2 = {
            type = 'executable',
            command = 'node',
            args = {os.getenv('HOME') .. '/dev/vscode-node-debug2/out/src/nodeDebug.js'},
          }
          dap.configurations.javascript = {
            {
              name = 'Launch',
              type = 'node2',
              request = 'launch',
              program = '${file}',
              cwd = vim.fn.getcwd(),
              sourceMaps = true,
              protocol = 'inspector',
              console = 'integratedTerminal',
            },
            {
              -- For this to work you need to make sure the node process is started with the `--inspect` flag.
              name = 'Attach to process',
              type = 'node2',
              request = 'attach',
              processId = require'dap.utils'.pick_process,
            },
          }
        end
      },
      { 
        "nvim-telescope/telescope-dap.nvim",
        config = function()
          require('telescope').load_extension('dap')
        end
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("nvim-dap-virtual-text").setup()
        end
      },
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require("dapui").setup()
        end
      }
    },
    -- All other entries override the setup() call for default plugins
    treesitter = {
      ensure_installed = { "lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },

  -- Add paths for including more VS Code style snippets in luasnip
  luasnip = {
    vscode_snippet_paths = {},
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings to the normal mode <leader> mappings
    register_n_leader = {
      -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   server:setup(opts)
    -- end

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- null-ls configuration
  ["null-ls"] = function()
    -- Formatting and linting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      return
    end

    -- Check supported formatters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting

    -- Check supported linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup {
      debug = false,
      sources = {
        -- Set a formatter
        formatting.rufo,
        -- Set a linter
        diagnostics.rubocop,
      },
      -- NOTE: You can remove this on attach function to disable format on save
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
        end
      end,
    }
  end,

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_set_keymap
    local set = vim.opt
    -- Set options
    set.relativenumber = true

    -- Git
    map("n", "<leader>gd", "<cmd>term git diff<cr>", opts)

    -- Set key bindings
    map("v", "J", ":m '>+1<cr>gv=gv", opts)
    map("v", "K", ":m '<-2<cr>gv=gv", opts)
    map("n", "<leader>Y", "gg\"+yG", opts)
    map("n", "<leader>x", ":!chmod +x %<CR>", opts)

    -- Quickfix List
    map("n", "<A-[>", "<cmd>cnext<CR>zz", opts)
    map("n", "<A-]>", "<cmd>cprev<CR>zz", opts)
    map("n", "<A-q>", "<cmd>lua require(\"ramchaik.quickfix\").toggle(1)<CR>", opts)

    -- Harpoon
    map("n", "<leader>a", "<cmd>lua require(\"harpoon.mark\").add_file()<CR>", opts)
    map("n", "<C-s>", "<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>", opts)
    
    map("n", "<C-j>", "<cmd>lua require(\"harpoon.ui\").nav_file(1)<CR>", opts)
    map("n", "<C-k>", "<cmd>lua require(\"harpoon.ui\").nav_file(2)<CR>", opts)
    map("n", "<C-l>", "<cmd>lua require(\"harpoon.ui\").nav_file(3)<CR>", opts)

    map("n", "<leader>tf", "<cmd>lua require(\"harpoon.term\").gotoTerminal(1)<CR>", opts)
    map("n", "<leader>td", "<cmd>lua require(\"harpoon.term\").gotoTerminal(2)<CR>", opts)
    map("n", "<leader>ts", "<cmd>lua require(\"harpoon.term\").gotoTerminal(3)<CR>", opts)
    
    -- Debugger
    map('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
    map('n', '<leader>dB', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
    map('n', '<A-k>', '<cmd>lua require"dap".step_out()<CR>', opts)
    map('n', "<A-l>", '<cmd>lua require"dap".step_into()<CR>', opts)
    map('n', '<A-j>', '<cmd>lua require"dap".step_over()<CR>', opts)
    map('n', '<A-h>', '<cmd>lua require"dap".continue()<CR>', opts)
    map('n', '<leader>dn', '<cmd>lua require"dap".run_to_cursor()<CR>', opts)
    map('n', '<leader>dk', '<cmd>lua require"dap".up()<CR>zz', opts)
    map('n', '<leader>dj', '<cmd>lua require"dap".down()<CR>zz', opts)
    map('n', '<leader>dc', '<cmd>lua require"dap".terminate()<CR>', opts)
    map('n', '<leader>dr', '<cmd>lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l', opts)
    map('n', '<leader>dR', '<cmd>lua require"dap".clear_breakpoints()<CR>', opts)
    map('n', '<leader>de', '<cmd>lua require"dap".set_exception_breakpoints({"all"})<CR>', opts)
    map('n', '<leader>di', '<cmd>lua require"dap.ui.widgets".hover()<CR>', opts)
    map('n', '<leader>d?', '<cmd>lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>', opts)
    
    map('n', '<leader>df', '<cmd>Telescope dap frames<CR>', opts)
    map('n', '<leader>dlb', '<cmd>Telescope dap list_breakpoints<CR>', opts)
    map('n', '<leader>dcg', '<cmd>Telescope dap configurations<CR>', opts)
    map('n', '<leader>dva', '<cmd>Telescope dap variables<CR>', opts)
    map('n', '<leader>dcm', '<cmd>Telescope dap commands<CR>', opts)

    -- Set autocommands
    vim.cmd [[
      augroup packer_conf
        autocmd!
        autocmd bufwritepost plugins.lua source <afile> | PackerSync
      augroup end
    ]]
  end,
}

return config
