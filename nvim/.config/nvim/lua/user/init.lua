local config = {

  -- Set colorscheme
  colorscheme = "default_theme",

  -- Set dashboard header
  header = {
    " ",
    " ",
    " ",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    "⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀ ",
    "⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀ ",
    "⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀ ",
    "⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀ ",
    "⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀ ",
    "⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀ ",
    "⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀ ",
    "⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀ ",
    "⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀ ",
    "⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀ ",
    "⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀ ",
    "⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀ ",
    "⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀ ",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    " ",
    " ",
    " ",
  },

  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
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

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
      { "github/copilot.vim" },
      { "ThePrimeagen/harpoon",
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
    },
    -- All other entries override the setup() call for default plugins
    treesitter = {
      ensure_installed = { "lua" },
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
    -- GitSigns Options
    gitsigns = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter_opts = {
        relative_time = false,
      }
    },

    -- Neo Tree
    ["neo-tree"] = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = false,
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 0,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          with_expanders = false,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
        },
        git_status = {
          symbols = {
            added = "",
            deleted = "",
            modified = "",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
      window = {
        position = "right",
        width = 30,
        mappings = {
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["o"] = "open",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["C"] = "close_node",
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
          ["R"] = "refresh",
          ["/"] = "fuzzy_finder",
          ["f"] = "filter_on_submit",
          ["<c-x>"] = "clear_filter",
          ["a"] = "add",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy",
          ["m"] = "move",
          ["q"] = "close_window",
        },
      },
      nesting_rules = {},
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".DS_Store",
            "thumbs.db",
            "node_modules",
            "__pycache__",
          },
        },
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
      },
      buffers = {
        show_unloaded = true,
        window = {
          mappings = {
            ["bd"] = "buffer_delete",
          },
        },
      },
      git_status = {
        window = {
          position = "float",
          mappings = {
            ["A"] = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
          },
        },
      },
      event_handlers = {
        {
          event = "vim_buffer_enter",
          handler = function(_)
            if vim.bo.filetype == "neo-tree" then
              vim.wo.signcolumn = "auto"
            end
          end,
        },
      },
    },
    bufferline = {
      options = {
         mode = "tabs",
      },
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
          -- Telescope
          ["fs"] = {
            function()
              require("telescope.builtin").live_grep({ hidden = true })
            end,
            "Live Grep"
          },
          ["fw"] = {
            function()
              require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>"), hidden = true })
            end,
            "Find word (cword)"
          },
          ["fW"] = {
            function()
              require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>"), hidden = true })
            end,
            "Find WORD (cWORD)"
          },
          -- Git
          ["gd"] = {
            "<cmd>term git diff<cr>",
            "Diff"
          },
        },
      },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      -- "pyright"
    },
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server.name].setup(opts)
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
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end,
    }
  end,

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    local map = vim.keymap.set
    local set = vim.opt
    -- Set options
    set.relativenumber = true

    -- Set key bindings
    -- map("n", "<C-s>", ":w!<CR>")

    -- General
    map("v", "J", ":m '>+1<cr>gv=gv")
    map("v", "K", ":m '<-2<cr>gv=gv")
    map("n", "<leader>Y", "gg\"+yG")
    map("n", "<leader>x", ":!chmod +x %<CR>")

    -- Quickfix List
    map("n", "<A-[>", "<cmd>cnext<CR>zz")
    map("n", "<A-]>", "<cmd>cprev<CR>zz")
    map("n", "<A-q>", "<cmd>lua require(\"ramchaik.quickfix\").toggle(1)<CR>")

    -- Harpoon
    map("n", "<leader>a", "<cmd>lua require(\"harpoon.mark\").add_file()<CR>")
    map("n", "<C-s>", "<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>")
    ---- Harpoon buffer hotkeys
    map("n", "<C-j>", "<cmd>lua require(\"harpoon.ui\").nav_file(1)<CR>")
    map("n", "<C-k>", "<cmd>lua require(\"harpoon.ui\").nav_file(2)<CR>")
    map("n", "<C-l>", "<cmd>lua require(\"harpoon.ui\").nav_file(3)<CR>")
    ---- Harpoon terminal hotkeys
    map("n", "<leader>tf", "<cmd>lua require(\"harpoon.term\").gotoTerminal(1)<CR>")
    map("n", "<leader>td", "<cmd>lua require(\"harpoon.term\").gotoTerminal(2)<CR>")
    map("n", "<leader>ts", "<cmd>lua require(\"harpoon.term\").gotoTerminal(3)<CR>")


    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", {})
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
