-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    opts = {
      colors = {
        cursorline = "#d4d4d8", -- This is optional. The default cursorline color is based on the background
      },
      highlights = {
        MiniCursorword = { bg = "#d4d4f8", underline = true }, -- 加上下划线
      },
      options = {
        cursorline = true, -- Use cursorline highlighting?
        transparency = false, -- Use a transparent background?
        terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
        lualine_transparency = true, -- Center bar transparency?
        highlight_inactive_windows = true, -- When the window is out of focus, change the normal background?
      },
      styles = {
        types = "italic", -- 类型名使用斜体
        methods = "NONE", -- 方法名无特殊样式
        numbers = "NONE", -- 数字无特殊样式
        strings = "NONE", -- 字符串使用斜体
        comments = "italic", -- 注释使用斜体
        keywords = "bold", -- 关键字使用粗体
        constants = "NONE", -- 常量无特殊样式
        functions = "bold", -- 函数名使用粗体
        operators = "NONE", -- 操作符无特殊样式
        variables = "NONE", -- 变量无特殊样式
        parameters = "italic", -- 函数参数使用斜体
        conditionals = "bold", -- 条件语句 (if, else) 使用粗体
        virtual_text = "italic", -- LSP 的虚拟文本 (行内提示) 使用斜体
      },
    },
  },

  { "max397574/better-escape.nvim", enabled = true },

  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.cursorword").setup {
        delay = 100,
      }
    end,
  },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
      require("luasnip.loaders.from_vscode").lazy_load {
        -- this can be used if your configuration lives in ~/.config/nvim
        -- if your configuration lives in ~/.config/astronvim, the full path
        -- must be specified in the next line
        paths = { "~/.config/nvim/snippets" },
      }
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            ".git",
            ".DS_Store",
            "thumbs.db",
          },
          never_show = {},
        },
      },
      window = {
        position = "right",
      },
    },
  },
}
