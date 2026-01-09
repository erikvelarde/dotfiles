return {
	"preservim/nerdcommenter",
	config = function()
		vim.cmd([[
			let g:NERDCreateDefaultMappings = 1
			let g:NERDSpaceDelims = 1
			let g:NERDCompactSexyComs = 1
			let g:NERDDefaultAlign = 'left'
			let g:NERDCommentEmptyLines = 1
			let g:NERDTrimTrailingWhitespace = 1
			let g:NERDToggleCheckAllLines = 1
			
			" COMPLETELY DISABLE BLOCK/MULTI-LINE COMMENT STYLE
			" This ensures only single-line comment syntax is used
			let g:NERDUsePlaceHolders = 0
			let g:NERDRemoveExtraSpaces = 1
			let g:NERDRemoveCompletely = 0
			
			" Disable alt delimiters for ALL filetypes
			let g:NERDDefaultUseAltDelims = 0
			
			" Force all languages to use only single-line style
			" Even when commenting multiple lines, it will use single-line comments
			function! NERDCommenter_before()
				" Force single-line style for all operations
				let g:NERDBlockCom = ''
				let g:NERDEBlockCom = ''
			endfunction
			
			" Override the comment style mapping
			" This makes <leader>c space and <leader>c m behave the same
			nmap <leader>c <Plug>NERDCommenterToggle
			vmap <leader>c <Plug>NERDCommenterToggle
			
			" For visual mode commenting, always use single-line style
			xmap <leader>c<leader>c <Plug>NERDCommenterComment
			
			" Alternatively, disable the sexy comment style completely
			let g:NERDAllowAnyVisualDelims = 0
		]])

		-- Set global variables in Lua for consistency
		vim.g.NERDUsePlaceHolders = 0
		vim.g.NERDRemoveExtraSpaces = 1
		vim.g.NERDDefaultUseAltDelims = 0
		vim.g.NERDAllowAnyVisualDelims = 0

		-- Override the NERDCommenter function to prevent block comments
		vim.cmd([[
			function! NERDComment(isVisual, type)
				" Force single-line commenting for all operations
				let l:orig = g:NERDUsePlaceHolders
				let g:NERDUsePlaceHolders = 0
				
				" Call original function with forced settings
				let result = NERDCommenter#Comment(a:isVisual, a:type)
				
				" Restore original setting
				let g:NERDUsePlaceHolders = l:orig
				return result
			endfunction
		]])
	end,
}
