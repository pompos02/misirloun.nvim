local options = require("misirloun.config").options

local palette = {

    c1 = "#000000",
    c2 = "#080808",
    c3 = "#191919",
    c4 = "#2a2a2a",
    c5 = "#444444",
    c6 = "#666666",
    c7 = "#DDDDDD",
    c70 = "#b4b4b4",
    red = "#ce8787",
    gold = "#d4ab5f",
    green = "#789978",
    string = "#7788AA",
    keys = "#ffffff",
    white = "#ffffff",
}

if options.palette ~= nil and next(options.palette) then
    palette = vim.tbl_extend("force", palette, options.palette or {})
end

return palette
