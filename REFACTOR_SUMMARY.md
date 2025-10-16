# Palette Refactoring Summary

## Overview
Refactored the colorscheme palette from descriptive greyscale names to numbered names (c1-c7) based on vibrancy, keeping only true colors (red, gold, string).

## Color Mapping

### Greyscale Colors (renamed to c1-c7)
- `c1` = `#000000` (formerly: bg, nc) - Darkest
- `c2` = `#080808` (formerly: base)
- `c3` = `#191919` (formerly: surface, highlight_low)
- `c4` = `#2a2a2a` (formerly: overlay)
- `c5` = `#444444` (formerly: muted, highlight_med)
- `c6` = `#555555` (formerly: subtle, green)
- `c7` = `#DDDDDD` (formerly: text) - Brightest

### Accent Colors (kept as-is)
- `red` = `#ce8787` - Errors, deletions
- `gold` = `#bd9b5a` - Warnings, accents
- `string` = `#7788AA` - Strings, special values

### Removed/Converted to Hex
These were greyscale values masquerading as colors:
- `blue` = `#7a7a7a` → Used as hex literal
- `purple` = `#7a7a7a` → Used as hex literal
- `rose` = `#aaaaaa` → Used as hex literal
- `lavender` = `#cccccc` → Used as hex literal
- `highlight_high` = `#aaaaaa` → Merged with rose
- `green` = `#555555` → Was identical to subtle/c6

## Files Modified

1. **lua/misirloun/palette.lua** - Core palette definition
2. **lua/misirloun/config.lua** - Type definitions and defaults
3. **lua/misirloun.lua** - Main colorscheme (358 references updated)
4. **lua/misirloun/plugins/bufferline.lua** - Plugin configuration
5. **lua/misirloun/plugins/galaxyline.lua** - Plugin configuration
6. **lua/lualine/themes/misirloun.lua** - Lualine theme
7. **README.md** - Documentation and examples

## Benefits

1. **Clarity**: Clear vibrancy progression (c1=darkest → c7=brightest)
2. **Simplicity**: Only 3 actual colors + 7 greyscale values
3. **Consistency**: All greyscale uses numbered naming
4. **Maintainability**: Easier to understand color relationships
5. **Flexibility**: Can easily adjust vibrancy by swapping c-values

## Breaking Changes

⚠️ **Users who override palette colors in their config will need to update to new names**

Example old config:
```lua
palette = {
    bg = "#000000",
    text = "#FFFFFF",
    muted = "#666666",
}
```

Example new config:
```lua
palette = {
    c1 = "#000000",
    c7 = "#FFFFFF",
    c5 = "#666666",
}
```

## Verification

All Lua files pass syntax checking:
- ✅ palette.lua
- ✅ config.lua
- ✅ misirloun.lua
- ✅ All plugin configurations
- ✅ Lualine theme

No references to old naming scheme remain in codebase.
