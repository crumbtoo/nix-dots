-- :fennel:1706846284
local utils = require("lib.utils")
do end (vim.opt)["tabstop"] = 2
vim.opt["shiftwidth"] = 2
vim.opt["softtabstop"] = 2
vim.opt["expandtab"] = true
vim.b.rulestring = ";------------------------------------------------------------------------------;"
vim.b.repl = utils["make-repl"]({cmd = "fennel"})
return nil