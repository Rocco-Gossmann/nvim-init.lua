# My NVIM - Config

> [!Attention]\
> this is config expects NeoVim 0.11 or higher. try lower versions at your own
> risk

## Keymaps

### Exiting NeoVim

typing `:q!` or `:qwa!` to close buffers or vim is slow. These shortcuts are an
alternative to that. (all sequences here require `shift` to be held)

| Key  | Group   | Description                                | Mode |
| ---- | ------- | ------------------------------------------ | ---- |
| `Z`  | `Close` | -                                          | -    |
| `ZZ` | -       | `Close current buffer (warn if not saved)` | `n`  |
| `ZD` | -       | `remove current buffer (ignore unsaved)`   | `n`  |
| `ZW` | -       | `close all buffers (save all files)`       | `n`  |
| `ZA` | -       | `close all buffers (ignore unsaved)`       | `n`  |

### Macros

You can create your own macros on a per project basis. just type `<leader>tr` to
get a variaty of options. "the .nvim/tasks.lua configures your macros"

| Key          | Group | Description   | Mode |
| ------------ | ----- | ------------- | ---- |
| `<leader>tr` | -     | `Task Runner` | `n`  |

### TMUX - Integration

| Key     | Group              | Description      | Mode |
| ------- | ------------------ | ---------------- | ---- |
| `<C-h>` | `TMUX-Navigations` | `Navigate left`  | `n`  |
| `<C-j>` | `TMUX-Navigations` | `Navigate down`  | `n`  |
| `<C-k>` | `TMUX-Navigations` | `Navigate up`    | `n`  |
| `<C-l>` | `TMUX-Navigations` | `Navigate right` | `n`  |

### Code Actions

| Key          | Group          | Description       | Mode   |
| ------------ | -------------- | ----------------- | ------ |
| `<leader>c`  | `[C]ode`       | -                 | `n`    |
| `<leader>cr` | `[C]ode`       | `[R]ename`        | `n`    |
| `<leader>cd` | `[C]ode`       | `Document`        | `n`    |
| `<leader>ca` | `[C]ode`       | `Action`          | `n, x` |
| `<leader>cc` | `[C]ode`       | `Comment`         | `n, x` |
| `<leader>cl` | `[C]ode [L]sp` | `[L]sp [R]estart` | `n`    |

### QuickList

| Key          | Group         | Description            | Mode |
| ------------ | ------------- | ---------------------- | ---- |
| `<leader>q`  | `[Q]uicklist` | -                      | `n`  |
| `<leader>qd` | `[Q]uicklist` | `alt+tab files`        | `n`  |
| `<leader>qn` | `[Q]uicklist` | `Quicklist [N]ext`     | `n`  |
| `<leader>qp` | `[Q]uicklist` | `Quicklist [P]revious` | `n`  |
| `<leader>qc` | `[Q]uicklist` | `Quicklist [C]lose`    | `n`  |
| `q`          | `[Q]uicklist` | -                      | `n`  |
| `qd`         | `[Q]uicklist` | `alt+tab files`        | `n`  |
| `qn`         | `[Q]uicklist` | `Quicklist [N]ext`     | `n`  |
| `qp`         | `[Q]uicklist` | `Quicklist [P]revious` | `n`  |
| `qc`         | `[Q]uicklist` | `Quicklist [C]lose`    | `n`  |

### Explorer (NertTree)

| Key     | Group        | Description         | Mode |
| ------- | ------------ | ------------------- | ---- |
| `<C-n>` | `[E]xplorer` | `NERDTreeToggle`    | `n`  |
| `E`     | `[E]xplorer` | -                   | `n`  |
| `EE`    | `[E]xplorer` | `Explorer in place` | `n`  |
| `EL`    | `[E]xplorer` | `Explorer right`    | `n`  |
| `EH`    | `[E]xplorer` | `Explorer left`     | `n`  |
| `EJ`    | `[E]xplorer` | `Explorer bottom`   | `n`  |
| `EK`    | `[E]xplorer` | `Explorer top`      | `n`  |
| `ET`    | `[E]xplorer` | `Explorer [T]ab`    | `n`  |

### Project-Dir actions

| Key          | Group       | Description             | Mode |
| ------------ | ----------- | ----------------------- | ---- |
| `<leader>p`  | `[P]roject` | -                       | `n`  |
| `<leader>pf` | `[P]roject` | `Project [F]iles`       | `n`  |
| `<leader>ps` | `[P]roject` | `Project find [S]tring` | `n`  |
| `<leader>pw` | `[P]roject` | `Project find [W]ord`   | `n`  |
| `<leader>pt` | `[P]roject` | `Project find [T]ag`    | `n`  |

### Filespecific actions

| Key          | Group    | Description               | Mode |
| ------------ | -------- | ------------------------- | ---- |
| `<leader>f`  | `[F]ile` | `Find [F]ile`             | `n`  |
| `<leader>ff` | `[F]ile` | `Find [F]ile`             | `n`  |
| `<leader>fo` | `[F]ile` | `Find [O]lder File`       | `n`  |
| `<leader>fh` | `[F]ile` | `Find [H]elp`             | `n`  |
| `<leader>fm` | `[F]ile` | `Find [M]appings`         | `n`  |
| `<leader>fr` | `[F]ile` | `Find [R]esume`           | `n`  |
| `<leader>ft` | `[F]ile` | `Find file [T]ags`        | `n`  |
| `<leader>fe` | `[F]ile` | `File show in [E]xplorer` | `n`  |
| `<leader>fd` | `[F]ile` | `File [D]Diagnose`        | `n`  |
| `<leader>fg` | `[F]ile` | `File [G]rep`             | `n`  |
| `<leader>fn` | `[F]ile` | `files ([N]erdTree)`      | `n`  |

### Git specific actions

| Key          | Group   | Description              | Mode |
| ------------ | ------- | ------------------------ | ---- |
| `<leader>g`  | `[G]it` | -                        | `n`  |
| `<leader>gf` | `[G]it` | `Search [F]iles`         | `n`  |
| `<leader>gb` | `[G]it` | `Blame line`             | `n`  |
| `<leader>gn` | `[G]it` | `Next changed Block`     | `n`  |
| `<leader>gp` | `[G]it` | `Previous changed Block` | `n`  |
| `<leader>gd` | `[G]it` | `Diff Changed Block`     | `n`  |
| `<leader>gs` | `[G]it` | `Stage Hunk`             | `n`  |
| `<leader>gl` | `[G]it` | `Lazygit`                | `n`  |

### Launch Terminal Apps in TMUX

| Key          | Group      | Description               | Mode |
| ------------ | ---------- | ------------------------- | ---- |
| `<leader>l`  | `[L]aunch` | -                         | `n`  |
| `<leader>lg` | `[L]aunch` | `Lazy[G]it`               | `n`  |
| `<leader>lt` | `[L]aunch` | `[T]erminal`              | `n`  |
| `<leader>ld` | `[L]aunch` | `Lazy[D]ocker`            | `n`  |
| `<leader>lr` | `[L]aunch` | `[R]anger`                | `n`  |
| `<leader>ls` | `[L]aunch` | `Database ([S]torage)`    | `n`  |
| `<leader>ll` | `[L]aunch` | `[L]LM - Server (Ollama)` | `n`  |

### Makefile Actions

| Key          | Group    | Description   | Mode |
| ------------ | -------- | ------------- | ---- |
| `<leader>m`  | `[M]ake` | -             | `n`  |
| `<leader>mm` | `[M]ake` | `(default)`   | `n`  |
| `<leader>mr` | `[M]ake` | `Run`         | `n`  |
| `<leader>md` | `[M]ake` | `Dev/[D]ebug` | `n`  |
| `<leader>mc` | `[M]ake` | `clean`       | `n`  |

### Vim window splits

| Key          | Group     | Description             | Mode |
| ------------ | --------- | ----------------------- | ---- |
| `<leader>s`  | `[S]plit` | -                       | `n`  |
| `<leader>sh` | `[S]plit` | `Vertical`              | `n`  |
| `<leader>sv` | `[S]plit` | `Horizontal`            | `n`  |
| `<leader>sb` | `[S]plit` | `Balance`               | `n`  |
| `<leader>sm` | `[S]plit` | `Maximize`              | `n`  |
| `<M-Down>`   | `[S]plit` | `Decrease Split height` | `n`  |
| `<M-Up>`     | `[S]plit` | `Increase Split height` | `n`  |
| `<M-Right>`  | `[S]plit` | `Increase Split width`  | `n`  |
| `<M-Left>`   | `[S]plit` | `Decrease Split width`  | `n`  |

### Debugger

| Key     | Group        | Description         | Mode |
| ------- | ------------ | ------------------- | ---- |
| `<F6>`  | `[D]ebugger` | `Debugger Evaluate` | `n`  |
| `<F5>`  | `[D]ebugger` | `Debugger Start`    | `n`  |
| `<F9>`  | `[D]ebugger` | `Breakpoint`        | `n`  |
| `<F10>` | `[D]ebugger` | `StepOver`          | `n`  |
| `<F11>` | `[D]ebugger` | `StepInto`          | `n`  |
| `<F12>` | `[D]ebugger` | `StepOut`           | `n`  |
| `<F8>`  | `[D]ebugger` | `Stop`              | `n`  |

### Template files

| Key  | Group       | Description        | Mode |
| ---- | ----------- | ------------------ | ---- |
| `§`  | `Templates` | -                  | `n`  |
| `§w` | `Templates` | `TMUX-[W]orkspace` | `n`  |

### Toggles

| Key           | Group                   | Description           | Mode |
| ------------- | ----------------------- | --------------------- | ---- |
| `<leader>t`   | `[T]oggle [L]ight/Dark` | `Toggle [L]ight/Dark` | `n`  |
| `<leader>tld` | `[T]oggle [D]ark`       | `Toggle [D]ark`       | `n`  |
| `<leader>tll` | `[T]oggle [L]ight`      | `Toggle [L]ight`      | `n`  |

### LSP Actions

| Key     | Group | Description               | Mode |
| ------- | ----- | ------------------------- | ---- |
| `<S-h>` | `LSP` | `Hover Documentation`     | `n`  |
| `gh`    | `LSP` | `Hover Documentation`     | `n`  |
| `<S-k>` | `LSP` | `Signature Documentation` | `n`  |
| `gs`    | `LSP` | `Signature Documentation` | `n`  |
| `gd`    | `LSP` | `Go to Definition`        | `n`  |
| `gr`    | `LSP` | `Go to References`        | `n`  |
| `gi`    | `LSP` | `Go to Implementation`    | `n`  |
| `gD`    | `LSP` | `Go to Type Definition`   | `n`  |

### Misc.

| Key               | Group                 | Description                  | Mode |
| ----------------- | --------------------- | ---------------------------- | ---- |
| `<leader>e`       | `[E]rrors`            | `show [E]rrors and Warnings` | `n`  |
| `<leader>#`       | -                     | `alt+tab files`              | `n`  |
| `<leader><space>` | `Misc`                | `Find existing buffers`      | `n`  |
| `J`               | `Visual Mode Helpers` | `Move lines down`            | `x`  |
| `K`               | `Visual Mode Helpers` | `Move lines up`              | `x`  |
| `<leader>p`       | `Visual Mode Helpers` | `Paste without yank`         | `x`  |
| `<C-r>`           | `Visual Mode Helpers` | `Replace with register`      | `x`  |
| `<C-l>`           | `Visual Mode Helpers` | `Remove leading whitespace`  | `x`  |
| `n`               | `Visual Mode Helpers` | `Keep cursor centered`       | `v`  |
| `N`               | `Visual Mode Helpers` | `Keep cursor centered`       | `v`  |
| `<C-d>`           | `Visual Mode Helpers` | `Keep cursor centered`       | `v`  |
| `<C-u>`           | `Visual Mode`         | `Keep cursor centered`       | `v`  |
| `<C-j>`           | `Insert Mode Helpers` | `Show blink-cmp`             | `i`  |
| `<C-h>`           | `Insert Mode Helpers` | `Signature help`             | `i`  |
| `<Esc><Esc>`      | `Terminal Helpes`     | `Exit terminal mode`         | `t`  |

## Some usefull lua scripts.

### PHP-Debugging

```lua
dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { env.confdir .. '/lua/rg/dap/vscode-php-debug/out/phpDebug.js' }
}

dap.defaults.php.exception_breakpoints = { "Notice", "Warning", "Error", "Exception" }
```

### TaskRunner Scripts

```lua
return {

	-- <c-v>Esc = print escape char

	{
		label = "New Bookmark Comment",
		action = "o//78a=o BM: o78a=kA ",
	},

	{
		label = "PHP: to Error log",
		action = "oerror_log(var_export([], true));8hi",
	},

	{
		label = "Curly { to Square [",
		action = "csB]",
	},

	{
		label = "DBUI: table head 2 insert",
		action = "0v$:s/\\(\\s*\\)|\\(\\s*\\)/`\\1, \\2`/g0vt`d$vF,dv0S)"
	},

	{
		label = "DBUI: table row 2 insert",
		action = "0v$:s/\\(\\s*\\)|\\(\\s*\\)/'\\1, \\2'/g0vt'd$vF,dv0S)"
	}
}
```
