local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {

    file_sorter = require("telescope.sorters").get_fzy_sorter,

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
       n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
      }
    },
  },

  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
     aerial = {
      -- Display symbols as <root>.<parent>.<symbol>
      show_nesting = true
    }
  },
}


local notify_present, _ = pcall(require, "notify")
if notify_present then
  telescope.load_extension "notify"
end

local aerial_present, _ = pcall(require, "aerial")
if aerial_present then
  telescope.load_extension "aerial"
end

local git_worktree_present, _ = pcall(require, "git_worktree")
if git_worktree_present then
  telescope.load_extension "git_worktree"
end

