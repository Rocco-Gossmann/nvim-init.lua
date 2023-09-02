local lsp = require 'lsp-zero'

lsp.configure('intelephense', {
    settings = {
        intelephense = {
            files = {
                maxSize = 9999999
            },

            environment = {
                includePaths = {
                    "./**"
                }
            }
        }
    }
})

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

