-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
	return
end

local options = {
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
}
-- configure/enable gitsigns
gitsigns.setup(options)
