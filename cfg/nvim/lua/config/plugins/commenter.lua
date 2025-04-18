return {
	"preservim/nerdcommenter",
	config = function()
		vim.cmd([[
      let g:NERDCreateDefaultMappings = 1

      let g:NERDSpaceDelims = 1

      let g:NERDCompactSexyComs = 1
      let g:NERDDefaultAlign = 'left'

      let g:NERDAltDelims_java = 1

      let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
      let g:NERDCommentEmptyLines = 1

      let g:NERDTrimTrailingWhitespace = 1

      let g:NERDToggleCheckAllLines = 1
    ]])
	end,
}

