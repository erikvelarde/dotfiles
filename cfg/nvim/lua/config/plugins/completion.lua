return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load({ priority = 10 })

		vim.opt.completeopt = "menu,menuone,noselect"

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			window = {
				completion = {
					border = "single",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual",
					scrollbar = false,
				},
				documentation = {
					border = "single",
					max_width = 60,
					max_height = 15,
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
					scrollbar = false,
				},
			},

			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			sources = cmp.config.sources({
				{
					name = "nvim_lsp",
					entry_filter = function(entry)
						return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
					end,
				},
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),

			-- NEW: Name on left, category on right
			formatting = {
				fields = { "abbr", "kind" }, -- Changed order: abbr first, then kind
				format = function(entry, vim_item)
					-- Clean category names for the right side
					local category_names = {
						Text = "text",
						Method = "function",
						Function = "function",
						Constructor = "new",
						Field = "field",
						Variable = "variable",
						Class = "class",
						Interface = "interface",
						Module = "module",
						Property = "property",
						Unit = "unit",
						Value = "value",
						Enum = "enum",
						Keyword = "keyword",
						Snippet = "snippet",
						Color = "color",
						File = "file",
						Reference = "reference",
						Folder = "folder",
						EnumMember = "enum",
						Constant = "constant",
						Struct = "struct",
						Event = "event",
						Operator = "operator",
						TypeParameter = "type",
					}

					-- Put category on the right side
					vim_item.kind = string.format(" %s", category_names[vim_item.kind] or vim_item.kind)

					-- Source indicator (optional, very subtle)
					if false then -- Set to true if you want source hint
						local source_hint = {
							nvim_lsp = "LSP",
							luasnip = "snip",
							buffer = "buf",
							path = "path",
						}
						vim_item.menu = string.format("[%s]", source_hint[entry.source.name] or "")
					end

					return vim_item
				end,
			},

			-- Clean layout settings
			experimental = {
				ghost_text = false,
				native_menu = false,
			},

			-- Better sorting to prioritize names
			sorting = {
				priority_weight = 2.0,
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.recently_used,
					cmp.config.compare.score,
					cmp.config.compare.locality,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},

			-- Better item layout
			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},

			window = {
				completion = {
					border = "single",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual",
					scrollbar = false,
					-- Limit width to prevent overflow
					max_width = 50,
				},
				documentation = {
					border = "single",
					-- Position docs to the right
					side = "right",
					max_width = 60,
					max_height = 15,
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
				},
			},

			-- Enable scrolling in docs
			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
				docs = {
					auto_open = true, -- Auto-open docs for selected item
				},
			},
		})

		-- Custom highlights for the new layout
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#444444", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })

		-- Name on left (normal text)
		vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#c0caf5" })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#7aa2f7", bold = true })

		-- Category on right (subtle, muted)
		vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#565f89", italic = true })

		-- Selection
		vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2d3045" })
	end,
}

-- return {
--   "hrsh7th/nvim-cmp",
--   event = "InsertEnter",
--   dependencies = {
--     "hrsh7th/cmp-buffer", -- source for text in buffer
--     "hrsh7th/cmp-path", -- source for file system paths
--     "onsails/lspkind.nvim",
--     "L3MON4D3/LuaSnip", -- snippet engine
--     "saadparwaiz1/cmp_luasnip", -- for autocompletion
--     -- "rafamadriz/friendly-snippets", -- useful snippets
--   },
--   config = function()
--     local cmp = require("cmp")
--
--     local luasnip = require("luasnip")
--
--     local lspkind = require("lspkind")
--
--     -- load vs-code like snippets from plugins (e.g. friendly-snippets)
--     require("luasnip.loaders.from_vscode").lazy_load({ priority = 10 })
--     require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
--
--     vim.opt.completeopt = "menu,menuone,noselect"
--     cmp.setup({
--
--       confirm_opts = {
--         behavior = cmp.ConfirmBehavior.Replace,
--         select = true,
--       },
--
--       duplicates_default = 0,
--       snippet = {
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end,
--       },
--       window = {
--         completion = cmp.config.window.bordered(),
--         documentation = cmp.config.window.bordered(),
--       },
--
--       mapping = cmp.mapping.preset.insert({
--         ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
--         ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
--         ["<C-e>"] = cmp.mapping.abort(), -- close completion window
--         -- ["<CR>"] = cmp.mapping.confirm({ select = false }),
--         ["<C-o>"] = cmp.mapping.confirm({ select = false }),
--
--         ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
--         -- ["<Tab>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
--       }),
--
--       -- sources for autocompletion
--       sources = cmp.config.sources({
--         {
--           name = "nvim_lsp",
--           -- this fucking piece of code is the better code I've ever seen in my whole fucking life
--           -- I've searching for disabling the fucking nonsence "snippets" since like 1 or 2 years ago
--           -- I've read thousend of posts on reddit and github issues.
--           -- and finally I have found the answer here: https://neovim.discourse.group/t/how-to-disable-lsp-snippets/922/4
--           -- finally I don't see that fucking "snippets" in my completions. :D if someone is reading this for some reason
--           -- sorry for the my poor English and for all the bad words, but disabling that fucking "snippets" is the best that
--           -- could happend to me today: 23 february 2025, now I love neovim 100%
--
--           entry_filter = function(entry)
--             return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
--           end,
--           -- end of the best piece of code ever.
--         }, -- lsp
--         { name = "luasnip" }, -- snippets
--         { name = "buffer" }, -- text within current buffer
--         { name = "path" }, -- file system paths
--       }),
--
--       -- configure lspkind for vs-code like icons
--       formatting = {
--         format = lspkind.cmp_format({
--           maxwidth = 55,
--           ellipsis_char = "...",
--           menu = {},
--         }),
--       },
--     })
--   end,
-- }
