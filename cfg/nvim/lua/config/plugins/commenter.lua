return {
	"preservim/nerdcommenter",
	config = function()
		vim.cmd([[
			let g:NERDCreateDefaultMappings = 0
			let g:NERDSpaceDelims = 1
			let g:NERDCommentEmptyLines = 1
			let g:NERDTrimTrailingWhitespace = 1
			
			" MONKEY PATCH: Override the actual comment function
			function! s:ForceSingleLineComments() abort
				" This regex replaces /* */ comment delimiters with single-line ones
				" for languages that support both
				
				let ft = &filetype
				
				" Languages that should NEVER use /* */
				let no_block_languages = ['javascript', 'jsx', 'typescript', 'tsx', 'c', 'cpp', 'java', 'rust', 'go', 'lua', 'python', 'sh', 'bash', 'zsh']
				
				if index(no_block_languages, ft) >= 0
					" Force single-line comment style
					let b:NERDBlockCom = ''
					let b:NERDEBlockCom = ''
				endif
			endfunction
			
			" Run our patcher on various events
			autocmd FileType * call s:ForceSingleLineComments()
			autocmd BufEnter * call s:ForceSingleLineComments()
			
			" Simple mappings that use toggle (which respects our patches)
			nnoremap <leader>cc :call nerdcommenter#Comment("n", "Toggle")<CR>
			vnoremap <leader>cc :<C-u>call nerdcommenter#Comment("v", "Toggle")<CR>
			
			" Force single-line right now for current buffer
			call s:ForceSingleLineComments()
		]])
	end,
}

-- return {
--   "preservim/nerdcommenter",
--   config = function()
--     vim.cmd([[
--       " Disable ALL default mappings and use our own
--       let g:NERDCreateDefaultMappings = 0
--       let g:NERDSpaceDelims = 1
--       let g:NERDCompactSexyComs = 0  " CRITICAL: Disable sexy comments
--       let g:NERDDefaultAlign = 'left'
--       let g:NERDCommentEmptyLines = 1
--       let g:NERDTrimTrailingWhitespace = 1
--       let g:NERDToggleCheckAllLines = 1
--
--       " Force single-line mode
--       let g:NERDUsePlaceHolders = 0
--       let g:NERDDefaultUseAltDelims = 0
--
--       " Create CUSTOM mappings that force single-line comments
--       " Single toggle (same as leader-c-space)
--       nnoremap <leader>cc :call NERDComment(0, "Toggle")<CR>
--       vnoremap <leader>cc :<C-u>call NERDComment(1, "Toggle")<CR>
--
--       " Also map the typical leader-c-space
--       nnoremap <leader>c<space> :call NERDComment(0, "Toggle")<CR>
--       vnoremap <leader>c<space> :<C-u>call NERDComment(1, "Toggle")<CR>
--
--       " Comment normally
--       nnoremap <leader>c<leader>c :call NERDComment(0, "Comment")<CR>
--       vnoremap <leader>c<leader>c :<C-u>call NERDComment(1, "Comment")<CR>
--
--       " Uncomment
--       nnoremap <leader>cu :call NERDComment(0, "Uncomment")<CR>
--       vnoremap <leader>cu :<C-u>call NERDComment(1, "Uncomment")<CR>
--
--       " Custom function to FORCE single-line comments
--       function! NERDComment(isVisual, type)
--         " Save original settings
--         let l:orig_compact = g:NERDCompactSexyComs
--         let l:orig_placeholders = g:NERDUsePlaceHolders
--         let l:orig_altdelims = g:NERDDefaultUseAltDelims
--
--         " FORCE settings that prevent block comments
--         let g:NERDCompactSexyComs = 0
--         let g:NERDUsePlaceHolders = 0
--         let g:NERDDefaultUseAltDelims = 0
--
--         " Call the actual NERDCommenter function
--         if a:isVisual
--           call nerdcommenter#Comment(a:isVisual, a:type)
--         else
--           call nerdcommenter#Comment(a:isVisual, a:type)
--         endif
--
--         " Restore original settings (optional)
--         let g:NERDCompactSexyComs = l:orig_compact
--         let g:NERDUsePlaceHolders = l:orig_placeholders
--         let g:NERDDefaultUseAltDelims = l:orig_altdelims
--       endfunction
--     ]])
--   end,
-- }
