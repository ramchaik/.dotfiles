
local active_list = vim.NIL;

local list_types = {
  location = 'location',
  quickfix = 'quickfix'
}

local function toggle_location_list()
  if (active_list == list_types.location) then
    vim.cmd('lclose');
    active_list = vim.NIL;
  else
    if active_list == list_types.quickfix then
      vim.cmd('cclose');
    end

    if pcall(vim.cmd, 'lopen') then
      active_list = list_types.location;
    else
      print("No location list to show");
      active_list = vim.NIL;
    end
  end
end

local function toggle_quickfix_list()
  if (active_list == list_types.quickfix) then
    vim.cmd('cclose');
    active_list = vim.NIL;
  else
    if active_list == list_types.location then
      vim.cmd('lclose');
    end

    vim.cmd('copen');
    active_list = list_types.quickfix
  end
end

local function toggle(global)
  if global == 1 then
    toggle_quickfix_list();
  else
    toggle_location_list();
  end
end

return {
  toggle = toggle
}
