-- Rex's built-in Velvet Dusk palette, from SuperDesignTokens.bundle/themes.json.
-- Keep Catppuccin's syntax/plugin integrations, but use Rex's colors throughout.
local rex = {
	canvas = "#171122",
	background = "#1b1525",
	sidebar = "#1e1828",
	raised = "#272232",
	border = "#383145",
	border_strong = "#4c455a",
	text = "#d6cbe6",
	text_secondary = "#90869f",
	text_muted = "#726a81",
	accent = "#c9a1f0",
	accent_container = "#2f253e",
	selection = "#372a52",
	selection_text = "#ede6f7",
	error_bg = "#321f33",
	success_bg = "#272932",
	warning_bg = "#312730",
	info_bg = "#26233c",
	ansi = {
		"#241a35", "#e07396", "#83bb8d", "#dcae76",
		"#7f95dc", "#b98ae0", "#7fb8c4", "#b5aacb",
		"#635677", "#ef92ae", "#9ed3a7", "#edc793",
		"#9cafe9", "#cfa8f0", "#9cd0da", "#ede6f7",
	},
}

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				color_overrides = {
					mocha = {
						base = rex.background,
						mantle = rex.sidebar,
						crust = rex.canvas,
						surface0 = rex.raised,
						surface1 = rex.border,
						surface2 = rex.border_strong,
						overlay0 = rex.text_muted,
						overlay1 = rex.text_secondary,
						overlay2 = rex.ansi[8],
						subtext0 = rex.text_secondary,
						subtext1 = rex.ansi[8],
						text = rex.text,
						rosewater = rex.accent,
						flamingo = rex.ansi[10],
						pink = rex.ansi[14],
						mauve = rex.ansi[6],
						red = rex.ansi[2],
						maroon = rex.ansi[10],
						peach = rex.ansi[4],
						yellow = rex.ansi[12],
						green = rex.ansi[3],
						teal = rex.ansi[7],
						sky = rex.ansi[15],
						sapphire = rex.ansi[13],
						blue = rex.ansi[5],
						lavender = rex.accent,
					},
				},
				custom_highlights = function(colors)
					return {
						ColorColumn = { bg = rex.sidebar },
						CursorLine = { bg = rex.sidebar },
						CursorLineNr = { fg = rex.accent, bold = true },
						LineNr = { fg = rex.text_muted },
						WinSeparator = { fg = rex.border },
						NormalFloat = { fg = rex.text, bg = rex.raised },
						FloatBorder = { fg = rex.border_strong, bg = rex.raised },
						FloatTitle = { fg = rex.accent, bg = rex.raised },
						Pmenu = { fg = rex.text, bg = rex.raised },
						PmenuSel = { fg = rex.selection_text, bg = rex.selection, bold = true },
						Visual = { fg = rex.selection_text, bg = rex.selection },
						VisualNOS = { fg = rex.selection_text, bg = rex.selection },
						Search = { fg = rex.accent, bg = rex.accent_container },
						IncSearch = { fg = rex.canvas, bg = rex.accent },
						CurSearch = { fg = rex.canvas, bg = rex.accent },
						MatchParen = { fg = rex.accent, bg = rex.accent_container, bold = true },
						DiffAdd = { bg = rex.success_bg },
						DiffChange = { bg = rex.info_bg },
						DiffDelete = { bg = rex.error_bg },
						DiffText = { bg = rex.accent_container },
						DiagnosticWarn = { fg = rex.ansi[4] },
						DiagnosticVirtualTextError = { fg = colors.red, bg = rex.error_bg },
						DiagnosticVirtualTextWarn = { fg = rex.ansi[4], bg = rex.warning_bg },
						DiagnosticVirtualTextInfo = { fg = colors.blue, bg = rex.info_bg },
						DiagnosticVirtualTextHint = { fg = colors.teal, bg = rex.info_bg },
						MiniStatuslineModeNormal = { fg = rex.canvas, bg = rex.accent, bold = true },
						MiniStatuslineDevinfo = { fg = rex.text_secondary, bg = rex.raised },
						MiniStatuslineFileinfo = { fg = rex.text_secondary, bg = rex.raised },
						MiniStatuslineInactive = { fg = rex.text_muted, bg = rex.canvas },
						NeoTreeNormal = { fg = rex.text, bg = rex.sidebar },
						NeoTreeNormalNC = { fg = rex.text, bg = rex.sidebar },
						NeoTreeCursorLine = { bg = rex.accent_container },
						NeoTreeWinSeparator = { fg = rex.border, bg = rex.sidebar },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin-mocha")

			-- Match embedded :terminal buffers to Rex's full 16-color ANSI palette.
			for index, color in ipairs(rex.ansi) do
				vim.g["terminal_color_" .. (index - 1)] = color
			end
		end,
	},
}
