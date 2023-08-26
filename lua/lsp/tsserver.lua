local lsp = require 'lsp-zero'

lsp.configure('tsserver', {
    settings = {
        javascript = {
            validate = {
                enable = false
            }
        },
        js = {
           implicitProjectConfig = {
               checkJs = false
           }
       },
       ts = {
           implicitProjectConfig = {
               checkJs = false
           }
       }
    }
})

