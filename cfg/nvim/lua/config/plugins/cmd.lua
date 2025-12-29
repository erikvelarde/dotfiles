return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    -- First configure nvim-notify for better notifications
    require("notify").setup({
      -- Animation style (default is "fade_in_slide_out")
      -- Options: "fade", "slide", "fade_in_slide_out", "slide_in_fade_out", "static"
      stages = "fade_in_slide_out",
      
      -- Position: bottom-right is usually least annoying
      -- Options: "top", "top_right", "top_left", "bottom", "bottom_right", "bottom_left"
      top_down = false,
      position = "bottom",
      
      -- Timeouts
      timeout = 3000, -- Default timeout for notifications (ms)
      background_colour = "#000000", -- Background color
      
      -- Render function for custom styling
      render = "default",
      
      -- Custom icons
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },
      
      -- FPS for animation
      fps = 30,
      
      -- Don't show if buffer is focused
      on_open = nil,
      on_close = nil,
    })

    -- Then configure noice.nvim
    require("noice").setup({
      cmdline = {
        enabled = true, -- enables the Noice cmdline UI
        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get rid of the popup
        opts = {}, -- global options for the cmdline. See section on views
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = {
          enabled = false, -- Disable LSP progress messages (they're often annoying)
        },
        signature = {
          enabled = false, -- Disable signature help if you find it intrusive
        },
        hover = {
          enabled = true,
          silent = true, -- Don't show "No information available" messages
          view = nil, -- when nil, use defaults from documentation
          opts = {}, -- merged with defaults from documentation
        },
      },
      presets = {
        -- you can enable a preset for easier configuration
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- disable if you find it annoying
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      views = {
        -- Configure notification views to be less intrusive
        notify = {
          -- Position notifications at the bottom
          position = {
            row = "95%", -- Near the bottom (percentage from top)
            col = "50%", -- Centered horizontally
          },
          -- Size
          size = {
            width = "auto",
            height = "auto",
          },
          -- Border style
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          -- Enable 'q' to close
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
        -- Popupmenu configuration
        popupmenu = {
          relative = "editor",
          position = {
            row = "90%", -- Near the bottom
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
        -- Split configuration
        split = {
          enter = false, -- Don't enter the split automatically
          size = "25%", -- Smaller split
          position = "bottom", -- Put splits at the bottom
        },
      },
      routes = {
        -- Route certain messages to different views or suppress them
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true }, -- Skip "written" messages
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "lines",
          },
          opts = { skip = true }, -- Skip "lines yanked" messages
        },
        {
          filter = { event = "msg_show", min_height = 20 },
          view = "split",
        },
        {
          -- Route all notifications to the notify view
          view = "notify",
          filter = { event = "notify" },
          opts = { stop = false },
        },
      },
      -- Key mappings for better control
      keys = {
        {
          "<S-Enter>",
          function()
            require("noice").redirect(vim.fn.getcmdline())
          end,
          mode = "c",
          desc = "Redirect Cmdline",
        },
        {
          "<leader>nl",
          function()
            require("noice").cmd("last")
          end,
          desc = "Noice Last Message",
        },
        {
          "<leader>nh",
          function()
            require("noice").cmd("history")
          end,
          desc = "Noice History",
        },
        {
          "<leader>na",
          function()
            require("noice").cmd("all")
          end,
          desc = "Noice All",
        },
        {
          "<leader>nd",
          function()
            require("noice").cmd("dismiss")
          end,
          desc = "Dismiss All",
        },
        {
          "q",
          function()
            require("noice").cmd("dismiss")
          end,
          desc = "Dismiss notification",
          mode = { "n", "i" },
        },
      },
      -- Formatting options
      format = {
        -- Hide certain patterns
        conceal = true,
        -- Replace icons with text for better readability
        level = {
          icons = false,
        },
      },
    })

    -- Additional keymaps for dismissing notifications
    vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<CR>", { desc = "Dismiss all notifications" })
    vim.keymap.set("n", "q", function()
      if require("noice").message.active() then
        require("noice").cmd("dismiss")
      else
        vim.cmd("normal! q")
      end
    end, { desc = "Close notification or window" })

    -- Auto-dismiss notifications after 3 seconds
    -- local timer = vim.loop.new_timer()
    -- timer:start(0, 3000, vim.schedule_wrap(function()
    --   pcall(function()
    --     require("noice").cmd("dismiss", { event = "notify" })
    --   end)
    -- end))
  end,
}
