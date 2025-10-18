local M = {}
local config = require("misirloun.config")

local function set_highlights()
    local utilities = require("misirloun.utilities")
    local palette = require("misirloun.palette")
    local styles = config.options.styles

    local groups = {}
    for group, color in pairs(config.options.groups) do
        groups[group] = utilities.parse_color(color)
    end

    local function make_border(fg)
        fg = utilities.parse_color(fg or groups.border)
        return {
            fg = fg,
            bg = (config.options.extend_background_behind_borders and not styles.transparency) and palette.c1 or "NONE",
        }
    end

    local highlights = {}
    local legacy_highlights = {
        ["@attribute.diff"] = { fg = palette.gold },
        ["@boolean"] = { link = "Boolean" },
        ["@class"] = { fg = palette.c7 },
        ["@conditional"] = { link = "Conditional" },
        ["@field"] = { fg = palette.c70 },
        ["@include"] = { link = "Include" },
        ["@interface"] = { fg = palette.c7 },
        ["@macro"] = { link = "Macro" },
        ["@method"] = { fg = palette.c70 },
        ["@namespace"] = { link = "Include" },
        ["@number"] = { link = "Number" },
        ["@parameter"] = { fg = palette.c6, italic = styles.italic },
        ["@preproc"] = { link = "PreProc" },
        ["@punctuation"] = { fg = palette.c6 },
        ["@punctuation.bracket"] = { link = "@punctuation" },
        ["@punctuation.delimiter"] = { link = "@punctuation" },
        ["@punctuation.special"] = { link = "@punctuation" },
        ["@regexp"] = { link = "String" },
        ["@repeat"] = { link = "Repeat" },
        ["@storageclass"] = { link = "StorageClass" },
        ["@symbol"] = { link = "Identifier" },
        ["@text"] = { fg = palette.c7 },
        ["@text.danger"] = { fg = groups.error },
        ["@text.diff.add"] = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
        ["@text.diff.delete"] = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
        ["@text.emphasis"] = { italic = styles.italic },
        ["@text.environment"] = { link = "Macro" },
        ["@text.environment.name"] = { link = "Type" },
        ["@text.math"] = { link = "Special" },
        ["@text.note"] = { link = "SpecialComment" },
        ["@text.strike"] = { strikethrough = true },
        ["@text.strong"] = { bold = styles.bold },
        ["@text.title"] = { link = "Title" },
        ["@text.title.1.markdown"] = { link = "markdownH1" },
        ["@text.title.1.marker.markdown"] = { link = "markdownH1Delimiter" },
        ["@text.title.2.markdown"] = { link = "markdownH2" },
        ["@text.title.2.marker.markdown"] = { link = "markdownH2Delimiter" },
        ["@text.title.3.markdown"] = { link = "markdownH3" },
        ["@text.title.3.marker.markdown"] = { link = "markdownH3Delimiter" },
        ["@text.title.4.markdown"] = { link = "markdownH4" },
        ["@text.title.4.marker.markdown"] = { link = "markdownH4Delimiter" },
        ["@text.title.5.markdown"] = { link = "markdownH5" },
        ["@text.title.5.marker.markdown"] = { link = "markdownH5Delimiter" },
        ["@text.title.6.markdown"] = { link = "markdownH6" },
        ["@text.title.6.marker.markdown"] = { link = "markdownH6Delimiter" },
        ["@text.underline"] = { underline = true },
        ["@text.uri"] = { fg = groups.link },
        ["@text.warning"] = { fg = palette.c6 },
        ["@todo"] = { link = "Todo" },

        -- lukas-reineke/indent-blankline.nvim
        IndentBlanklineChar = { fg = palette.c5, nocombine = true },
        IndentBlanklineSpaceChar = { fg = palette.c5, nocombine = true },
        IndentBlanklineSpaceCharBlankline = { fg = palette.c5, nocombine = true },
    }
    local default_highlights = {
        ColorColumn = { bg = palette.c1 },
        Conceal = { bg = "NONE" },
        CurSearch = { fg = palette.c2, bg = palette.string },
        Cursor = { fg = palette.c7, bg = palette.c7 },
        CursorColumn = { bg = palette.c1 },
        -- CursorIM = {},
        CursorLine = { bg = palette.c3 },
        CursorLineNr = { fg = palette.c7, bg = palette.c1, bold = styles.bold },
        -- DarkenedPanel = { },
        -- DarkenedStatusline = {},
        DiffAdd = { bg = groups.git_add, blend = 20 },
        DiffChange = { bg = groups.git_change, blend = 20 },
        DiffDelete = { bg = groups.git_delete, blend = 20 },
        DiffText = { bg = groups.git_text, blend = 40 },
        diffAdded = { link = "DiffAdd" },
        diffChanged = { link = "DiffChange" },
        diffRemoved = { link = "DiffDelete" },
        Directory = { fg = palette.c7, bold = styles.bold },
        EndOfBuffer = { fg = palette.c5, bg = palette.c1 },
        ErrorMsg = { fg = groups.error, bold = styles.bold },
        FloatBorder = { fg = palette.c7, bg = palette.c1 },
        FloatTitle = { fg = palette.c7, bg = palette.c1 },
        FoldColumn = { fg = palette.c5, bg = palette.c1 },
        Folded = { fg = palette.c7, bg = palette.c1 },
        IncSearch = { fg = palette.c1, bg = palette.c7, underline = true },
        LineNr = { fg = palette.c5, bg = palette.c1 },
        MatchParen = { fg = palette.c6, bg = palette.c6, blend = 25 },
        ModeMsg = { fg = palette.c6 },
        MoreMsg = { fg = palette.c6 },
        NonText = { fg = palette.c5 },
        Normal = { fg = palette.c7, bg = palette.c1 },
        NormalFloat = { fg = palette.c7, bg = palette.c1 },
        NormalNC = { fg = palette.c7, bg = palette.c1 },
        NvimInternalError = { link = "ErrorMsg" },
        Pmenu = { fg = palette.c6, bg = palette.c1 },
        PmenuExtra = { fg = palette.c5, bg = palette.c1 },
        PmenuExtraSel = { fg = palette.c6, bg = palette.c3 },
        PmenuKind = { fg = palette.c7, bg = palette.c1 },
        PmenuKindSel = { fg = palette.c6, bg = palette.c3 },
        PmenuSbar = { bg = palette.c1 },
        PmenuSel = { fg = palette.c7, bg = palette.c3 },
        PmenuThumb = { bg = palette.c5 },
        Question = { fg = palette.gold },
        QuickFixLine = { fg = palette.c7 },
        -- RedrawDebugNormal = {},
        RedrawDebugClear = { fg = palette.c2, bg = palette.gold },
        RedrawDebugComposed = { fg = palette.c2, bg = palette.c6 },
        RedrawDebugRecompose = { fg = palette.c2, bg = palette.red },
        Search = { fg = palette.c1, bg = palette.c7 },
        SignColumn = { fg = palette.c7, bg = palette.c1 },
        SpecialKey = { fg = palette.c7 },
        SpellBad = { sp = palette.c6, undercurl = true },
        SpellCap = { sp = palette.c6, undercurl = true },
        SpellLocal = { sp = palette.c6, undercurl = true },
        SpellRare = { sp = palette.c6, undercurl = true },
        StatusLine = { fg = palette.c6, bg = palette.c1 },
        StatusLineNC = { fg = palette.c5, bg = palette.c1, blend = 60 },
        StatusLineTerm = { fg = palette.c2, bg = palette.c6 },
        StatusLineTermNC = { fg = palette.c2, bg = palette.c6, blend = 60 },
        Substitute = { link = "IncSearch" },
        TabLine = { fg = palette.c6, bg = palette.c1 },
        TabLineFill = { bg = palette.c1 },
        TabLineSel = { fg = palette.c7, bg = palette.c3, bold = styles.bold },
        Title = { fg = palette.c7, bold = styles.bold },
        VertSplit = { fg = groups.border },
        Visual = { fg = palette.c1, bg = palette.c7 },

        YankHighlight = { fg = palette.c7, bg = palette.c7, blend = 50 },
        -- VisualNOS = {},
        WarningMsg = { fg = palette.gold, bold = styles.bold },
        -- Whitespace = {},
        WildMenu = { link = "IncSearch" },
        WinBar = { fg = palette.c6, bg = palette.c1 },
        WinBarNC = { fg = palette.c5, bg = palette.c1, blend = 60 },
        WinSeparator = { fg = groups.border },

        DiagnosticError = { fg = groups.error },
        DiagnosticHint = { fg = groups.hint },
        DiagnosticInfo = { fg = groups.info },
        DiagnosticOk = { fg = groups.ok },
        DiagnosticWarn = { fg = palette.gold },
        DiagnosticDefaultError = { link = "DiagnosticError" },
        DiagnosticDefaultHint = { link = "DiagnosticHint" },
        DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
        DiagnosticDefaultOk = { link = "DiagnosticOk" },
        DiagnosticDefaultWarn = { fg = palette.c6 },
        DiagnosticFloatingError = { link = "DiagnosticError" },
        DiagnosticFloatingHint = { link = "DiagnosticHint" },
        DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
        DiagnosticFloatingOk = { link = "DiagnosticOk" },
        DiagnosticFloatingWarn = { fg = palette.c6 },
        DiagnosticSignError = { link = "DiagnosticError" },
        DiagnosticSignHint = { link = "DiagnosticHint" },
        DiagnosticSignInfo = { link = "DiagnosticInfo" },
        DiagnosticSignOk = { link = "DiagnosticOk" },
        DiagnosticSignWarn = { fg = palette.gold },
        DiagnosticUnderlineError = { sp = groups.error, undercurl = true },
        DiagnosticUnderlineHint = { sp = groups.hint, undercurl = true },
        DiagnosticUnderlineInfo = { sp = groups.info, undercurl = true },
        DiagnosticUnderlineOk = { sp = groups.ok, undercurl = true },
        DiagnosticUnderlineWarn = { sp = palette.c6, undercurl = true },
        DiagnosticVirtualTextError = { fg = groups.error, bg = groups.error, blend = 10 },
        DiagnosticVirtualTextHint = { fg = groups.hint, bg = groups.hint, blend = 10 },
        DiagnosticVirtualTextInfo = { fg = groups.info, bg = groups.info, blend = 10 },
        DiagnosticVirtualTextOk = { fg = groups.ok, bg = groups.ok, blend = 10 },
        DiagnosticVirtualTextWarn = { fg = palette.c6, bg = palette.c6, blend = 10 },

        Boolean = { fg = palette.c7 },
        Character = { fg = palette.c7 },
        Comment = { fg = palette.c4, italic = styles.italic },
        Conditional = { fg = palette.keys },
        Constant = { fg = palette.c7 },
        Debug = { fg = palette.c7 },
        Define = { fg = palette.c6 },
        Delimiter = { fg = palette.c6 },
        Error = { fg = palette.red },
        Exception = { fg = palette.c6 },
        Float = { fg = palette.c7 },
        Function = { fg = palette.c70 },
        Identifier = { fg = palette.c7 },
        Include = { fg = palette.c6 },
        Keyword = { fg = palette.keys },
        Label = { fg = palette.c7 },
        LspCodeLens = { fg = palette.c6 },
        LspCodeLensSeparator = { fg = palette.c5 },
        LspInlayHint = { fg = palette.c5, bg = palette.c5, blend = 10 },
        LspReferenceRead = { bg = palette.c5 },
        LspReferenceText = { bg = palette.c5, blend = 70 },
        LspReferenceWrite = { bg = palette.c5 },
        Macro = { fg = palette.c6 },
        Number = { fg = palette.c7 },
        Operator = { fg = palette.c6 },
        PreCondit = { fg = palette.c6 },
        PreProc = { link = "PreCondit" },
        Repeat = { fg = palette.keys },
        Special = { fg = palette.c7 },
        SpecialChar = { link = "Special" },
        SpecialComment = { fg = palette.c4 },
        Statement = { fg = palette.c6 },
        StorageClass = { fg = palette.c7 },
        String = { fg = palette.string },
        Structure = { fg = palette.c7 },
        Tag = { fg = palette.c7 },
        Todo = { fg = palette.c7, bg = palette.c7, blend = 20 },
        Type = { fg = palette.keys, italic = styles.italic },
        TypeDef = { link = "Type" },
        Underlined = { fg = palette.c6, underline = true },

        healthError = { fg = groups.error },
        healthSuccess = { fg = groups.info },
        healthWarning = { fg = palette.c6 },

        htmlArg = { fg = palette.c6 },
        htmlBold = { bold = styles.bold },
        htmlEndTag = { fg = palette.c6 },
        htmlH1 = { link = "markdownH1" },
        htmlH2 = { link = "markdownH2" },
        htmlH3 = { link = "markdownH3" },
        htmlH4 = { link = "markdownH4" },
        htmlH5 = { link = "markdownH5" },
        htmlItalic = { italic = styles.italic },
        htmlLink = { link = "markdownUrl" },
        htmlTag = { fg = palette.c6 },
        htmlTagN = { fg = palette.c7 },
        htmlTagName = { fg = palette.c7 },

        markdownDelimiter = { fg = palette.c6 },
        markdownH1 = { fg = groups.h1, bold = styles.bold },
        markdownH1Delimiter = { link = "markdownH1" },
        markdownH2 = { fg = groups.h2, bold = styles.bold },
        markdownH2Delimiter = { link = "markdownH2" },
        markdownH3 = { fg = groups.h3, bold = styles.bold },
        markdownH3Delimiter = { link = "markdownH3" },
        markdownH4 = { fg = groups.h4, bold = styles.bold },
        markdownH4Delimiter = { link = "markdownH4" },
        markdownH5 = { fg = groups.h5, bold = styles.bold },
        markdownH5Delimiter = { link = "markdownH5" },
        markdownH6 = { fg = groups.h6, bold = styles.bold },
        markdownH6Delimiter = { link = "markdownH6" },
        markdownLinkText = { link = "markdownUrl" },
        markdownUrl = { fg = groups.link, sp = groups.link, underline = true },

        mkdCode = { fg = palette.c7, italic = styles.italic },
        mkdCodeDelimiter = { fg = palette.c7 },
        mkdCodeEnd = { fg = palette.c7 },
        mkdCodeStart = { fg = palette.c7 },
        mkdFootnotes = { fg = palette.c7 },
        mkdID = { fg = palette.c7, underline = true },
        mkdInlineURL = { link = "markdownUrl" },
        mkdLink = { link = "markdownUrl" },
        mkdLinkDef = { link = "markdownUrl" },
        mkdListItemLine = { fg = palette.c7 },
        mkdRule = { fg = palette.c6 },
        mkdURL = { link = "markdownUrl" },

        --- Treesitter
        --- |:help treesitter-highlight-groups|
        ["@variable"] = { fg = palette.c7 },
        ["@variable.builtin"] = { fg = palette.c7, italic = styles.italic },
        ["@variable.parameter"] = { fg = palette.c7 },
        ["@variable.parameter.builtin"] = { fg = palette.c7, italic = styles.italic },
        ["@variable.member"] = { fg = palette.c70 },

        ["@constant"] = { fg = palette.c7 },
        ["@constant.builtin"] = { fg = palette.c7 },
        ["@constant.macro"] = { fg = palette.c7 },

        ["@module"] = { fg = palette.c7 },
        ["@module.builtin"] = { fg = palette.c7 },
        ["@label"] = { link = "Label" },

        ["@string"] = { link = "String" },
        -- ["@string.documentation"] = {},
        ["@string.regexp"] = { fg = palette.c6 },
        ["@string.escape"] = { fg = palette.c6 },
        ["@string.special"] = { link = "String" },
        ["@string.special.symbol"] = { link = "Identifier" },
        ["@string.special.url"] = { fg = groups.link },
        -- ["@string.special.path"] = {},

        ["@character"] = { link = "Character" },
        ["@character.special"] = { link = "Character" },

        ["@boolean"] = { link = "Boolean" },
        ["@number"] = { link = "Number" },
        ["@number.float"] = { link = "Number" },
        ["@float"] = { link = "Number" },

        ["@type"] = { fg = palette.keys, italic = styles.italic },
        ["@type.builtin"] = { fg = palette.keys, italic = styles.italic },
        -- ["@type.definition"] = {},

        ["@attribute"] = { fg = palette.c70, italic = styles.italic },
        ["@attribute.builtin"] = { fg = palette.c70, italic = styles.italic },
        ["@property"] = { fg = palette.c70 },

        ["@function"] = { fg = palette.c70 },
        ["@function.builtin"] = { fg = palette.c70 },
        ["@function.call"] = { fg = palette.c70 },
        ["@function.macro"] = { link = "Function" },

        ["@function.method"] = { fg = palette.c70 },
        ["@function.method.call"] = { fg = palette.c70 },

        ["@constructor"] = { fg = palette.c7 },
        ["@operator"] = { link = "Operator" },

        ["@keyword"] = { link = "Keyword" },
        -- ["@keyword.coroutine"] = {},
        -- ["@keyword.function"] = {},
        ["@keyword.operator"] = { fg = palette.keys },
        ["@keyword.import"] = { fg = palette.keys },
        ["@keyword.storage"] = { fg = palette.c7 },
        ["@keyword.repeat"] = { fg = palette.keys },
        ["@keyword.return"] = { fg = palette.keys },
        ["@keyword.debug"] = { fg = palette.c7 },
        ["@keyword.exception"] = { fg = palette.keys },

        ["@keyword.conditional"] = { fg = palette.keys },
        ["@keyword.conditional.ternary"] = { fg = palette.c6 },

        ["@keyword.directive"] = { fg = palette.c6 },
        ["@keyword.directive.define"] = { fg = palette.c6 },

        --- Punctuation
        ["@punctuation.delimiter"] = { fg = palette.c6 },
        ["@punctuation.bracket"] = { fg = palette.c6 },
        ["@punctuation.special"] = { fg = palette.c6 },

        --- Comments
        ["@comment"] = { link = "Comment" },
        -- ["@comment.documentation"] = {},

        ["@comment.error"] = { fg = groups.error },
        ["@comment.warning"] = { fg = palette.c4 },
        ["@comment.todo"] = { fg = groups.todo, bg = groups.todo, blend = 15 },
        ["@comment.hint"] = { fg = groups.hint, bg = groups.hint, blend = 15 },
        ["@comment.info"] = { fg = groups.info, bg = groups.info, blend = 15 },
        ["@comment.note"] = { fg = groups.note, bg = groups.note, blend = 15 },

        --- Markup
        ["@markup.strong"] = { bold = styles.bold },
        ["@markup.italic"] = { italic = styles.italic },
        ["@markup.strikethrough"] = { strikethrough = true },
        ["@markup.underline"] = { underline = true },

        ["@markup.heading"] = { fg = palette.c7, bold = styles.bold },

        ["@markup.quote"] = { fg = palette.c7 },
        ["@markup.math"] = { link = "Special" },
        ["@markup.environment"] = { link = "Macro" },
        ["@markup.environment.name"] = { link = "@type" },

        -- ["@markup.link"] = {},
        ["@markup.link.markdown_inline"] = { fg = palette.c6 },
        ["@markup.link.label.markdown_inline"] = { fg = palette.c7 },
        ["@markup.link.url"] = { fg = groups.link },

        -- ["@markup.raw"] = { bg = palette.c3 },
        -- ["@markup.raw.block"] = { bg = palette.c3 },
        ["@markup.raw.delimiter.markdown"] = { fg = palette.c6 },

        ["@markup.list"] = { fg = palette.c6 },
        ["@markup.list.checked"] = { fg = palette.c7, bg = palette.c7, blend = 10 },
        ["@markup.list.unchecked"] = { fg = palette.c7 },

        -- Markdown headings
        ["@markup.heading.1.markdown"] = { link = "markdownH1" },
        ["@markup.heading.2.markdown"] = { link = "markdownH2" },
        ["@markup.heading.3.markdown"] = { link = "markdownH3" },
        ["@markup.heading.4.markdown"] = { link = "markdownH4" },
        ["@markup.heading.5.markdown"] = { link = "markdownH5" },
        ["@markup.heading.6.markdown"] = { link = "markdownH6" },
        ["@markup.heading.1.marker.markdown"] = { link = "markdownH1Delimiter" },
        ["@markup.heading.2.marker.markdown"] = { link = "markdownH2Delimiter" },
        ["@markup.heading.3.marker.markdown"] = { link = "markdownH3Delimiter" },
        ["@markup.heading.4.marker.markdown"] = { link = "markdownH4Delimiter" },
        ["@markup.heading.5.marker.markdown"] = { link = "markdownH5Delimiter" },
        ["@markup.heading.6.marker.markdown"] = { link = "markdownH6Delimiter" },

        ["@diff.plus"] = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
        ["@diff.minus"] = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
        ["@diff.delta"] = { bg = groups.git_change, blend = 20 },

        ["@tag"] = { link = "Tag" },
        ["@tag.attribute"] = { fg = palette.c6 },
        ["@tag.delimiter"] = { fg = palette.c6 },

        --- Non-highlighting captures
        -- ["@none"] = {},
        ["@conceal"] = { link = "Conceal" },
        ["@conceal.markdown"] = { fg = palette.c6 },

        -- ["@spell"] = {},
        -- ["@nospell"] = {},

        --- Semantic
        ["@lsp.type.comment"] = {},
        ["@lsp.type.comment.c"] = { link = "@comment" },
        ["@lsp.type.comment.cpp"] = { link = "@comment" },
        ["@lsp.type.enum"] = { link = "@type" },
        ["@lsp.type.interface"] = { link = "@interface" },
        ["@lsp.type.keyword"] = { link = "@keyword" },
        ["@lsp.type.namespace"] = { link = "@namespace" },
        ["@lsp.type.namespace.python"] = { link = "@variable" },
        ["@lsp.type.parameter"] = { link = "@variable" },
        ["@lsp.type.property"] = { link = "@property" },
        ["@lsp.type.variable"] = {}, -- defer to treesitter for regular variables
        ["@lsp.type.variable.svelte"] = { link = "@variable" },
        ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.operator.injected"] = { link = "@operator" },
        ["@lsp.typemod.string.injected"] = { link = "@string" },
        ["@lsp.typemod.variable.constant"] = { link = "@constant" },
        ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
        ["@lsp.typemod.variable.injected"] = { link = "@variable" },

        --- Plugins
        -- romgrk/barbar.nvim
        BufferCurrent = { fg = palette.c7, bg = palette.c3 },
        BufferCurrentIndex = { fg = palette.c7, bg = palette.c3 },
        BufferCurrentMod = { fg = palette.c7, bg = palette.c3 },
        BufferCurrentSign = { fg = palette.c6, bg = palette.c3 },
        BufferCurrentTarget = { fg = palette.gold, bg = palette.c3 },
        BufferInactive = { fg = palette.c6 },
        BufferInactiveIndex = { fg = palette.c6 },
        BufferInactiveMod = { fg = palette.c7 },
        BufferInactiveSign = { fg = palette.c5 },
        BufferInactiveTarget = { fg = palette.gold },
        BufferTabpageFill = { fg = "NONE", bg = "NONE" },
        BufferVisible = { fg = palette.c6 },
        BufferVisibleIndex = { fg = palette.c6 },
        BufferVisibleMod = { fg = palette.c7 },
        BufferVisibleSign = { fg = palette.c5 },
        BufferVisibleTarget = { fg = palette.gold },

        -- lewis6991/gitsigns.nvim
        GitSignsAdd = { fg = groups.git_add, bg = "NONE" },
        GitSignsChange = { fg = groups.git_change, bg = "NONE" },
        GitSignsDelete = { fg = groups.git_delete, bg = "NONE" },
        SignAdd = { fg = groups.git_add, bg = "NONE" },
        SignChange = { fg = groups.git_change, bg = "NONE" },
        SignDelete = { fg = groups.git_delete, bg = "NONE" },

        -- mvllow/modes.nvim
        ModesCopy = { bg = palette.gold },
        ModesDelete = { bg = palette.red },
        ModesFormat = { bg = palette.c7 },
        ModesInsert = { bg = palette.c7 },
        ModesReplace = { bg = palette.c6 },
        ModesVisual = { bg = palette.c6 },

        -- kyazdani42/nvim-tree.lua
        NvimTreeEmptyFolderName = { fg = palette.c5 },
        NvimTreeFileDeleted = { fg = groups.git_delete },
        NvimTreeFileDirty = { fg = groups.git_dirty },
        NvimTreeFileMerge = { fg = groups.git_merge },
        NvimTreeFileNew = { fg = palette.c7 },
        NvimTreeFileRenamed = { fg = groups.git_rename },
        NvimTreeFileStaged = { fg = groups.git_stage },
        NvimTreeFolderIcon = { fg = palette.c6 },
        NvimTreeFolderName = { fg = palette.c7 },
        NvimTreeGitDeleted = { fg = groups.git_delete },
        NvimTreeGitDirty = { fg = groups.git_dirty },
        NvimTreeGitIgnored = { fg = groups.git_ignore },
        NvimTreeGitMerge = { fg = groups.git_merge },
        NvimTreeGitNew = { fg = groups.git_add },
        NvimTreeGitRenamed = { fg = groups.git_rename },
        NvimTreeGitStaged = { fg = groups.git_stage },
        NvimTreeImageFile = { fg = palette.c7 },
        NvimTreeNormal = { link = "Normal" },
        NvimTreeOpenedFile = { fg = palette.c7, bg = palette.c3 },
        NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
        NvimTreeRootFolder = { fg = palette.c7, bold = styles.bold },
        NvimTreeSpecialFile = { link = "NvimTreeNormal" },
        NvimTreeWindowPicker = { link = "StatusLineTerm" },

        -- nvim-neotest/neotest
        NeotestAdapterName = { fg = palette.c6 },
        NeotestBorder = { fg = palette.c7 },
        NeotestDir = { fg = palette.c7 },
        NeotestExpandMarker = { fg = palette.c5 },
        NeotestFailed = { fg = palette.red },
        NeotestFile = { fg = palette.c7 },
        NeotestFocused = { fg = palette.gold, bg = palette.c5 },
        NeotestIndent = { fg = palette.c5 },
        NeotestMarked = { fg = palette.c7, bold = styles.bold },
        NeotestNamespace = { fg = palette.gold },
        NeotestPassed = { fg = palette.c6 },
        NeotestRunning = { fg = palette.gold },
        NeotestWinSelect = { fg = palette.c5 },
        NeotestSkipped = { fg = palette.c6 },
        NeotestTarget = { fg = palette.red },
        NeotestTest = { fg = palette.gold },
        NeotestUnknown = { fg = palette.c6 },
        NeotestWatching = { fg = palette.c6 },

        -- nvim-neo-tree/neo-tree.nvim
        NeoTreeGitAdded = { fg = groups.git_add },
        NeoTreeGitConflict = { fg = groups.git_merge },
        NeoTreeGitDeleted = { fg = groups.git_delete },
        NeoTreeGitIgnored = { fg = groups.git_ignore },
        NeoTreeGitModified = { fg = groups.git_dirty },
        NeoTreeGitRenamed = { fg = groups.git_rename },
        NeoTreeGitUntracked = { fg = groups.git_untracked },
        NeoTreeTabActive = { fg = palette.c7, bg = palette.c3 },
        NeoTreeTabInactive = { fg = palette.c6 },
        NeoTreeTabSeparatorActive = { link = "WinSeparator" },
        NeoTreeTabSeparatorInactive = { link = "WinSeparator" },
        NeoTreeTitleBar = { link = "StatusLineTerm" },

        -- folke/flash.nvim
        FlashLabel = { fg = palette.c2, bg = palette.red },

        -- folke/which-key.nvim
        WhichKey = { fg = palette.c6 },
        WhichKeyBorder = make_border(),
        WhichKeyDesc = { fg = palette.gold },
        WhichKeyFloat = { bg = palette.c1 },
        WhichKeyGroup = { fg = palette.c7 },
        WhichKeyIcon = { fg = palette.c6 },
        WhichKeyIconAzure = { fg = palette.c6 },
        WhichKeyIconBlue = { fg = palette.c6 },
        WhichKeyIconCyan = { fg = palette.c7 },
        WhichKeyIconGreen = { fg = palette.c6 },
        WhichKeyIconGrey = { fg = palette.c6 },
        WhichKeyIconOrange = { fg = palette.c7 },
        WhichKeyIconPurple = { fg = palette.c6 },
        WhichKeyIconRed = { fg = palette.red },
        WhichKeyIconYellow = { fg = palette.gold },
        WhichKeyNormal = { link = "NormalFloat" },
        WhichKeySeparator = { fg = palette.c6 },
        WhichKeyTitle = { link = "FloatTitle" },
        WhichKeyValue = { fg = palette.c7 },

        -- lukas-reineke/indent-blankline.nvim
        IblIndent = { fg = palette.c4 },
        IblScope = { fg = palette.c7 },
        IblWhitespace = { fg = palette.c4 },

        -- hrsh7th/nvim-cmp
        CmpItemAbbr = { fg = palette.c6 },
        CmpItemAbbrDeprecated = { fg = palette.c6, strikethrough = true },
        CmpItemAbbrMatch = { fg = palette.c7, bold = styles.bold },
        CmpItemAbbrMatchFuzzy = { fg = palette.c7, bold = styles.bold },
        CmpItemKind = { fg = palette.c6 },
        CmpItemKindClass = { link = "StorageClass" },
        CmpItemKindFunction = { link = "Function" },
        CmpItemKindInterface = { link = "Type" },
        CmpItemKindMethod = { link = "PreProc" },
        CmpItemKindSnippet = { link = "String" },
        CmpItemKindVariable = { link = "Identifier" },

        -- NeogitOrg/neogit
        -- https://github.com/NeogitOrg/neogit/blob/master/lua/neogit/lib/hl.lua#L109-L198
        NeogitChangeAdded = { fg = groups.git_add, bold = styles.bold, italic = styles.italic },
        NeogitChangeBothModified = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
        NeogitChangeCopied = { fg = groups.git_untracked, bold = styles.bold, italic = styles.italic },
        NeogitChangeDeleted = { fg = groups.git_delete, bold = styles.bold, italic = styles.italic },
        NeogitChangeModified = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
        NeogitChangeNewFile = { fg = groups.git_stage, bold = styles.bold, italic = styles.italic },
        NeogitChangeRenamed = { fg = groups.git_rename, bold = styles.bold, italic = styles.italic },
        NeogitChangeUpdated = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
        NeogitDiffAddHighlight = { link = "DiffAdd" },
        NeogitDiffContextHighlight = { bg = palette.c1 },
        NeogitDiffDeleteHighlight = { link = "DiffDelete" },
        NeogitFilePath = { fg = palette.c7, italic = styles.italic },
        NeogitHunkHeader = { bg = palette.c1 },
        NeogitHunkHeaderHighlight = { bg = palette.c1 },

        -- vimwiki/vimwiki
        VimwikiHR = { fg = palette.c6 },
        VimwikiHeader1 = { link = "markdownH1" },
        VimwikiHeader2 = { link = "markdownH2" },
        VimwikiHeader3 = { link = "markdownH3" },
        VimwikiHeader4 = { link = "markdownH4" },
        VimwikiHeader5 = { link = "markdownH5" },
        VimwikiHeader6 = { link = "markdownH6" },
        VimwikiHeaderChar = { fg = palette.c6 },
        VimwikiLink = { link = "markdownUrl" },
        VimwikiList = { fg = palette.c6 },
        VimwikiNoExistsLink = { fg = palette.red },

        -- nvim-neorg/neorg
        NeorgHeading1Prefix = { link = "markdownH1Delimiter" },
        NeorgHeading1Title = { link = "markdownH1" },
        NeorgHeading2Prefix = { link = "markdownH2Delimiter" },
        NeorgHeading2Title = { link = "markdownH2" },
        NeorgHeading3Prefix = { link = "markdownH3Delimiter" },
        NeorgHeading3Title = { link = "markdownH3" },
        NeorgHeading4Prefix = { link = "markdownH4Delimiter" },
        NeorgHeading4Title = { link = "markdownH4" },
        NeorgHeading5Prefix = { link = "markdownH5Delimiter" },
        NeorgHeading5Title = { link = "markdownH5" },
        NeorgHeading6Prefix = { link = "markdownH6Delimiter" },
        NeorgHeading6Title = { link = "markdownH6" },
        NeorgMarkerTitle = { fg = palette.c7, bold = styles.bold },

        -- tami5/lspsaga.nvim (fork of glepnir/lspsaga.nvim)
        DefinitionCount = { fg = palette.c7 },
        DefinitionIcon = { fg = palette.c7 },
        DefinitionPreviewTitle = { fg = palette.c7, bold = styles.bold },
        LspFloatWinBorder = make_border(),
        LspFloatWinNormal = { bg = palette.c1 },
        LspSagaAutoPreview = { fg = palette.c6 },
        LspSagaCodeActionBorder = make_border("text"),
        LspSagaCodeActionContent = { fg = palette.c7 },
        LspSagaCodeActionTitle = { fg = palette.gold, bold = styles.bold },
        LspSagaCodeActionTruncateLine = { link = "LspSagaCodeActionBorder" },
        LspSagaDefPreviewBorder = make_border(),
        LspSagaDiagnosticBorder = make_border("text"),
        LspSagaDiagnosticHeader = { fg = palette.c7, bold = styles.bold },
        LspSagaDiagnosticTruncateLine = { link = "LspSagaDiagnosticBorder" },
        LspSagaDocTruncateLine = { link = "LspSagaHoverBorder" },
        LspSagaFinderSelection = { fg = palette.gold },
        LspSagaHoverBorder = { link = "LspFloatWinBorder" },
        LspSagaLspFinderBorder = { link = "LspFloatWinBorder" },
        LspSagaRenameBorder = make_border("text"),
        LspSagaRenamePromptPrefix = { fg = palette.red },
        LspSagaShTruncateLine = { link = "LspSagaSignatureHelpBorder" },
        LspSagaSignatureHelpBorder = make_border("text"),
        ReferencesCount = { fg = palette.c7 },
        ReferencesIcon = { fg = palette.c7 },
        SagaShadow = { bg = palette.c1 },
        TargetWord = { fg = palette.c6 },

        -- ray-x/lsp_signature.nvim
        LspSignatureActiveParameter = { bg = palette.c3 },

        -- rlane/pounce.nvim
        PounceAccept = { fg = palette.red, bg = palette.red, blend = 20 },
        PounceAcceptBest = { fg = palette.gold, bg = palette.gold, blend = 20 },
        PounceGap = { link = "Search" },
        PounceMatch = { link = "Search" },

        -- ggandor/leap.nvim
        LeapLabelPrimary = { link = "IncSearch" },
        LeapLabelSecondary = { link = "StatusLineTerm" },
        LeapMatch = { link = "MatchParen" },

        -- phaazon/hop.nvim
        -- smoka7/hop.nvim
        HopNextKey = { fg = palette.red, bg = palette.red, blend = 20 },
        HopNextKey1 = { fg = palette.c7, bg = palette.c7, blend = 20 },
        HopNextKey2 = { fg = palette.c6, bg = palette.c6, blend = 20 },
        HopUnmatched = { fg = palette.c5 },

        -- nvim-telescope/telescope.nvim
        TelescopeBorder = make_border(),
        TelescopeMatching = { fg = palette.string },
        TelescopeNormal = { link = "NormalFloat" },
        TelescopePromptNormal = { link = "TelescopeNormal" },
        TelescopePromptPrefix = { fg = palette.c6 },
        TelescopeSelection = { fg = palette.c7, bg = palette.c3 },
        TelescopeSelectionCaret = { fg = palette.c7, bg = palette.c3 },
        TelescopeTitle = { fg = palette.c7, bold = styles.bold },

        -- ibhagwan/fzf-lua
        FzfLuaBorder = make_border(),
        FzfLuaBufFlagAlt = { fg = palette.c6 },
        FzfLuaBufFlagCur = { fg = palette.c6 },
        FzfLuaCursorLine = { fg = palette.c7, bg = palette.c3 },
        FzfLuaFilePart = { fg = palette.c7 },
        FzfLuaHeaderBind = { fg = palette.c7 },
        FzfLuaHeaderText = { fg = palette.red },
        FzfLuaNormal = { link = "NormalFloat" },
        FzfLuaTitle = { link = "FloatTitle" },

        -- rcarriga/nvim-notify
        NotifyBackground = { link = "NormalFloat" },
        NotifyDEBUGBody = { link = "NormalFloat" },
        NotifyDEBUGBorder = make_border(),
        NotifyDEBUGIcon = { link = "NotifyDEBUGTitle" },
        NotifyDEBUGTitle = { fg = palette.c5 },
        NotifyERRORBody = { link = "NormalFloat" },
        NotifyERRORBorder = make_border("text"),
        NotifyERRORIcon = { link = "NotifyERRORTitle" },
        NotifyERRORTitle = { fg = groups.error },
        NotifyINFOBody = { link = "NormalFloat" },
        NotifyINFOBorder = make_border("text"),
        NotifyINFOIcon = { link = "NotifyINFOTitle" },
        NotifyINFOTitle = { fg = groups.info },
        NotifyTRACEBody = { link = "NormalFloat" },
        NotifyTRACEBorder = make_border("text"),
        NotifyTRACEIcon = { link = "NotifyTRACETitle" },
        NotifyTRACETitle = { fg = palette.c6 },
        NotifyWARNBody = { link = "NormalFloat" },
        NotifyWARNBorder = make_border("text"),
        NotifyWARNIcon = { link = "NotifyWARNTitle" },
        NotifyWARNTitle = { fg = groups.warn },

        -- rcarriga/nvim-dap-ui
        DapUIBreakpointsCurrentLine = { fg = palette.gold, bold = styles.bold },
        DapUIBreakpointsDisabledLine = { fg = palette.c5 },
        DapUIBreakpointsInfo = { link = "DapUIThread" },
        DapUIBreakpointsLine = { link = "DapUIBreakpointsPath" },
        DapUIBreakpointsPath = { fg = palette.c7 },
        DapUIDecoration = { link = "DapUIBreakpointsPath" },
        DapUIFloatBorder = make_border(),
        DapUIFrameName = { fg = palette.c7 },
        DapUILineNumber = { link = "DapUIBreakpointsPath" },
        DapUIModifiedValue = { fg = palette.c7, bold = styles.bold },
        DapUIScope = { link = "DapUIBreakpointsPath" },
        DapUISource = { fg = palette.c6 },
        DapUIStoppedThread = { link = "DapUIBreakpointsPath" },
        DapUIThread = { fg = palette.gold },
        DapUIValue = { fg = palette.c7 },
        DapUIVariable = { fg = palette.c7 },
        DapUIType = { fg = palette.c6 },
        DapUIWatchesEmpty = { fg = palette.red },
        DapUIWatchesError = { link = "DapUIWatchesEmpty" },
        DapUIWatchesValue = { link = "DapUIThread" },

        -- glepnir/dashboard-nvim
        DashboardCenter = { fg = palette.gold },
        DashboardFooter = { fg = palette.c6 },
        DashboardHeader = { fg = palette.c6 },
        DashboardShortcut = { fg = palette.red },

        -- SmiteshP/nvim-navic
        NavicIconsArray = { fg = palette.gold },
        NavicIconsBoolean = { fg = palette.c7 },
        NavicIconsClass = { fg = palette.c7 },
        NavicIconsConstant = { fg = palette.gold },
        NavicIconsConstructor = { fg = palette.gold },
        NavicIconsEnum = { fg = palette.gold },
        NavicIconsEnumMember = { fg = palette.c7 },
        NavicIconsEvent = { fg = palette.gold },
        NavicIconsField = { fg = palette.c70 },
        NavicIconsFile = { fg = palette.c5 },
        NavicIconsFunction = { fg = palette.c70 },
        NavicIconsInterface = { fg = palette.c7 },
        NavicIconsKey = { fg = palette.c6 },
        NavicIconsKeyword = { fg = palette.c6 },
        NavicIconsMethod = { fg = palette.c70 },
        NavicIconsModule = { fg = palette.c7 },
        NavicIconsNamespace = { fg = palette.c5 },
        NavicIconsNull = { fg = palette.red },
        NavicIconsNumber = { fg = palette.gold },
        NavicIconsObject = { fg = palette.gold },
        NavicIconsOperator = { fg = palette.c6 },
        NavicIconsPackage = { fg = palette.c5 },
        NavicIconsProperty = { fg = palette.c70 },
        NavicIconsString = { fg = palette.gold },
        NavicIconsStruct = { fg = palette.c7 },
        NavicIconsTypeParameter = { fg = palette.c7 },
        NavicIconsVariable = { fg = palette.c7 },
        NavicSeparator = { fg = palette.c6 },
        NavicText = { fg = palette.c6 },

        -- folke/noice.nvim
        NoiceCursor = { fg = palette.c7, bg = palette.c7 },

        -- folke/trouble.nvim
        -- Main backgrounds - THIS IS KEY for Trouble!
        TroubleNormal = { fg = palette.c7, bg = palette.c1 },
        TroubleNormalNC = { fg = palette.c7, bg = palette.c1 },
        -- Cursor - prevents highlight_low from showing
        TroubleCursor = { bg = palette.c1 },
        TroubleCursorLine = { bg = palette.c1 },
        -- Text and content
        TroubleText = { fg = palette.c6, bg = palette.c1 },
        TroubleTextHover = { fg = palette.c7, bg = palette.c1 },
        TroubleCount = { fg = palette.c6, bg = palette.c1 },
        TroubleCode = { fg = palette.c7, bg = palette.c1 },
        -- File info
        TroublePos = { fg = palette.c6, bg = palette.c1 },
        TroubleLocation = { fg = palette.c6, bg = palette.c1 },
        TroubleFile = { fg = palette.c7, bg = palette.c1 },
        TroubleDirectory = { fg = palette.c7, bg = palette.c1 },
        TroubleSource = { fg = palette.c6, bg = palette.c1 },
        TroubleBasename = { fg = palette.c7, bg = palette.c1 },
        TroubleDirname = { fg = palette.c5, bg = palette.c1 },
        -- Indent guides
        TroubleIndent = { fg = palette.c5, bg = palette.c1 },
        TroubleIndentFoldClosed = { fg = palette.c5, bg = palette.c1 },
        TroubleIndentFoldOpen = { fg = palette.c5, bg = palette.c1 },
        -- Diagnostic signs
        TroubleSignError = { fg = palette.red, bg = palette.c1 },
        TroubleSignWarning = { fg = palette.gold, bg = palette.c1 },
        TroubleSignInformation = { fg = palette.c7, bg = palette.c1 },
        TroubleSignHint = { fg = palette.c6, bg = palette.c1 },
        TroubleSignOther = { fg = palette.c6, bg = palette.c1 },

        -- echasnovski/mini.nvim
        MiniAnimateCursor = { reverse = true, nocombine = true },
        MiniAnimateNormalFloat = { link = "NormalFloat" },

        MiniClueBorder = { link = "FloatBorder" },
        MiniClueDescGroup = { link = "DiagnosticFloatingWarn" },
        MiniClueDescSingle = { link = "NormalFloat" },
        MiniClueNextKey = { link = "DiagnosticFloatingHint" },
        MiniClueNextKeyWithPostkeys = { link = "DiagnosticFloatingError" },
        MiniClueSeparator = { link = "DiagnosticFloatingInfo" },
        MiniClueTitle = { bg = palette.c1, bold = styles.bold },

        MiniCompletionActiveParameter = { underline = true },

        MiniCursorword = { underline = true },
        MiniCursorwordCurrent = { underline = true },

        MiniDepsChangeAdded = { fg = groups.git_add },
        MiniDepsChangeRemoved = { fg = groups.git_delete },
        MiniDepsHint = { link = "DiagnosticHint" },
        MiniDepsInfo = { link = "DiagnosticInfo" },
        MiniDepsMsgBreaking = { link = "DiagnosticWarn" },
        MiniDepsPlaceholder = { link = "Comment" },
        MiniDepsTitle = { link = "Title" },
        MiniDepsTitleError = { link = "DiffDelete" },
        MiniDepsTitleSame = { link = "DiffText" },
        MiniDepsTitleUpdate = { link = "DiffAdd" },

        MiniDiffOverAdd = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
        MiniDiffOverChange = { fg = groups.git_change, bg = groups.git_change, blend = 20 },
        MiniDiffOverContext = { bg = palette.c1 },
        MiniDiffOverDelete = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
        MiniDiffSignAdd = { fg = groups.git_add },
        MiniDiffSignChange = { fg = groups.git_change },
        MiniDiffSignDelete = { fg = groups.git_delete },

        MiniFilesBorder = { link = "FloatBorder" },
        MiniFilesBorderModified = { link = "DiagnosticFloatingWarn" },
        MiniFilesCursorLine = { link = "CursorLine" },
        MiniFilesDirectory = { link = "Directory" },
        MiniFilesFile = { fg = palette.c7 },
        MiniFilesNormal = { link = "NormalFloat" },
        MiniFilesTitle = { link = "FloatTitle" },
        MiniFilesTitleFocused = { fg = palette.c7, bg = palette.c1, bold = styles.bold },

        MiniHipatternsFixme = { fg = palette.c2, bg = groups.error, bold = styles.bold },
        MiniHipatternsHack = { fg = palette.c2, bg = groups.warn, bold = styles.bold },
        MiniHipatternsNote = { fg = palette.c2, bg = groups.info, bold = styles.bold },
        MiniHipatternsTodo = { fg = palette.c2, bg = groups.hint, bold = styles.bold },

        MiniIconsAzure = { fg = palette.c7 },
        MiniIconsBlue = { fg = palette.c6 },
        MiniIconsCyan = { fg = palette.c7 },
        MiniIconsGreen = { fg = palette.c6 },
        MiniIconsGrey = { fg = palette.c6 },
        MiniIconsOrange = { fg = palette.c7 },
        MiniIconsPurple = { fg = palette.c6 },
        MiniIconsRed = { fg = palette.red },
        MiniIconsYellow = { fg = palette.gold },

        MiniIndentscopeSymbol = { fg = palette.c5 },
        MiniIndentscopeSymbolOff = { fg = palette.gold },

        MiniJump = { sp = palette.gold, undercurl = true },

        MiniJump2dDim = { fg = palette.c6 },
        MiniJump2dSpot = { fg = palette.gold, bold = styles.bold, nocombine = true },
        MiniJump2dSpotAhead = { fg = palette.c7, bg = palette.c1, nocombine = true },
        MiniJump2dSpotUnique = { fg = palette.c7, bold = styles.bold, nocombine = true },

        MiniMapNormal = { link = "NormalFloat" },
        MiniMapSymbolCount = { link = "Special" },
        MiniMapSymbolLine = { link = "Title" },
        MiniMapSymbolView = { link = "Delimiter" },

        MiniNotifyBorder = { link = "FloatBorder" },
        MiniNotifyNormal = { link = "NormalFloat" },
        MiniNotifyTitle = { link = "FloatTitle" },

        MiniOperatorsExchangeFrom = { link = "IncSearch" },

        MiniPickBorder = { link = "FloatBorder" },
        MiniPickBorderBusy = { link = "DiagnosticFloatingWarn" },
        MiniPickBorderText = { fg = palette.c7, bg = palette.c1 },
        MiniPickIconDirectory = { link = "Directory" },
        MiniPickIconFile = { link = "MiniPickNormal" },
        MiniPickHeader = { link = "DiagnosticFloatingHint" },
        MiniPickMatchCurrent = { link = "CursorLine" },
        MiniPickMatchMarked = { link = "Visual" },
        MiniPickMatchRanges = { fg = palette.c7 },
        MiniPickNormal = { link = "NormalFloat" },
        MiniPickPreviewLine = { link = "CursorLine" },
        MiniPickPreviewRegion = { link = "IncSearch" },
        MiniPickPrompt = { bg = palette.c1, bold = styles.bold },

        MiniStarterCurrent = { nocombine = true },
        MiniStarterFooter = { fg = palette.c6 },
        MiniStarterHeader = { link = "Title" },
        MiniStarterInactive = { link = "Comment" },
        MiniStarterItem = { link = "Normal" },
        MiniStarterItemBullet = { link = "Delimiter" },
        MiniStarterItemPrefix = { link = "WarningMsg" },
        MiniStarterSection = { fg = palette.c7 },
        MiniStarterQuery = { link = "MoreMsg" },

        MiniStatuslineDevinfo = { fg = palette.c6, bg = palette.c1 },
        MiniStatuslineFileinfo = { link = "MiniStatuslineDevinfo" },
        MiniStatuslineFilename = { fg = palette.c5, bg = palette.c1 },
        MiniStatuslineInactive = { link = "MiniStatuslineFilename" },
        MiniStatuslineModeCommand = { fg = palette.c2, bg = palette.red, bold = styles.bold },
        MiniStatuslineModeInsert = { fg = palette.c2, bg = palette.c7, bold = styles.bold },
        MiniStatuslineModeNormal = { fg = palette.c2, bg = palette.c7, bold = styles.bold },
        MiniStatuslineModeOther = { fg = palette.c2, bg = palette.c7, bold = styles.bold },
        MiniStatuslineModeReplace = { fg = palette.c2, bg = palette.c6, bold = styles.bold },
        MiniStatuslineModeVisual = { fg = palette.c2, bg = palette.c6, bold = styles.bold },

        MiniSurround = { link = "IncSearch" },

        MiniTablineCurrent = { fg = palette.c7, bg = palette.c3, bold = styles.bold },
        MiniTablineFill = { link = "TabLineFill" },
        MiniTablineHidden = { fg = palette.c6, bg = palette.c1 },
        MiniTablineModifiedCurrent = { fg = palette.c4, bg = palette.c7, bold = styles.bold },
        MiniTablineModifiedHidden = { fg = groups.panel, bg = palette.c6 },
        MiniTablineModifiedVisible = { fg = groups.panel, bg = palette.c7 },
        MiniTablineTabpagesection = { link = "Search" },
        MiniTablineVisible = { fg = palette.c7, bg = palette.c1 },

        MiniTestEmphasis = { bold = styles.bold },
        MiniTestFail = { fg = palette.red, bold = styles.bold },
        MiniTestPass = { fg = palette.c7, bold = styles.bold },

        MiniTrailspace = { bg = palette.red },

        -- goolord/alpha-nvim
        AlphaButtons = { fg = palette.c7 },
        AlphaFooter = { fg = palette.gold },
        AlphaHeader = { fg = palette.c6 },
        AlphaShortcut = { fg = palette.c7 },

        -- github/copilot.vim
        CopilotSuggestion = { fg = palette.c5, italic = styles.italic },

        -- nvim-treesitter/nvim-treesitter-context
        TreesitterContext = { link = "Normal" },
        TreesitterContextLineNumber = { link = "LineNr" },
        TreesitterContextBottom = { underline = true, sp = palette.c4 },
        TreesitterContextLineNumberBottom = { underline = true, sp = palette.c4 },
        TreesitterContextSeparator = { link = "FloatBorder" },

        -- RRethy/vim-illuminate
        IlluminatedWordRead = { link = "LspReferenceRead" },
        IlluminatedWordText = { link = "LspReferenceText" },
        IlluminatedWordWrite = { link = "LspReferenceWrite" },

        -- HiPhish/rainbow-delimiters.nvim
        RainbowDelimiterBlue = { fg = palette.c6 },
        RainbowDelimiterCyan = { fg = palette.c7 },
        RainbowDelimiterGreen = { fg = palette.c6 },
        RainbowDelimiterOrange = { fg = palette.c7 },
        RainbowDelimiterRed = { fg = palette.red },
        RainbowDelimiterViolet = { fg = palette.c6 },
        RainbowDelimiterYellow = { fg = palette.gold },

        -- MeanderingProgrammer/render-markdown.nvim
        RenderMarkdownBullet = { fg = palette.c7 },
        RenderMarkdownChecked = { fg = palette.c7 },
        RenderMarkdownCode = { bg = palette.c1 },
        RenderMarkdownCodeInline = { fg = palette.c7, bg = palette.c1 },
        RenderMarkdownDash = { fg = palette.c5 },
        RenderMarkdownH1Bg = { bg = groups.h1, blend = 20 },
        RenderMarkdownH2Bg = { bg = groups.h2, blend = 20 },
        RenderMarkdownH3Bg = { bg = groups.h3, blend = 20 },
        RenderMarkdownH4Bg = { bg = groups.h4, blend = 20 },
        RenderMarkdownH5Bg = { bg = groups.h5, blend = 20 },
        RenderMarkdownH6Bg = { bg = groups.h6, blend = 20 },
        RenderMarkdownQuote = { fg = palette.c6 },
        RenderMarkdownTableFill = { link = "Conceal" },
        RenderMarkdownTableHead = { fg = palette.c6 },
        RenderMarkdownTableRow = { fg = palette.c6 },
        RenderMarkdownUnchecked = { fg = palette.c6 },

        -- MagicDuck/grug-far.nvim
        GrugFarHelpHeader = { fg = palette.c6 },
        GrugFarHelpHeaderKey = { fg = palette.gold },
        GrugFarHelpWinActionKey = { fg = palette.gold },
        GrugFarHelpWinActionPrefix = { fg = palette.c7 },
        GrugFarHelpWinActionText = { fg = palette.c6 },
        GrugFarHelpWinHeader = { link = "FloatTitle" },
        GrugFarInputLabel = { fg = palette.c7 },
        GrugFarInputPlaceholder = { link = "Comment" },
        GrugFarResultsActionMessage = { fg = palette.c7 },
        GrugFarResultsChangeIndicator = { fg = groups.git_change },
        GrugFarResultsRemoveIndicator = { fg = groups.git_delete },
        GrugFarResultsAddIndicator = { fg = groups.git_add },
        GrugFarResultsHeader = { fg = palette.c6 },
        GrugFarResultsLineNo = { fg = palette.c6 },
        GrugFarResultsLineColumn = { link = "GrugFarResultsLineNo" },
        GrugFarResultsMatch = { link = "CurSearch" },
        GrugFarResultsPath = { fg = palette.c7 },
        GrugFarResultsStats = { fg = palette.c6 },

        -- yetone/avante.nvim
        AvanteTitle = { fg = palette.c7, bg = palette.c7 },
        AvanteReversedTitle = { fg = palette.c7 },
        AvanteSubtitle = { fg = palette.c5, bg = palette.c7 },
        AvanteReversedSubtitle = { fg = palette.c7 },
        AvanteThirdTitle = { fg = palette.c5, bg = palette.c6 },
        AvanteReversedThirdTitle = { fg = palette.c6 },
        AvantePromptInput = { fg = palette.c7, bg = palette.c1 },
        AvantePromptInputBorder = { fg = groups.border },

        -- Saghen/blink.cmp
        BlinkCmpMenu = { fg = palette.c7, bg = palette.c1 },
        BlinkCmpMenuBorder = { fg = palette.c7, bg = palette.c1 },
        BlinkCmpMenuSelection = { fg = palette.c1, bg = palette.c7 },
        BlinkCmpScrollBarThumb = { bg = palette.c5 },
        BlinkCmpScrollBarGutter = { bg = palette.c1 },
        BlinkCmpLabel = { fg = palette.c7, bg = palette.c1 },
        BlinkCmpLabelDeprecated = { fg = palette.c5, bg = palette.c1 },
        BlinkCmpLabelMatch = { underline = true },
        BlinkCmpLabelDetail = { fg = palette.c6, bg = palette.c1 },
        BlinkCmpLabelDescription = { fg = palette.c6, bg = palette.c1 },
        BlinkCmpKind = { fg = palette.c6, bg = palette.c1 },
        BlinkCmpSource = { fg = palette.c5, bg = palette.c1 },
        BlinkCmpGhostText = { fg = palette.c5, bg = "NONE" },
        BlinkCmpDoc = { fg = palette.c7, bg = palette.c1 },
        BlinkCmpDocBorder = { fg = palette.c7, bg = palette.c1 },
        BlinkCmpDocSeparator = { fg = palette.c5, bg = palette.c1 },
        BlinkCmpDocCursorLine = { bg = palette.c3 },
        BlinkCmpSignatureHelp = { fg = palette.c7, bg = palette.c1 },
        BlinkCmpSignatureHelpBorder = { fg = palette.c7, bg = palette.c1 },
        BlinkCmpSignatureHelpActiveParameter = { fg = palette.c7, bg = palette.c1 },

        blinkcmpdefault = { fg = palette.c7 },
        blinkcmpkindtext = { fg = palette.c7 },
        BlinkCmpKindMethod = { fg = palette.c70 },
        BlinkCmpKindFunction = { fg = palette.c70 },
        BlinkCmpKindConstructor = { fg = palette.c7 },
        BlinkCmpKindField = { fg = palette.c70 },
        BlinkCmpKindVariable = { fg = palette.c7 },
        BlinkCmpKindClass = { fg = palette.c7 },
        BlinkCmpKindInterface = { fg = palette.c7 },
        BlinkCmpKindModule = { fg = palette.c7 },
        BlinkCmpKindProperty = { fg = palette.c70 },
        BlinkCmpKindUnit = { fg = palette.c7 },
        BlinkCmpKindValue = { fg = palette.c7 },
        BlinkCmpKindKeyword = { fg = palette.c7 },
        BlinkCmpKindSnippet = { fg = palette.c7 },
        BlinkCmpKindColor = { fg = palette.c7 },
        BlinkCmpKindFile = { fg = palette.c7 },
        BlinkCmpKindReference = { fg = palette.c7 },
        BlinkCmpKindFolder = { fg = palette.c7 },
        BlinkCmpKindEnum = { fg = palette.c7 },
        BlinkCmpKindEnumMember = { fg = palette.c7 },
        BlinkCmpKindConstant = { fg = palette.c7 },
        BlinkCmpKindStruct = { fg = palette.c7 },
        BlinkCmpKindEvent = { fg = palette.c7 },
        BlinkCmpKindOperator = { fg = palette.c7 },
        BlinkCmpKindTypeParameter = { fg = palette.c7 },
        BlinkCmpKindCodeium = { fg = palette.c7 },
        BlinkCmpKindCopilot = { fg = palette.c7 },
        BlinkCmpKindSupermaven = { fg = palette.c7 },
        BlinkCmpKindTabNine = { fg = palette.c7 },

        -- folke/snacks.nvim
        SnacksIndent = { fg = palette.c4 },
        SnacksIndentChunk = { fg = palette.c4 },
        SnacksIndentBlank = { fg = palette.c4 },
        SnacksIndentScope = { fg = palette.c7 },

        SnacksPicker = { fg = palette.c7, bg = palette.c1 },
        SnacksPickerBorder = { fg = palette.c7, bg = palette.c1 },
        SnacksPickerList = { fg = palette.c7, bg = palette.c1 },
        SnacksPickerPreview = { fg = palette.c7, bg = palette.c1 },
        SnacksPickerInput = { fg = palette.c7, bg = palette.c1 },
        SnacksPickerMatch = { underline = true },

        -- justinmk/vim-sneak
        Sneak = { fg = palette.c2, bg = palette.red },
        SneakCurrent = { link = "StatusLineTerm" },
        SneakScope = { link = "IncSearch" },

        -- sindrets/diffview.nvim
        DiffviewPrimary = { fg = palette.c6 },
        DiffviewSecondary = { fg = palette.c7 },
        DiffviewNormal = { fg = palette.c7, bg = palette.c1 },
        DiffviewWinSeparator = { fg = palette.c7, bg = palette.c1 },

        DiffviewFilePanelTitle = { fg = palette.c7, bold = styles.bold },
        DiffviewFilePanelCounter = { fg = palette.c7 },
        DiffviewFilePanelRootPath = { fg = palette.c7, bold = styles.bold },
        DiffviewFilePanelFileName = { fg = palette.c7 },
        DiffviewFilePanelSelected = { fg = palette.gold },
        DiffviewFilePanelPath = { link = "Comment" },

        DiffviewFilePanelInsertions = { fg = groups.git_add },
        DiffviewFilePanelDeletions = { fg = groups.git_delete },
        DiffviewFilePanelConflicts = { fg = groups.git_merge },
        DiffviewFolderName = { fg = palette.c7, bold = styles.bold },
        DiffviewFolderSign = { fg = palette.c6 },
        DiffviewHash = { fg = palette.c7 },
        DiffviewReference = { fg = palette.c7, bold = styles.bold },
        DiffviewReflogSelector = { fg = palette.c7 },
        DiffviewStatusAdded = { fg = groups.git_add },
        DiffviewStatusUntracked = { fg = groups.untracked },
        DiffviewStatusModified = { fg = groups.git_change },
        DiffviewStatusRenamed = { fg = groups.git_rename },
        DiffviewStatusCopied = { fg = groups.untracked },
        DiffviewStatusTypeChange = { fg = groups.git_change },
        DiffviewStatusUnmerged = { fg = groups.git_change },
        DiffviewStatusUnknown = { fg = groups.git_delete },
        DiffviewStatusDeleted = { fg = groups.git_delete },
        DiffviewStatusBroken = { fg = groups.git_delete },
        DiffviewStatusIgnored = { fg = groups.git_ignore },
    }
    local transparency_highlights = {
        DiagnosticVirtualTextError = { fg = groups.error },
        DiagnosticVirtualTextHint = { fg = groups.hint },
        DiagnosticVirtualTextInfo = { fg = groups.info },
        DiagnosticVirtualTextOk = { fg = groups.ok },
        DiagnosticVirtualTextWarn = { fg = palette.c6 },

        FloatBorder = { fg = palette.c7, bg = "NONE" },
        FloatTitle = { fg = palette.c7, bg = "NONE", bold = styles.bold },
        Folded = { fg = palette.c7, bg = "NONE" },
        NormalFloat = { bg = "NONE" },
        Normal = { fg = palette.c7, bg = "NONE" },
        NormalNC = { fg = palette.c7, bg = config.options.dim_inactive_windows and palette.c1 or "NONE" },
        Pmenu = { fg = palette.c6, bg = "NONE" },
        PmenuKind = { fg = palette.c7, bg = "NONE" },
        SignColumn = { fg = palette.c7, bg = "NONE" },
        StatusLine = { fg = palette.c6, bg = "NONE" },
        StatusLineNC = { fg = palette.c5, bg = "NONE" },
        TabLine = { bg = "NONE", fg = palette.c6 },
        TabLineFill = { bg = "NONE" },
        TabLineSel = { fg = palette.c7, bg = "NONE", bold = styles.bold },

        -- ["@markup.raw"] = { bg = "none" },
        ["@markup.raw.markdown_inline"] = { fg = palette.gold },
        -- ["@markup.raw.block"] = { bg = "none" },

        TelescopeNormal = { fg = palette.c6, bg = "NONE" },
        TelescopePromptNormal = { fg = palette.c7, bg = "NONE" },
        TelescopeSelection = { fg = palette.c7, bg = "NONE", bold = styles.bold },
        TelescopeSelectionCaret = { fg = palette.c7 },

        TroubleNormal = { bg = "NONE" },

        WhichKeyFloat = { bg = "NONE" },
        WhichKeyNormal = { bg = "NONE" },

        IblIndent = { fg = palette.c4, bg = "NONE" },
        IblScope = { fg = palette.c7, bg = "NONE" },
        IblWhitespace = { fg = palette.c4, bg = "NONE" },

        TreesitterContext = { bg = "NONE" },
        TreesitterContextLineNumber = { fg = palette.c7, bg = "NONE" },

        MiniFilesTitleFocused = { fg = palette.c7, bg = "NONE", bold = styles.bold },

        MiniPickPrompt = { bg = "NONE", bold = styles.bold },
        MiniPickBorderText = { fg = palette.c7, bg = "NONE" },
    }

    if config.options.enable.legacy_highlights then
        for group, highlight in pairs(legacy_highlights) do
            highlights[group] = highlight
        end
    end
    for group, highlight in pairs(default_highlights) do
        highlights[group] = highlight
    end
    if styles.transparency then
        for group, highlight in pairs(transparency_highlights) do
            highlights[group] = highlight
        end
    end

    -- Reconcile highlights with config
    if config.options.highlight_groups ~= nil and next(config.options.highlight_groups) ~= nil then
        for group, highlight in pairs(config.options.highlight_groups) do
            local existing = highlights[group] or {}
            -- Traverse link due to
            -- "If link is used in combination with other attributes; only the link will take effect"
            -- see: https://neovim.io/doc/user/api.html#nvim_set_hl()
            while existing.link ~= nil do
                existing = highlights[existing.link] or {}
            end
            local parsed = vim.tbl_extend("force", {}, highlight)

            if highlight.fg ~= nil then
                parsed.fg = utilities.parse_color(highlight.fg) or highlight.fg
            end
            if highlight.bg ~= nil then
                parsed.bg = utilities.parse_color(highlight.bg) or highlight.bg
            end
            if highlight.sp ~= nil then
                parsed.sp = utilities.parse_color(highlight.sp) or highlight.sp
            end

            if (highlight.inherit == nil or highlight.inherit) and existing ~= nil then
                parsed.inherit = nil
                highlights[group] = vim.tbl_extend("force", existing, parsed)
            else
                parsed.inherit = nil
                highlights[group] = parsed
            end
        end
    end

    for group, highlight in pairs(highlights) do
        if config.options.before_highlight ~= nil then
            config.options.before_highlight(group, highlight, palette)
        end

        if highlight.blend ~= nil and (highlight.blend >= 0 and highlight.blend <= 100) and highlight.bg ~= nil then
            highlight.bg = utilities.blend(highlight.bg, highlight.blend_on or palette.c1, highlight.blend / 100)
        end

        highlight.blend = nil
        highlight.blend_on = nil

        if highlight._nvim_blend ~= nil then
            highlight.blend = highlight._nvim_blend
        end

        vim.api.nvim_set_hl(0, group, highlight)
    end

    --- Terminal
    if config.options.enable.terminal then
        vim.g.terminal_color_0 = palette.c4 -- black
        vim.g.terminal_color_8 = palette.c6 -- bright black
        vim.g.terminal_color_1 = palette.red -- red
        vim.g.terminal_color_9 = palette.red -- bright red
        vim.g.terminal_color_2 = palette.c6 -- green
        vim.g.terminal_color_10 = palette.c6 -- bright green
        vim.g.terminal_color_3 = palette.gold -- yellow
        vim.g.terminal_color_11 = palette.gold -- bright yellow
        vim.g.terminal_color_4 = palette.c7 -- blue
        vim.g.terminal_color_12 = palette.c7 -- bright blue
        vim.g.terminal_color_5 = palette.c6 -- magenta
        vim.g.terminal_color_13 = palette.c6 -- bright magenta
        vim.g.terminal_color_6 = palette.c7 -- cyan
        vim.g.terminal_color_14 = palette.c7 -- bright cyan
        vim.g.terminal_color_7 = palette.c7 -- white
        vim.g.terminal_color_15 = palette.c7 -- bright white

        -- Support StatusLineTerm & StatusLineTermNC from vim
        vim.cmd([[
		augroup misirloun
			autocmd!
			autocmd TermOpen * if &buftype=='terminal'
				\|setlocal winhighlight=StatusLine:StatusLineTerm,StatusLineNC:StatusLineTermNC
				\|else|setlocal winhighlight=|endif
			autocmd ColorSchemePre * autocmd! misirloun
		augroup END
		]])
    end
end

function M.colorscheme()
    vim.opt.termguicolors = true
    if vim.g.colors_name then
        vim.cmd("hi clear")
        vim.cmd("syntax reset")
    end
    vim.g.colors_name = "misirloun"
    vim.o.background = "dark"

    set_highlights()
end

---@param options Options
function M.setup(options)
    config.extend_options(options or {})
end

return M
