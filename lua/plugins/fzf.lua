return {
  "ibhagwan/fzf-lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")

    fzf.register_ui_select()

    local function prompt_choice(title, options, callback)
      local ns = vim.api.nvim_create_namespace("prompt_choice")

      vim.api.nvim_set_hl(0, "FzfFileGreen", { fg = "#2ecc71", bold = true })
      vim.api.nvim_set_hl(0, "FzfFileYellow", { fg = "#f1c40f", bold = true })
      vim.api.nvim_set_hl(0, "FzfFileRed", { fg = "#e74c3c", bold = true })
      vim.api.nvim_set_hl(0, "FzfFileBlue", { fg = "#3498db", bold = true })

      local line = ""
      local hl_ranges = {}
      local col = 0
      for i, opt in ipairs(options) do
        local prefix = (i > 1 and "  " or "")
        local segment = prefix .. "[" .. opt.key .. "] " .. opt.label
        table.insert(hl_ranges, { hl = opt.color, s = col + #prefix, e = col + #segment })
        line = line .. segment
        col = col + #segment
      end

      local width = math.max(#title + 4, #line + 4)
      local pad_t = math.floor((width - #title) / 2)
      local pad_o = math.floor((width - #line) / 2)

      local buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
        string.rep(" ", pad_t) .. title,
        string.rep(" ", pad_o) .. line,
        "",
      })
      vim.bo[buf].modifiable = false

      vim.api.nvim_buf_add_highlight(buf, ns, "FzfFileBlue", 0, pad_t, pad_t + #title)
      for _, h in ipairs(hl_ranges) do
        vim.api.nvim_buf_add_highlight(buf, ns, h.hl, 1, pad_o + h.s, pad_o + h.e)
      end

      local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = 3,
        row = math.floor((vim.o.lines - 3) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        style = "minimal",
        border = "rounded",
      })

      for _, opt in ipairs(options) do
        vim.keymap.set("n", opt.key, function()
          vim.api.nvim_win_close(win, true)
          vim.api.nvim_buf_delete(buf, { force = true })
          callback(opt.value)
        end, { buffer = buf })
      end

      vim.keymap.set("n", "<Esc>", function()
        vim.api.nvim_win_close(win, true)
        vim.api.nvim_buf_delete(buf, { force = true })
        callback(nil)
      end, { buffer = buf })
    end

    local function create_file(final_path, final_rel, is_dir)
      local parent = vim.fn.fnamemodify(final_path, ":h")
      if not vim.fn.isdirectory(parent) then
        print("Parent dir doesn't exist, will create: " .. vim.fn.fnamemodify(parent, ":."))
      end
      if is_dir then
        vim.fn.system({ "mkdir", "-p", final_path })
        print("Folder created: " .. final_rel)
      else
        vim.fn.system({ "mkdir", "-p", parent })
        vim.fn.system({ "touch", final_path })
        vim.cmd("edit " .. vim.fn.fnameescape(final_path))
        print("File created: " .. final_rel)
      end
    end

    local function ask_custom(cwd, prompt_text, parse_fn)
      vim.fn.inputsave()
      local input = vim.fn.input(prompt_text)
      vim.fn.inputrestore()
      if not input or #input == 0 then
        print("Cancelled")
        return
      end
      local cpath, crel, cis_dir = parse_fn(input)
      local tipo = cis_dir and "folder" or "file"
      prompt_choice("Create " .. tipo .. ": " .. crel .. "?", {
        { key = "y", label = "Confirm", value = "confirm", color = "FzfFileGreen" },
        { key = "n", label = "Cancel",  value = "cancel",  color = "FzfFileRed" },
      }, function(choice)
        if choice == "confirm" then
          create_file(cpath, crel, cis_dir)
        else
          print("Cancelled")
        end
      end)
    end

    local function show_confirm(cwd, query, fpath, frel, ftype)
      prompt_choice("Create " .. ftype .. ": " .. frel .. "?", {
        { key = "y", label = "Confirm",        value = "confirm",   color = "FzfFileGreen" },
        { key = "f", label = "Other filename", value = "filename",  color = "FzfFileYellow" },
        { key = "p", label = "Other filepath", value = "filepath",  color = "FzfFileYellow" },
        { key = "n", label = "Cancel",         value = "cancel",    color = "FzfFileRed" },
      }, function(choice)
        if not choice or choice == "cancel" then
          print("Cancelled")
        elseif choice == "confirm" then
          create_file(fpath, frel, string.sub(query, -1) == "/")
        elseif choice == "filename" then
          local dir = vim.fn.fnamemodify(fpath, ":h")
          ask_custom(cwd, "Filename: ", function(name)
            local np = dir .. "/" .. name
            return np, vim.fn.fnamemodify(np, ":."), string.sub(name, -1) == "/"
          end)
        elseif choice == "filepath" then
          ask_custom(cwd, "Filepath: ", function(fp)
            local np = cwd .. "/" .. fp
            return np, vim.fn.fnamemodify(np, ":."), string.sub(fp, -1) == "/"
          end)
        end
      end)
    end

    fzf.setup({
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.35,
        col = 0.50,
        border = "rounded",
      },
      files = {
        cmd = "fd --type f --hidden --follow --exclude .git --strip-cwd-prefix",
        prompt = "> ",
        header = false,
        actions = {
          ["ctrl-f"] = function(selected, opts)
            local query = opts.query
            if not query or #query == 0 then
              print("No query to create file")
              return
            end

            local cwd = opts.cwd or vim.fn.getcwd()
            local path = cwd .. "/" .. query
            local rel = vim.fn.fnamemodify(path, ":.")
            local exists = vim.fn.filereadable(path) == 1 or vim.fn.isdirectory(path) == 1

            local ftype
            if exists then
              ftype = vim.fn.isdirectory(path) == 1 and "Folder" or "File"
            else
              ftype = string.sub(query, -1) == "/" and "Folder" or "File"
            end
            show_confirm(cwd, query, path, rel, ftype)
          end,
        },
      },
      keymap = {
        builtin = {
          ["<A-j>"] = "preview-page-down",
          ["<A-k>"] = "preview-page-up",
        }
      },
    })

    vim.keymap.set("n", "<leader><leader>", fzf.files, { desc = "Buscar archivos (atajo alterno)" })
    vim.keymap.set("n", "<leader>.", fzf.live_grep, { desc = "Buscar en contenido (atajo alterno)" })
    vim.keymap.set("n", "<leader>l", fzf.buffers, { desc = "Buscar buffers (atajo alterno)" })
    vim.keymap.set("n", "<leader>,", function()
      fzf.files({ cwd = vim.fn.expand("%:p:h") })
    end, { desc = "Buscar archivos desde buffer actual" })
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Buscar ayuda" })
    vim.keymap.set("n", "<leader>o", function()
      fzf.oldfiles({ cwd_only = true })
    end, { desc = "Recent files" })
  end,
}
