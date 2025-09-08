return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  config = function()
    local function in_git_repo()
      local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
      if handle == nil then
        return false
      end
      local result = handle:read("*a")
      handle:close()
      return result:match("true") ~= nil
    end

    if in_git_repo() then
      require("gitsigns").toggle_current_line_blame(true)
    end
  end
}
