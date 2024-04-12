local function escape(str)
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

local langmap = vim.fn.join({
  escape(ru) .. ";" .. escape(en),
  escape(ru_shift) .. ";" .. escape(en_shift),
}, ",")

local options = {
  autochdir = false,
  swapfile = false,
  backup = true,
  backupdir = vim.fn.getenv("HOME") .. "/.local/state/nvim/backup/",
  smoothscroll = true,
  conceallevel = 2,

  expandtab = false,
  smarttab = true,
  shiftwidth = 4,
  tabstop = 4,
  softtabstop = 4,
  autoindent = true,

  pumblend = 15,
  winblend = 5,

  timeoutlen = 500,
  ttimeoutlen = 0,

  showmode = false,
  ruler = false,

  showbreak = "↪",
  listchars = { eol = " ", space = "·", tab = "→ " },
  fillchars = {
    diff = " ",
    eob = " ",

    fold = "╌",

    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
  },

  spelllang = "",
  langmap = langmap,
}

for opt_name, opt_value in pairs(options) do
  local ok, _ = pcall(vim.api.nvim_get_option_info2, opt_name, {})
  if ok then
    vim.opt[opt_name] = opt_value
  else
    vim.notify("Option " .. opt_name .. " is not supported", vim.log.levels.WARN)
  end
end

vim.cmd("set diffopt+=vertical");
vim.cmd.aunmenu({ "PopUp.How-to\\ disable\\ mouse" })
vim.cmd.aunmenu({ "PopUp.-1-" })
