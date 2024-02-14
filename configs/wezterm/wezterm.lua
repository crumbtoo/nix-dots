local fennel = require "lib.fennel"

local cwd = os.getenv("HOME") .. "/.config/wezterm"

local function oncwd(s)
    return cwd .. "/" .. s
end

fennel.install()
fennel.path = oncwd("?/init.fnl;") .. oncwd("?.fnl;")
           .. fennel.path
fennel["macro-path"] = oncwd("?.fnl;") .. fennel["macro-path"]

package.path = oncwd("lib/?.lua;") .. package.path

return require "real-wezterm"

