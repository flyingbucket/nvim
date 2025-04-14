-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.options")
require("config.floatterm")

-- -- interact with browser
-- -- Define the OpenMarkdownPreview function in Vim script
-- vim.cmd([[
--   function! OpenMarkdownPreview(url)
--     execute "silent !firefox --new-window " . a:url
--   endfunction
-- ]])
--
-- -- Set the browser function for markdown-preview.nvim
-- vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
