return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup{
      size = 20,
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      direction = "float",
      float_opts = {
        border = "curved",
        width = function() return math.floor(vim.o.columns * 0.8) end,
        height = function() return math.floor(vim.o.lines * 0.8) end,
        winblend = 0,
      },
    }

    local Terminal = require('toggleterm.terminal').Terminal
    local terminals = {}  -- Aquí vamos a guardar nuestras terminales
    local current_index = -1

    local function handle_incremental(new_current_index)
      if new_current_index > #terminals then
        return 1
      elseif new_current_index < 1 then
        return #terminals
      else
        return new_current_index
      end
    end

    local function next_terminal(incremental)
      if #terminals == 0 then
        return
      end
      local previus_index = current_index
      current_index = handle_incremental(current_index + incremental)
      if previus_index ~= current_index and previus_index ~= -1 then
        terminals[previus_index]:close()
      end
      terminals[current_index]:open()
    end

    local function new_terminal()
      local term = Terminal:new({ direction = "float" })
      table.insert(terminals, term)
      current_index = #terminals
      next_terminal(0)
    end


    local function toggle_last_terminal()
      if #terminals > 0 then
        terminals[#terminals]:toggle()
      else
        new_terminal()
      end
    end

    -- Keymaps
    local opts = { noremap = true, silent = true }

    -- Toggle la última terminal
    vim.keymap.set("n", "<leader>tt", toggle_last_terminal, opts)

    -- Crear nueva terminal
    vim.keymap.set("n", "<leader>tn", new_terminal, opts)

    -- Moverse entre terminales (izquierda y derecha)
    vim.keymap.set("n", "<leader>th", function() next_terminal(-1) end, opts)
    vim.keymap.set("n", "<leader>tl", function() next_terminal(1) end, opts)

    for i = 1,9 do
      vim.keymap.set("n", "<leader>t" .. i, function()
        if i > #terminals then
          for _ = #terminals + 1, i do
            new_terminal()
            toggle_last_terminal()
          end
        end
        local difference = i - current_index
        if difference == 0 then
          toggle_last_terminal()
        elseif difference > 0 then
          next_terminal(difference)
        else
          next_terminal(difference)
        end
      end, opts)
    end
  end
}
