<p align="center">
    <h2 align="center">misirloun.nvim for Neovim</h2>
</p>

<p align="center">A dark, elegant Neovim colorscheme with midnight tones</p>

## Preview

![Misirlou Theme Showcase](showcase.png)

## About

misirloun.nvim is a dark Neovim colorscheme featuring deep midnight tones and carefully balanced contrast. Built on the foundations of [rose-pine/neovim](https://github.com/rose-pine/neovim), it reimagines the color palette with darker backgrounds and sophisticated accent colors while maintaining the thoughtful structure and extensive plugin support of its inspiration.

## Credits

This theme builds upon the excellent work of the [Rosé Pine](https://github.com/rose-pine/neovim) project. The core architecture, highlight group definitions, and plugin integrations are derived from rose-pine/neovim. misirloun.nvim adapts these foundations with its own unique color palette and aesthetic direction.

## Getting Started

### Installation

Install `misirloun.nvim` using your favorite package manager:

#### [lazy.nvim](https://lazy.folke.io/installation)

**Structured Setup**

```lua
return {
    "pompos02/misirloun.nvim",
    name = "misirloun",
    config = function()
        vim.cmd("colorscheme misirloun")
    end
}
```

**Single file**

```lua
{ "pompos02/misirloun.nvim", name = "misirloun" }
```

#### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { "pompos02/misirloun.nvim", as = "misirloun" }
```

#### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'pompos02/misirloun.nvim', { 'as': 'misirloun' }
```

## Configuration

> [!IMPORTANT]
> Configure options _before_ setting colorscheme.

misirloun.nvim inherits the configuration structure from Rosé Pine. Customize the theme by calling `setup()` before applying the colorscheme:

```lua
require("misirloun").setup({
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
    },

    styles = {
        bold = true,
        italic = true,
        transparency = false,
    },

     groups = {
         border = "text",
         link = "purple",
         panel = "surface",

         error = "red",
         hint = "highlight_low",
         info = "highlight_low",
         warn = "highlight_med",
         note = "blue",
         todo = "rose",

         git_add = "text",
         git_change = "highlight_med",
         git_delete = "highlight_high",
         git_dirty = "rose",
         git_ignore = "muted",
         git_merge = "purple",
         git_rename = "blue",
         git_stage = "purple",
         git_text = "rose",
         git_untracked = "subtle",

         h1 = "purple",
         h2 = "lavender",
         h3 = "rose",
         h4 = "string",
         h5 = "blue",
         h6 = "green",
     },

    palette = {
        -- Override default colors (uncomment to customize)
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
    },

    highlight_groups = {
        -- Customize specific highlight groups
        -- Comment = { fg = "subtle" },
        -- Visual = { bg = "highlight_med" },
    },

    before_highlight = function(group, highlight, palette)
        -- Modify highlights before they're applied
    end,
})

vim.cmd("colorscheme misirloun")
```

## Palette

misirloun.nvim's color palette:

| Color    | Hex       | Usage             |
| -------- | --------- | ----------------- |
| c1       | `#000000` | Darkest - Background |
| c2       | `#080808` | Elevated surfaces |
| c3       | `#191919` | UI elements       |
| c4       | `#2a2a2a` | Overlays          |
| c5       | `#444444` | Muted content     |
| c6       | `#555555` | Subtle text       |
| c7       | `#DDDDDD` | Brightest - Primary text |
| red      | `#ce8787` | Errors, deletions |
| gold     | `#bd9b5a` | Warnings, accents |
| string   | `#7788AA` | Strings, special values |

## Features

- Deep true black background (`#000000`)
- Carefully balanced contrast for extended coding sessions
- Comprehensive treesitter support
- LSP semantic highlighting
- Extensive plugin integrations (50+ plugins supported)
- Customizable through groups and highlight overrides
- Terminal color support

## Plugin Support

misirloun.nvim includes first-class support for popular plugins including:

- Telescope
- Neo-tree / NvimTree
- Which-key
- Gitsigns
- Trouble
- Mini.nvim
- Lualine
- nvim-cmp / Blink.cmp
- And many more

## Contributing

Contributions are welcome. Open an issue or pull request for plugin support, highlight improvements, or bug fixes.

## License

MIT
