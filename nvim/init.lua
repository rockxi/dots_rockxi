-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end
require "lazy_setup"
require "polish"
require('notebook').setup {
    insert_blank_line = true,
    show_index = true,
    show_cell_type = true,
    virtual_text_style = { fg = "lightblue", italic = true },
}

require("notebook")
local api = require("notebook.api")
local settings = require("notebook.settings")

function _G.define_cell(extmark)
    if extmark == nil then
        local line = vim.fn.line(".")
        extmark, _ = api.current_extmark(line)
    end
    local start_line = extmark[1] + 1
    local end_line = extmark[3].end_row
    pcall(function() vim.fn.MoltenDefineCell(start_line, end_line) end)
end

function _G.define_all_cells()
    local buffer = vim.api.nvim_get_current_buf()
    local extmarks = settings.extmarks[buffer]
    for id, cell in pairs(extmarks) do
        local extmark = vim.api.nvim_buf_get_extmark_by_id(
            0, settings.plugin_namespace, id, { details = true }
        )
        if cell.cell_type == "code" then
            define_cell(extmark)
        end
    end
end


vim.api.nvim_create_autocmd(
    { "BufRead" },
    {
        pattern = { "*.ipynb" },
        callback = function()
            vim.cmd("MoltenInit")
            vim.cmd("NBAddCell")
        end
    }
)
vim.api.nvim_create_autocmd(
     "User",
    { pattern = { "MoltenInitPost", "NBPostRender" }, callback = _G.define_all_cells }
)
vim.api.nvim_set_keymap('n', '<Leader>j', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-L>', 'copilot#Accept("\\<CR>")', {
          expr = true,
          replace_keycodes = false
        })
        vim.g.copilot_no_tab_map = true

-- vim.api.nvim_set_keymap('n', '<C-L>', 'copilot#Accept("\\<CR>")', { noremap = true, silent = true })

require('toggleterm').setup{
    size = function(term)
        return term.direction == 'vertical' and vim.o.columns * 0.4 or 20
    end
}
local Terminal = require('toggleterm.terminal').Terminal

local py_term = Terminal:new({
    cmd = "python3",  -- Базовое значение, будет переопределено
    dir = "git_dir",
    direction = "vertical",
    hidden = true,
    close_on_exit = false,  -- Важно: запрещаем авто-закрытие
    on_open = function(term)
        vim.cmd("startinsert!")
    end,
})

function _G.open_python_term()
    local file_path = vim.api.nvim_buf_get_name(0)
    py_term.cmd = "python3 " .. vim.fn.shellescape(file_path) .. " && echo 'Press ENTER to exit...'"
    py_term:toggle()
end

vim.api.nvim_set_keymap('n', '<Leader>tt', '<cmd>lua open_python_term()<CR>', { noremap = true, silent = true })

