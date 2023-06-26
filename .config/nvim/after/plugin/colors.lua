local g = vim.g
local opt = vim.opt
local hl = vim.api.nvim_set_hl
local tokyo = require("tokyonight")

local M = {}

function M.awesome_colors(color)
    opt.termguicolors = true
    opt.background = "dark"
    require("colorizer").setup()

    -- Tokyonight
    tokyo.setup({
        style = "night",
        transparent = true,
        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            -- Background styles. Can be "dark", "transparent" or "normal"
            sidebars = "transparent", -- style for sidebars, see below
            floats = "transparent", -- style for floating windows
        },
    })

    -- Catppuccin
    require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
            light = "latte",
            dark = "mocha",
        },
        transparent_background = true,
        show_end_of_buffer = false, -- show the '~' characters after the end of buffers
        term_colors = true,
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.15,
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            notify = false,
            mini = false,
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
    })

    -- Gruvy
    g.gruvbox_contrast_dark = 'hard'
    g.gruvbox_invert_selection = '0'
    g.gruvbox_italic=1
    g.gruvbox_improved_warnings=1
    g.gruvbox_hls_cursor="purple"

    -- vim.cmd("colorscheme " .. color)
    vim.cmd.colorscheme(color)
    opt.termguicolors = true

    hl(0, "SignColumn", { bg = "None" })
    hl(0, "ColorColumn", { bg = "#232d6b" })
    hl(0, "CursorLineNR", { bg = "None" })
    hl(0, "LineNr", { fg = "#5484b2" })
    hl(0, "NonText", { fg = "#232d6b" })

    -- Activate transparent bg for gruvbox
    if color == "gruvbox" then
        hl(0, "Normal", { ctermbg = "None", bg = "None" })
    end
end

-- M.awesome_colors("gruvbox")
-- M.awesome_colors("tokyonight")
M.awesome_colors("catppuccin")

return M
