local servers = {}
servers.lua_ls = {
	Lua = {
		formatters = {
			ignoreComments = true,
		},
		signatureHelp = { enabled = true },
		diagnostics = {
			globals = { "nixCats", "vim" },
			disable = { "missing-fields" },
		},
	},
	telemetry = { enabled = false },
	filetypes = { "lua" },
}
servers.nixd = {
	nixd = {
		nixpkgs = {
			-- nixd requires some configuration in flake based configs.
			-- luckily, the nixCats plugin is here to pass whatever we need!
			-- expr = [[import (builtins.getFlake "]] .. nixCats.extra("nixdExtras.nixpkgs") .. [[") { }   ]],
		},
		formatting = {
			command = { "nixfmt" },
		},
		diagnostic = {
			suppress = {
				"sema-escaping-with",
			},
		},
	},
}
servers.elixirls = {
	cmd = { "elixir-ls" },
}
servers.gopls = {}

servers.dartls = {}

servers.bashls = {}

servers.fish_lsp = {}

servers.yamlls = {}

servers.hyprls = {}

require("lze").load({
	{
		"nvim-lspconfig",
		event = "FileType",
		load = (require("nixCatsUtils").isNixCats and vim.cmd.packadd) or function(name)
			vim.cmd.packadd(name)
			vim.cmd.packadd("mason.nvim")
			vim.cmd.packadd("mason-lspconfig.nvim")
		end,
		after = function(plugin)
			for server_name, cfg in pairs(servers) do
				require("lspconfig")[server_name].setup({
					capabilities = require("jakob.lsp.caps-on_attach").get_capabilities(server_name),
					-- this line is interchangeable with the above LspAttach autocommand
					on_attach = require("jakob.lsp.caps-on_attach").on_attach,
					settings = cfg,
					filetypes = (cfg or {}).filetypes,
					cmd = (cfg or {}).cmd,
					root_pattern = (cfg or {}).root_pattern,
				})
			end
		end,
	},
})
