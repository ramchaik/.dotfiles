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
	color_devicons = true,
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

  -- extensions = {
  --   fzy_native = {
  --     override_generic_sorter = false,
  --     override_file_sorter = true,
  --   },
  -- },
}


local git_worktree_present, _ = pcall(require, "git_worktree")
if git_worktree_present then
  telescope.load_extension "git_worktree"
end

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = vim.env.DOTFILES,
        hidden = true,
    })
end

local function set_background(content)
	local update_wallpaper = "osascript -e 'tell application \"Finder\" to set desktop picture to POSIX file \""
		.. content
		.. "\"'"
	vim.fn.system(update_wallpaper)
end

local function select_background(prompt_bufnr, map)
	local function set_the_background(close)
		local content = require("telescope.actions.state").get_selected_entry(
			prompt_bufnr
		)
		function string.starts(String,Start)
			return string.sub(String,1,string.len(Start))==Start
		end

		local str_to_exclude = "./"
		if string.starts(content.value, str_to_exclude) then
			local filename = content.value:gsub(str_to_exclude,"")
			set_background(content.cwd .. "/" .. filename)
		else
			set_background(content.cwd .. "/" .. content.value) end

		if close then
			require("telescope.actions").close(prompt_bufnr)
		end
	end

	map("i", "<C-p>", function()
		set_the_background()
	end)

	map("i", "<CR>", function()
		set_the_background(true)
	end)
end

local function image_selector(prompt, cwd)
	return function()
		require("telescope.builtin").find_files({
			prompt_title = prompt,
			cwd = cwd,

			attach_mappings = function(prompt_bufnr, map)
				select_background(prompt_bufnr, map)

				-- Please continue mapping (attaching additional key maps):
				-- Ctrl+n/p to move up and down the list.
				return true
			end,
		})
	end
end

M.anime_selector = image_selector("< Anime Bobs > ", "~/personal/anime")

local function refactor(prompt_bufnr)
	local content = require("telescope.actions.state").get_selected_entry(
		prompt_bufnr
	)
	require("telescope.actions").close(prompt_bufnr)
	require("refactoring").refactor(content.value)
end

M.refactors = function()
	require("telescope.pickers").new({}, {
		prompt_title = "refactors",
		finder = require("telescope.finders").new_table({
			results = require("refactoring").get_refactors(),
		}),
		sorter = require("telescope.config").values.generic_sorter({}),
		attach_mappings = function(_, map)
			map("i", "<CR>", refactor)
			map("n", "<CR>", refactor)
			return true
		end,
	}):find()
end

return M
