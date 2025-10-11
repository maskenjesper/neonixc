
return {
	"autoclose.nvim",
	after = function()
		local autoclose = require("autoclose")

		autoclose.setup()
	end,
}
