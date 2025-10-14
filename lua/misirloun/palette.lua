local options = require("misirloun.config").options

local palette = {

    bg = "#000000",
    nc = "#000000",
    base = "#080808",
    surface = "#191919",
    overlay = "#2a2a2a",
    muted = "#444444",
    subtle = "#555555",
    text = "#DDDDDD",
    red = "#ce8787",
    blue = "#7a7a7a",
    rose = "#aaaaaa",
    string = "#7788AA",
    lavender = "#cccccc",
    purple = "#7a7a7a",
    green = "#555555",

    highlight_low = "#191919",
    highlight_med = "#444444",
    highlight_high = "#aaaaaa",
}

if options.palette ~= nil and next(options.palette) then
    palette = vim.tbl_extend("force", palette, options.palette or {})
end

return palette
