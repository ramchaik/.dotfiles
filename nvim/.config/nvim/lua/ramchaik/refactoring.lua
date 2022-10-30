local refactoring_status_ok, refactoring = pcall(require, "refactoring")
if not refactoring_status_ok then
	print("refactoring not loaded")
	return
end

refactoring.setup({})
