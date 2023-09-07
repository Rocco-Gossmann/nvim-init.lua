local Hydra = require("hydra")

local hint = [[
 Quicklist:
===================================================
   _u_ => Find word under cursor
   _f_ => Find Expression
   _n_ => next entry     _p_ => prev Entry
   _o_ => open list      _i_ => close list

   _a_ => Append to List
]];

local appendHead = Hydra({
    hint = [[ Quicklist => Append
======================================
   _u_ => Find word under cursor
   _f_ => Find Expression
]],
    heads = {
        {'u', ':grepadd \"<C-r><C-w>\" ./*<cr><cr>:copen<cr>'},
        {'f', ':grepadd \"\" ./*<left><left><left><left><left>'},
    },
	config = {
		hint = { position="bottom", border="rounded" },
	},
})

local heads = {
    {'u', ':grep \"<C-r><C-w>\" ./*<cr><cr><C-o>:copen<cr>'},
    {'f', ':grep \"\" ./*<left><left><left><left><left>'},
    {'n', ':cnext<cr>'},
    {'p', ':cprev<cr>'},
    {'o', ':copen<cr>'},
    {'i', ':cclose<cr>'},
    {'a', function() appendHead:activate() end},

    { "<esc>", nil, {exit=true} }, { "q", nil, {exit=true} }

}

return Hydra({
	mode = { 'n' },
	body = "<S-b>",
    hint = hint,
    heads = heads,
	config = {
        color = "teal",
		invoke_on_body = true,
		hint = { position="bottom", border="rounded" },
	}
})


--        ['b'] = {
--            name="Quickfix-List",
--            ['u'] = { ":grep \"<C-r><C-w>\" ./*<cr><cr><C-o>:copen<cr>", "word to Quickfix-List" },
--            ['f'] = { ":grep \"\" ./*<left><left><left><left><left>", "live grep to Quickfix-List" },
--            ['n'] = { ":cnext<cr>", "Next Quickfix" },
--            ['p'] = { ":cprev<cr>", "Previous Quickfix" },
--            ['o'] = { ":copen<cr>", "Quickfix-List open" },
--            ['i'] = { ":cclose<cr>", "Quickfix-List close" },
--            ['a'] = {
--                name = "Add",
--                ['u'] = { ":grepadd \"<C-r><C-w>\" ./*<cr><cr>:copen<cr>", "word to Quickfix-List" },
--                ['f'] = { ":grepadd \"\" ./*<left><left><left><left><left>", "live grep" },
--            }
--        },

