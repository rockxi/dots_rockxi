return {
    {
      "akinsho/toggleterm.nvim",
      config = function(_, opts)
        require("toggleterm").setup({
          -- Существующие настройки
          direction = "float",
          shade_terminals = true,
          shading_factor = 3,
          -- ... другие параметры

          -- Добавляем кастомные команды
          execs = {
            -- Существующая команда для вертикального терминала
            {
              cmd = "tv",
              key = [[<leader>tv]],
              direction = "vertical",
            },
            {
              cmd = "tt",
              key = [[<leader>tt]],
              action = function()
                local file_path = vim.fn.expand("%:p") -- Полный путь к текущему файлу
                local python_cmd = "python3 " .. vim.fn.shellescape(file_path) -- Экранирование спецсимволов

                -- Создаем терминал с кастомной командой
                local Terminal = require("toggleterm.terminal").Terminal
                local py_term = Terminal:new({
                  cmd = python_cmd,
                  dir = vim.fn.expand("%:p:h"), -- Директория текущего файла
                  direction = "vertical", -- Режим как у <leader>tv
                  on_close = function()
                    -- Дополнительные действия при закрытии
                  end,
                })

                py_term:toggle() -- Переключаем видимость терминала
              end,
            },
          },
        })
      end,
    }
  }
