-- [[==========================================================================
-- Makes a Screenshot of selected code and copies it to the Clipboard
-- ==========================================================================]]
return {
	'segeljakt/vim-silicon',
	lazy = true,
	cmd = { "Silicon" },
	init = function()
		vim.cmd [[
			let g:silicon = {
				  \   'theme':              'Dracula',
				  \   'font':               'Lucida Console',
				  \   'background':         '#AAAAFF',
				  \   'shadow-color':       '#555555',
				  \   'line-pad':                   2,
					  \   'pad-horiz':              4,
					  \   'pad-vert':               4,
				  \   'shadow-blur-radius':         0,
				  \   'shadow-offset-x':            0,
				  \   'shadow-offset-y':            0,
				  \   'line-number':           v:false,
				  \   'round-corner':          v:true,
				  \   'window-controls':       v:false,
				  \ }
			]]
	end
}
