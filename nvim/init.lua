-- Enable vim syntax highlighting (use ":set filetype" if it is undetected)
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- Windows split to the right by default
vim.opt.splitright = true

-- Show absolute line number of the selected line
vim.opt.number = true
-- Show the relative line numbers of the file
vim.opt.relativenumber = true
-- Use spaces instead of tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- All copy and pasto operations go to the system clipboard
vim.opt.clipboard = "unnamedplus"
-- Copying and pasting use wl-clipboard commands
vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
        ["+"] = "wl-copy",
        ["*"] = "wl-copy",
    },
    paste = {
        ["+"] = "wl-paste --no-newline",
        ["*"] = "wl-paste --no-newline",
    },
    cache_enabled = 0,
}

-- Disable new line from extending comments
-- Use "FileType" event to change the format options after they are set
vim.api.nvim_create_autocmd("FileType", {
-- Set the file types this applies to "*" applies to all (Ex. { "c", "phython" })
    pattern = "*",
-- The callback is the function called when the event is triggered
    callback = function()
-- Use opt_local to change the formating of only that buffer
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
})

-- Change default color scheme
vim.cmd("colorscheme retrobox")

-- Add system headers to the file search
vim.cmd("set path+=/usr/include")
vim.cmd("set path+=/usr/local/include")

-- Custom kemaps
-- Remove arrow key movement
vim.keymap.set("", "<Left>", "<Nop>")
vim.keymap.set("", "<Down>", "<Nop>")
vim.keymap.set("", "<Up>", "<Nop>")
vim.keymap.set("", "<Right>", "<Nop>")

-- Move lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==")
vim.keymap.set("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==")
vim.keymap.set("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv")

-- Move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Remove search highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Open a terminal window
vim.keymap.set("n", "<A-t>", "<cmd>vert term<CR>")
-- Exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- Open a selected file path in a new window
vim.keymap.set("n", "gv", "<cmd>vs<CR>gf")
