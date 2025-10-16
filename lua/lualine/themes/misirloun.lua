local p = require("misirloun.palette")
local config = require("misirloun.config")

local bg_base = p.c3
if config.options.styles.transparency then
    bg_base = "NONE"
end

return {
    normal = {
        a = { bg = p.c7, fg = p.c2 },
        b = { bg = p.c4, fg = p.c7 },
        c = { bg = bg_base, fg = p.c7 },
    },
    insert = {
        a = { bg = p.c7, fg = p.c2 },
        b = { bg = p.c4, fg = p.c7 },
        c = { bg = bg_base, fg = p.c7 },
    },
    visual = {
        a = { bg = p.c6, fg = p.c2 },
        b = { bg = p.c4, fg = p.c6 },
        c = { bg = bg_base, fg = p.c7 },
    },
    replace = {
        a = { bg = p.c6, fg = p.c2 },
        b = { bg = p.c4, fg = p.c6 },
        c = { bg = bg_base, fg = p.c7 },
    },
    command = {
        a = { bg = p.red, fg = p.c2 },
        b = { bg = p.c4, fg = p.red },
        c = { bg = bg_base, fg = p.c7 },
    },
    inactive = {
        a = { bg = bg_base, fg = p.c5 },
        b = { bg = bg_base, fg = p.c5 },
        c = { bg = bg_base, fg = p.c5 },
    },
}
