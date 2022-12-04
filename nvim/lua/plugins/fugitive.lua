-- import comment plugin safely
local setup, fugitive = pcall(require, "fugitive")
if not setup then
	return
end

-- enable comment
fugitive.setup()
