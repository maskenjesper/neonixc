-- Client configs for the language servers I use.
local servers = {
	lua_ls = {
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
	},
	nixd = {
		nixd = {
			nixpkgs = {
				-- nixd requires some configuration in flake based configs.
				-- luckily, the nixCats plugin is here to pass whatever we need!
				-- expr = [[import (builtins.getFlake "]] .. nixCats.extra("nixdExtras.nixpkgs") .. [[") { }   ]],
			},
			formatting = {
				command = { "alejandra" },
			},
			diagnostic = {
				suppress = {
					"sema-escaping-with",
				},
			},
		},
	},
	elixirls = {
		cmd = { "elixir-ls" },
		filetypes = { "elixir" },
	},
	gopls = {},

	dartls = {},

	bashls = {},

	fish_lsp = {},

	yamlls = {},

	hyprls = {},

	csharp_ls = {},

	qmlls = {},

	openscad_lsp = {},
}

-- Set the default root marker for all LSP clients.
vim.lsp.config("*", {
	root_markers = { ".git" },
})

-- Use the 'servers' table to set the configuration for all LSP clients.
for server_name, cfg in pairs(servers) do
	vim.lsp.config(server_name, {

		capabilities = require("jakob.lsp.caps-on_attach").get_capabilities(server_name),
		-- this line is interchangeable with the above LspAttach autocommand
		on_attach = require("jakob.lsp.caps-on_attach").on_attach,
		settings = cfg,
		filetypes = (cfg or {}).filetypes,
		cmd = (cfg or {}).cmd,
		root_pattern = (cfg or {}).root_pattern,
	})
	vim.lsp.enable(server_name)
end

-- require("lze").load({
--     {
--         "nvim-lspconfig",
--         event = "FileType",
--         load = (require("nixCatsUtils").isNixCats and vim.cmd.packadd) or function(name)
--             vim.cmd.packadd(name)
--             vim.cmd.packadd("mason.nvim")
--             vim.cmd.packadd("mason-lspconfig.nvim")
--         end,
--         after = function(plugin)
-- for server_name, cfg in pairs(servers) do
--     require("lspconfg")[server_name].setup({
--     vim.lsp.config(server_name).setup({
--     vim.lsp.config(server_name, {
--
--         capabilities = require("jakob.lsp.caps-on_attach").get_capabilities(server_name),
--         -- this line is interchangeable with the above LspAttach autocommand
--         on_attach = require("jakob.lsp.caps-on_attach").on_attach,
--         settings = cfg,
--         filetypes = (cfg or {}).filetypes,
--         cmd = (cfg or {}).cmd,
--         root_pattern = (cfg or {}).root_pattern,
--     })
-- end
--         end,
--     },
-- })
