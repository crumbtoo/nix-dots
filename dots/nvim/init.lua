local function bootstrap(url, opts)
  local name = opts.name or url:gsub(".*/(.+)%.git", "%1") or url:gsub(".*/", "")
  local path = opts.path or (vim.fn.stdpath("data") .. "/lazy/" .. name)

  if vim.loop.fs_stat(path) then
    if opts.adjust_rtp then vim.opt.rtp:prepend(path) end
    return path
  end

  print(name .. ": installing in data dir...")

  local cmd = { "git", "clone", "--filter=blob:none", url, path }
  if opts.ref then table.insert(cmd, 4, "--branch=" .. opts.ref) end

  vim.fn.system(cmd)

  if opts.adjust_rtp then vim.opt.rtp:prepend(path) end

  vim.cmd "redraw"
  print(name .. ": finished installing")

  return path
end

bootstrap("https://github.com/folke/lazy.nvim.git", { ref = "stable", adjust_rtp = true })
bootstrap("https://github.com/udayvir-singh/tangerine.nvim.git", { ref = "v2.8", adjust_rtp = true })
bootstrap("https://github.com/udayvir-singh/hibiscus.nvim.git", { ref = "v1.7", adjust_rtp = true })

-- vim.opt.rtp:prepend(lazy_path)

local fennel_target_dir = vim.fn.stdpath "data" .. "/luatarget"
local data_dir = vim.fn.stdpath [[data]]
local nvim_dir = vim.fn.stdpath [[config]]

require("tangerine").setup {
  vimrc   = nvim_dir .. "/init.fnl",
  source  = nvim_dir,
  target  = fennel_target_dir,

  rtpdirs = {
    "ftplugin"
  },

  compiler = {
    verbose = false,
    hooks = { "oninit" },
  },
  keymaps = {
    eval_buffer = "<Nop>",
    peek_buffer = "<Nop>",
    goto_output = "<Nop>"
  }
}

