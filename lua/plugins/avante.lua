return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    -- add any opts here
    provider = "gemini", -- You can then change this provider here
    auto_suggestions_provider = "gemini-suggestion",
    behaviour = {
      auto_suggestions = true, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    suggestion = {
      debounce = 300,
      throttle = 300,
    },
    providers = {
      gemini = {
        model = "gemini-2.5-pro",
      },
      ["gemini-suggestion"] = {
        __inherited_from = "gemini",
        model = "gemini-2.5-flash", -- The model name to use with this provider
        api_key_name = "GEMINI_SUGGEST_API_KEY", -- The name of the environment variable that contains the API key
      },
      ["deep-seek"] = {
        __inherited_from = "openai",
        endpoint = "https://api.deepseek.com/v1", -- The full endpoint of the provider
        model = "deepseek-chat", -- The model name to use with this provider
        max_tokens = 8192,
        api_key_name = "DEEPSEEK_API_KEY", -- The name of the environment variable that contains the API key
      },
      ["grok-free"] = {
        __inherited_from = "openai",
        endpoint = "https://api.x.ai/v1", -- The full endpoint of the provider
        model = "grok-beta", -- The model name to use with this provider
        api_key_name = "GROK_KEY", -- The name of the environment variable that contains the API key
      },
      ["Laisky-sonnet"] = {
        __inherited_from = "openai",
        endpoint = "https://oneapi.laisky.com/v1", -- The full endpoint of the provider
        model = "claude-3.5-sonnet", -- The model name to use with this provider
        api_key_name = "L_KEY", -- The name of the environment variable that contains the API key
      },
      ["Laisky-suggestion"] = {
        __inherited_from = "openai",
        endpoint = "https://oneapi.laisky.com/v1", -- The full endpoint of the provider
        model = "gpt-4o-mini", -- The model name to use with this provider
        api_key_name = "L_KEY", -- The name of the environment variable that contains the API key
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
