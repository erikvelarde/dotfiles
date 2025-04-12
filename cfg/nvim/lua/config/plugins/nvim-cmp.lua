return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"onsails/lspkind.nvim",
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		local lspkind = require("lspkind")

		-- load vs-code like snippets from plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load({ priority = 10 })
		require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

		vim.opt.completeopt = "menu,menuone,noselect"
		cmp.setup({

			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			},

			duplicates_default = 0,
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				-- ["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-o>"] = cmp.mapping.confirm({ select = false }),

				["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
				-- ["<Tab>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
			}),

			-- sources for autocompletion
			sources = cmp.config.sources({
				{
					name = "nvim_lsp",
					-- this fucking piece of code is the better code I've ever seen in my whole fucking life
					-- I've searching for disabling the fucking nonsence "snippets" since like 1 or 2 years ago
					-- I've read thousend of posts on reddit and github issues.
					-- and finally I have found the answer here: https://neovim.discourse.group/t/how-to-disable-lsp-snippets/922/4
					-- finally I don't see that fucking "snippets" in my completions. :D if someone is reading this for some reason
					-- sorry for the my poor English and for all the bad words, but disabling that fucking "snippets" is the best that
					-- could happend to me today: 23 february 2025, now I love neovim 100%

					entry_filter = function(entry)
						return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
					end,
					-- end of the best piece of code ever.
				}, -- lsp
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),

			-- configure lspkind for vs-code like icons
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 55,
					ellipsis_char = "...",
					menu = {},
				}),
			},
		})
	end,
}
