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
