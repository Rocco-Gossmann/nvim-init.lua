# My NVIM - Config

> [!Attention]  
> this is config expects NeoVim 0.11 or higher.
> try lower versions at your own risk

## Keymaps

These are the most important ones though.

### Exiting NeoVim

typing `:q!` or `:qwa!` to close buffers or vim is slow. These shortcuts are an alternative to that.
(all sequences here require `shift` to be held)

| Sequence | Description                        |
| :------- | :--------------------------------- |
| `ZZ`     | as per default: closes a buffer    |
| `ZD`     | delete the current buffer (`:bd!`) |
| `ZW`     | write/save and close all Buffers   |
| `ZA`     | close all buffers, without saving  |

### Leader based maps

the leader key is `<space>` as per [Kickstart.nvim's](https://github.com/nvim-lua/kickstart.nvim). default.

most of these can be be figured out, thanks to the Which-Key plugin.
So I'm not going to list every single one here.

#### Leader Leader

pressing `<leader>` twice opens a list of all current buffers.

#### Leader T => Toggle

| Sequence     | Description                                                                |
| :----------- | :------------------------------------------------------------------------- |
| `<leader>tz` | [T]oggle [Z]en-Mode (maximizes current buffer and brings it to the center) |
| `<leader>tt` | [T]oggle [T]wighlight (gray out everything but the current text block)     |
| `<leader>tl` | [T]oggle Monokai ([L]ight and Dark-Mode)                                   |
| `<leader>tb` | [T]o [B]ookmark-list                                                       |
| `<leader>tr` | [T]ask [R]unner (List of Tasks/Macros)                                     |

#### Leader P => Project

| Sequence     | Description                        |
| :----------- | :--------------------------------- |
| `<leader>p`  | execute action on a project level  |
| `<leader>pf` | [P]roject open [F]ile              |
| `<leader>ps` | [P]roject find [S]tring            |
| `<leader>pw` | [P]roject find [W]ord under cursor |
| `<leader>pt` | [P]roject find [T]ag (aka. Symbol) |

#### Leader G => Git

| Sequence     | Description                        |
| :----------- | :--------------------------------- |
| `<leader>gf` | [G]it list [F]iles                 |
| `<leader>gb` | [G]it [B]lame                      |
| `<leader>gn` | [G]it [N]ext changed Block         |
| `<leader>gp` | [G]it [P]revious changed Block     |
| `<leader>gd` | [G]it show [D]iff of changed Block |
| `<leader>gs` | [G]it [S]tage changed Block        |

#### Leader F => Anything that has to do with [F]iles or [F]inding stuff

Which-key will show you what is available here 😉.
A few interresting mappings are:

| Sequence     | Description                                      |
| :----------- | :----------------------------------------------- |
| `<leader>fh` | [F]ind [H]elp                                    |
| `<leader>fm` | [F]ind [M]apping                                 |
| `<leader>fr` | [F]ind [R]esume (resume the last search you did) |
| `<leader>fg` | [F]ind [G]rep (alternative to vims "/" - search) |
| `<leader>fe` | [F]ind current file in [E]xplorer                |
| ...          |                                                  |

#### Leader q => some convenient [Q]uicklist manipulations.

Which-key will show you what is available here 😉.

#### Leader s => handeling window [S]plits

| Sequence     | Description                                                    |
| :----------- | :------------------------------------------------------------- |
| `<leader>sh` | [S]plit [H]orizontal (new split below)                         |
| `<leader>sv` | [S]plit [V]ertical (new split to the right)                    |
| `<leader>sb` | [S]plit [B]alance (make all splits roughtly the same size)     |
| `<leader>sm` | [S]plit [M]aximize (make the current split as big as possible) |

#### Leader c => anything, that has to do with [C]ode

| Sequence      | Description                                                                                                     |
| :------------ | :-------------------------------------------------------------------------------------------------------------- |
| `<leader>cf`  | [C]ode [F]ormat                                                                                                 |
| `<leader>cd`  | [C]ode [D]ocblock (try to create one if the LSP allows it)                                                      |
| `<leader>cr`  | [C]ode [R]ename (try to rename the current symbol, if the LSP allows it)                                        |
| `<leader>ca`  | [C]ode [A]ctions (if the LSP allows it, list available actions)                                                 |
| `<leader>clr` | [C]ode [L]anguageserver [R]estart (some Languageservers, like tsserver need to be restarted from time to time ) |

#### Leader m => [M]akefile/[M]ake actions (requires vim to be run in a TMUX-Session)

Makefiles can be handy, if a project needs to run certain shell scripts.
If the Makefile defines a `run`, `clean` or `dev` task, you can trigger them from within the editor
(or you can just run plain `make`, to run the first task found in the Makefile)

| Sequence     | Description            |
| :----------- | :--------------------- |
| `<leader>mm` | [M]ake (just run make) |
| `<leader>mr` | [M]ake [R]un           |
| `<leader>mc` | [M]ake [C]lean         |
| `<leader>md` | [M]ake [D]ev           |

### Debugger keys

| Sequence | Description                 |
| :------- | :-------------------------- |
| `<f9>`   | toggle breakpoint           |
| `<f5>`   | start debugger              |
| `<f6>`   | evalueate item under cursor |
| `<f11>`  | step into                   |
| `<f10>`  | step over                   |
| `<f12>`  | step out                    |
| `<f8>`   | stop debugger               |


### Markdown / `*.todo` files specific actions

| Sequence     | description                              |
| ------------ | ---------------------------------------- |
| `<leader>j ` | [J]obs / Todos                           |
| `<leader>jn` | convert line to Todo                     |
| `<leader>js` | mark todo as started                     |
| `<leader>jc` | mark todo as canceled                    |
| `<leader>jr` | remove/reset all Todo-Metadata from line |

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
