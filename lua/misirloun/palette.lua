local options = require("misirloun.config").options

local palette = {

    c1 = "#000000",
    c2 = "#080808",
    c3 = "#191919",
    c4 = "#2a2a2a",
    c5 = "#444444",
    c6 = "#555555",
    c7 = "#DDDDDD",
    red = "#ce8787",
    gold = "#bd9b5a",
    string = "#7788AA",
}

if options.palette ~= nil and next(options.palette) then
    palette = vim.tbl_extend("force", palette, options.palette or {})
end

return palette
