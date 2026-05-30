-- Enable OSC 52 clipboard sync via Ghostty terminal
-- This sends yanked text to the local macOS clipboard over SSH
if vim.fn.executable "pbcopy" == 0 then
  local function osc52_copy(data)
    local encoded = vim.base64.encode(table.concat(data, "\n"))
    io.write(string.format("\027]52;c;%s\027\\", encoded))
    io.flush()
  end

  vim.g.clipboard = {
    name = "osc52",
    copy = {
      ["+"] = osc52_copy,
      ["*"] = osc52_copy,
    },
    paste = {
      ["+"] = function() return {}, vim.fn.getreg "+" end,
      ["*"] = function() return {}, vim.fn.getreg "*" end,
    },
  }
end
