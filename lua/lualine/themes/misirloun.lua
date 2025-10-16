local p = require("misirloun.palette")
local config = require("misirloun.config")

local bg_base = p.c3
if config.options.styles.transparency then
    bg_base = "NONE"
end

return {
    normal = {
        a = { bg = "#aaaaaa", fg = p.c2, gui = "bold" },
        b = { bg = p.c4, fg = "#aaaaaa" },
        c = { bg = bg_base, fg = p.c7 },
    },
    insert = {
        a = { bg = "#cccccc", fg = p.c2, gui = "bold" },
        b = { bg = p.c4, fg = "#cccccc" },
        c = { bg = bg_base, fg = p.c7 },
    },
    visual = {
        a = { bg = "#7a7a7a", fg = p.c2, gui = "bold" },
        b = { bg = p.c4, fg = "#7a7a7a" },
        c = { bg = bg_base, fg = p.c7 },
    },
    replace = {
        a = { bg = "#7a7a7a", fg = p.c2, gui = "bold" },
        b = { bg = p.c4, fg = "#7a7a7a" },
        c = { bg = bg_base, fg = p.c7 },
    },
    command = {
        a = { bg = p.red, fg = p.c2, gui = "bold" },
        b = { bg = p.c4, fg = p.red },
        c = { bg = bg_base, fg = p.c7 },
    },
    inactive = {
        a = { bg = bg_base, fg = p.c5, gui = "bold" },
        b = { bg = bg_base, fg = p.c5 },
        c = { bg = bg_base, fg = p.c5 },
    },
}
