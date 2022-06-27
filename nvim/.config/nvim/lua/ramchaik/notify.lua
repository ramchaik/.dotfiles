local function config()
  local present, notify = pcall(require, "notify")
  if present then
    notify.setup({
      stages = "fade_in_slide_out",
    })

    vim.notify = notify
  end
end
