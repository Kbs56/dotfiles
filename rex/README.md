# Rex

Config ported from Herdr and tmux, with shared navigation, tabs, panes,
sessions, and resize mode. Appearance and other settings use Rex's defaults.

## Install

From the dotfiles repository:

```sh
stow -t "$HOME" rex
rex config check && rex config reload
```

The active config is `~/.config/rex/init.lua`, with Vim detection in
`vim_nav.lua` and the Neovim handoff in `editor/nvim.lua`. Rex doesn't watch
these files; reload after editing. Use `rex keymap` to inspect loaded bindings.
App-level **Change Shortcut…** overrides take precedence over this config.

## Shortcuts

**Prefix** means press **Ctrl+Space**, release it, then press the next key.

| Keys | Action |
| --- | --- |
| Ctrl+h/j/k/l | Focus left/down/up/right, Vim-aware |
| Prefix h/j/k/l | Focus a Rex pane directly |
| Prefix Tab / Shift+Tab | Next / previous pane |
| Prefix v / % | Split right |
| Prefix - / " | Split down |
| Prefix H/J/K/L | Move pane left/down/up/right |
| Prefix x / z | Close / zoom pane |
| Alt+Shift+H / Alt+Shift+L | Previous / next tab |
| Prefix p / n | Previous / next tab |
| Prefix c | New tab |
| Prefix > / < | Move tab forward / backward |
| Prefix T / X | Rename / close tab |
| Prefix 1–9 | Go to tab (one-based) |
| Prefix w | Open session picker |
| Prefix N / W / D | New / rename / close session |
| Prefix r | Enter resize mode |
| Resize h/j/k/l or arrows | Resize pane |
| Resize = | Balance panes |
| Resize Enter | Exit resize mode |
| Prefix g | Enter navigate mode |
| Navigate j / k | Next / previous session |
| Navigate h / l | Focus pane left / right |
| Navigate Enter | Exit navigate mode |
| Prefix b / s | Toggle sidebar / open settings |
| Prefix ? | Toggle command palette |
| Prefix R | Reload config |
| Prefix Ctrl+Space | Send literal Ctrl+Space to terminal |

No custom edit-scrollback-in-Neovim action is configured (prefix [ / e).

## Neovim navigation

Rex passes Ctrl+h/j/k/l to foreground Vim/Neovim. This repo's
`nvim/.config/nvim/lua/plugins/tmux.lua` loads the Rex editor script after the
Herdr script: normal-mode navigation moves through editor splits, then runs
`rex focus` at an edge. The editor script only takes over inside Rex when
neither Herdr nor tmux is nested within it. Restart Neovim after installing.
