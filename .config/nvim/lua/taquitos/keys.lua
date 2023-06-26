local maps = vim.api.nvim_set_keymap

local keymap = function(map, f, buffer)
    local mode = "n"
    local command = string.format("<cmd>%s<CR>",f)
    local map_options = {
        noremap = true,
        silent = true,
    }
    if not buffer then
        maps(mode, map, command, map_options)
    else
        maps(0, mode, map, command, map_options)
    end
end

keymap("<leader>r", "!remaps")
keymap("<leader>y", "%y+") -- Copiar todo
maps('n', '<leader>p', ':w!<CR> :so %<CR> :PackerSync<CR>', {noremap = true,}) -- Packer rapidin
keymap("<leader><leader>s", "source ~/.config/nvim/after/plugin/luasnip.lua") -- Recargar snippets

keymap("<leader><leader>g", "lua require('after.plugin.colors').awesome_colors('gruvbox')")
keymap("<leader><leader>c", "lua require('after.plugin.colors').awesome_colors('catppuccin')")
keymap("<leader><leader>t", "lua require('after.plugin.colors').awesome_colors('tokyonight')")

keymap("<space>e", "Lexplore") -- Explorador
keymap("<leader>q", "Startify")
keymap("<leader>u", "UndotreeToggle")
keymap("<space>t", "TroubleToggle") -- LSP diagnostics

keymap("<leader>gc", "!g++ -std=c++14 -o %< %") -- C++

-- Movimiento
-- Movimiento entre ventanas
maps('n', '<C-h>', '<C-w>h', {silent = true}) -- Izquierda
maps('n', '<C-j>', '<C-w>j', {silent = true}) -- Abajo
maps('n', '<C-k>', '<C-w>k', {silent = true}) -- Arriba
maps('n', '<C-l>', '<C-w>l', {silent = true}) -- Derecha
-- Mover texto
maps('v', '<', '<gv', {noremap = true, silent = true}) -- Izquierda
maps('v', '>', '>gv', {noremap = true, silent = true}) -- Derecha

-- Tabs
-- keymap("<leader>t", "tabnew")
-- keymap("tn", "tabnext")
-- keymap("tp", "tabprevious")
-- keymap("tc", "tabclose")

-- Harpoon
keymap("<space>a", "lua require('harpoon.mark').add_file()")
keymap("<space>h", "lua require('harpoon.ui').toggle_quick_menu()")
keymap("<space>1", "lua require('harpoon.ui').nav_file(1)")
keymap("<space>2", "lua require('harpoon.ui').nav_file(2)")
keymap("<space>3", "lua require('harpoon.ui').nav_file(3)")
keymap("<space>4", "lua require('harpoon.ui').nav_file(4)")
keymap("<space>5", "lua require('harpoon.ui').nav_file(5)")
keymap("<space>6", "lua require('harpoon.ui').nav_file(6)")
keymap("<space>7", "lua require('harpoon.ui').nav_file(7)")
keymap("<space>8", "lua require('harpoon.ui').nav_file(8)")
keymap("<space>9", "lua require('harpoon.ui').nav_file(9)")
