-- Define the HTML template
local htmlTemplate = [[
<!DOCTYPE html>
<html>
<head>
  <title>New HTML Document</title>
</head>
<body>
  <h1>Welcome!</h1>
  <p>This is a new HTML document.</p>
</body>
</html>
]]

-- Function to insert the template
vim.keymap.set("n", "<leader>t", function()
    vim.api.nvim_insert(vim.api.nvim_buf_get_curpos(0)[1], htmlTemplate)
end, {noremap = true})

--[[
vim.api.nvim_set_keymap('i', '<buffer>', {
  iabbrev = {! = htmlTemplate},
}, {})
]]
