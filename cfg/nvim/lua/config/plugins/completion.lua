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
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual",
					scrollbar = false,
				},
				documentation = {
					border = "rounded",
					max_width = 60,
					max_height = 15,
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
					scrollbar = false,
				},
			},

			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
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
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
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

			formatting = {
				fields = { "abbr", "kind" }, -- Changed order to put kind on the right
				format = function(entry, vim_item)
					-- Abbreviated category names for the right side
					local kind_abbr = {
						Text = "txt",
						Method = "mtd",
						Function = "fn",
						Constructor = "ctor",
						Field = "fld",
						Variable = "var",
						Class = "cls",
						Interface = "iface",
						Module = "mod",
						Property = "prop",
						Unit = "unit",
						Value = "val",
						Enum = "enum",
						Keyword = "kw",
						Snippet = "snip",
						Color = "color",
						File = "file",
						Reference = "ref",
						Folder = "dir",
						EnumMember = "emem",
						Constant = "const",
						Struct = "struct",
						Event = "event",
						Operator = "op",
						TypeParameter = "type",
					}

					-- Set abbreviated text on the right
					vim_item.kind = string.format(" %s ", kind_abbr[vim_item.kind] or vim_item.kind)

					-- Don't show source hints in the menu anymore since we have limited space
					vim_item.menu = ""

					-- Truncate completion text if needed to make room for category
					local max_width = 40
					if #vim_item.abbr > max_width then
						vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 3) .. "..."
					end

					return vim_item
				end,
			},

			experimental = {
				ghost_text = false,
				native_menu = false,
			},

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
		})

		-- Custom highlights for text-only UI with different colors
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#444444", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })

		-- Main completion text (left side)
		vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#c0caf5" })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#7aa2f7", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#7aa2f7", bold = true })

		-- Category labels on the right side with different colors
		-- Using subtle, professional colors
		vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#73daca", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#ff9e64", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#7aa2f7", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#e0af68", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#bb9af7", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#9ece6a", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#ff9e64", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#7dcfff", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#f7768e", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#bb9af7", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#73daca", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#9ece6a", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#ff9e64", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#f7768e", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#e0af68", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#7dcfff", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#7aa2f7", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#bb9af7", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#7aa2f7", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#ff9e64", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#9ece6a", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#e0af68", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#f7768e", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#73daca", bg = "#1a1b26", italic = false })
		vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#7dcfff", bg = "#1a1b26", italic = false })

		-- Fallback for any other types
		vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#bb9af7", bg = "#1a1b26", italic = false })

		-- Selection highlights
		vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2d3045" })
		vim.api.nvim_set_hl(0, "CmpItemAbbrSelected", { fg = "#ffffff", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindSelected", {
			fg = "#ffffff",
			bg = "#2d3045",
			bold = true,
			italic = false,
		})
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
