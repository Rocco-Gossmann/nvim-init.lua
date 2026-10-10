local M = {}


--==============================================================================
-- BM: Mason
--==============================================================================
-- BM: Mason-AutoInstall-Tools
--------------------------------------------------------------------------------
M.MasonAutoInstallTools = {
	"intelephense",     -- NOTE: appearently Intelephense does not ocunt as LSP,
	                    --       but as Tool
						--       or maybe it uses a tool. IDK.
	"php-debug-adapter",
	"jq"
}

-- BM: Mason-AutoInstall-Tools
--------------------------------------------------------------------------------
M.MasonAutoInstallLSPs = {
	"markdown_oxide",
	"lua_ls"
}

--==============================================================================
-- BM: Lsp Configuration
--==============================================================================
function M.Config()
	--=================================================================
	-- BM: Lsp Configuration - Lua
	--=================================================================
	vim.lsp.config("lua_ls", {
		-- cmd = { ... },
		-- filetypes = { ... },
		-- capabilities = {},
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},

				workspace = {
					vim.fn.getcwd() .. "/lua",
					vim.fn.getcwd(),
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
				-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
				-- diagnostics = { disable = { 'missing-fields' } },
			},
		},

	})

	--=================================================================
	-- BM: Lsp Configuration - Roslyn C#
	--=================================================================

		cmd_env = {
			DOTNET_CLI_UI_LANGUAGE = "en",
			LANG = "en_US.UTF-8",
			LC_ALL = "en_US.UTF-8"
		}
	})

	--=================================================================
	-- BM: Lsp Configuration - TypeScript/JavaScript
	--=================================================================
	vim.lsp.config("ts_ls", {
		settings = {
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = 'all',
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayVariableTypeHintsWhenTypeMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
			javascript = {
				inlayHints = {
					includeInlayParameterNameHints = 'all',
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayVariableTypeHintsWhenTypeMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			}
		},
	})

	--=================================================================
	-- BM: Lsp Configuration - PHP
	--=================================================================
	vim.lsp.config("intelephense", {

		init_options = {
			licenceKey = "/opt/licenses/intelephense.txt",
		},

		settings = {
			intelephense = {

				environment = {
					includePaths = {
						"/var/lib/phpunit",
					},
				},

				diagnostics = {
					enable = true,
					argumentCount = true,
					deprecated = true,
					duplicateSymbols = true,
					embeddedLanguages = true,
					implementationErrors = true,
					languageConstraints = true,
					memberAccess = false,
					noMixedTypeCheck = true,
					relaxedTypeCheck = true,
					run = "onType",
					typeErrors = true,
					undefinedClassConstants = true,
					undefinedConstants = true,
					undefinedFunctions = true,
					undefinedMethods = true,
					undefinedProperties = true,
					undefinedSymbols = true,
					undefinedTypes = true,
					undefinedVariables = true,
					unexpectedTokens = true,
					unusedSymbols = true,
				},

				inlayHint = {
					returnTypes = true
				}

			},
		},

	})
end

--==============================================================================
-- BM: Return
--==============================================================================
return M;
