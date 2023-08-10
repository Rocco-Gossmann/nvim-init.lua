return function(wk)

    vim.cmd[[ set autoindent ]]

    wk.register({
        ['§'] = {
            b = { "<?php\r\t", "Boilerplate" },
            r = {
                name = "Require Once",
                r = { "require_once $_SERVER['DOCUMENT_ROOT'] . '/';<esc>F/a", "Docroot" },
                d = { "require_once __DIR__ . '/';<esc>F/a", "__DIR__" }
            },
            i = { name = "if",
                i = { "if() {}<esc>F)i", " single " },
                e = { "if(<esc>mza) {\r} else {\r}\r<esc>`za", " else " }
            },
            s = { name = "switch",
                s = { "switch(<esc>mza) {\r}\r<esc>`za", " switch " },
                c = { "case <esc>mza: {\r} break;\r<esc>`za", " else " }
            },
            f = { "function () {}<esc>hhhhi", "Function" }
        }
    }, { mode = "i" })
end
