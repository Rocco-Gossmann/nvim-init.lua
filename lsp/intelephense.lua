return {

	ft = { "php" },

	root_markers = { ".git", "." },

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

}
