# This is my personal NeoVim configuration.



## Requirements.
1. make sure, that Packer is installed. go to [https://github.com/wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) and follow the install instructions.

2. on the first load, you will get a lot of errors. This is normal, since Packer did not download all its required files yet.

3. to fix this run: 
```vim
:PackerSync
```
You may need to run it more than once if you get errors during the install of some packages.
If some packages continue to be brocken, than please report them in the Issues section.


## Install some additionaly required external programs.
- `g++`,  so that treesitter can campile any LSPs it may need
- `python-nvim` to make the Vimspector work
- `lazygit`
- `npm` since some of the packages use node

for debian based systems (Debian/Ubuntu/Linux Mint)
```shell
sudo apt install python-nvim g++ npm

mkdir -p /tmp/lazygitinstall && cd /tmp/lazygitinstall && \
curl -L "https://github.com/jesseduffield/lazygit/releases/download/v0.37.0/lazygit_0.37.0_Linux_x86_64.tar.gz" | tar -xzv && \
cp /tmp/lazygitinstall/lazygit ~/bin/lazygit
```

## How to customize
You can modify this configuration for your personal needs via using one or more of the 
following methods.

### creating `~/.config/$NVIM_APPNAME/.nvimínit.lua` 
The `~/.config/nvim/.nviminit.lua` file is loaded, when ever NeoVim is done booting up.
It functions regardless of the current WorkingDirectory and thus allows you to 
change NeoVims configuration, without having to commit the changes to this Repo.

### using the `~/.config/$NVIM_APPNAME/lua/custom` folder
In addition, you can put more Lua files into `~/.config/$NVIM_APPNAME/lua/custom`.
Files put there also don't need to be commited to the Repo. Then you can call
files put there from your `~/.config/$NVIM_APPNAME/.nvimínit.lua` via:
```lua
require "custom.[your module name]"
```

### creating a `[WorkingDir]/.nviminit.lua`
A `[WorkingDir]/.nviminit.lua` is loaded after the `~/.config/nvim/.nvimínit.lua` has finished
loading. Since it resides in what ever workind directory NeoVim was opened from,
you can use it to changes the settings to something, that fits your current "Project" best.

### Custom Keybindings
First in `~/.config/$NVIM_APPNAME/lua/custom/mappings/` 
create a `common.lua` file, that looks like this:
```lua
return function(wk) 
    -- wk = which-key plugin
    wk.register( 
        -- See which-key.register for reference, what goes here
        -- ...
    )
end

```
#### Custom Mappings by Filetype
If you have mappings, that only should apply to certain filetypes, then you can create a 
`~/.config/$NVIM_APPNAME/lua/custom/mappings/filetypes/[your filetype].lua` File.

Here is an example, on what a `lua/custom/mappings/filetypes/markdown.lua` could look like.
```lua
return function(wk)
--[[============================================================================
-- Markdown Preview
--============================================================================]]
    wk.register({
        d = {
            name = "Display Preview",
            ['r'] = { vim.cmd.MarkdownPreview, "Run/Start" },
            ['s'] = {vim.cmd.MarkdownPreviewStop, "Stop" },
        }
    }, { prefix="<leader>", mode = "n" })
end

```





---
## This Configuration uses the following Package/Plugins
- **[Packer](https://github.com/wbthomason/packer.nvim)** for package managing
- **[morhetz/gruvbox](https://github.com/morhetz/gruvbox)** as the colorsheme  
- **[itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)** to improve the visuals more 
- **[camspiers/lens.vim](https://github.com/camspiers/lens.vim)** to make better use of small screen spaces
- **[nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** as the file explorer
- **[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** as fuzzy finder
- **[ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)** for better bookmarking of files
- **[kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)** for handling anything git related
- **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** to provide syntax highlighting
- **[puremourning/vimspector](https://github.com/puremourning/vimspector)** as the Debugger
- **[iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)** to preview Markdown files
- **[folke/which-key.nvim](https://github.com/folke/which-key.nvim)** keyboard shortcut cheatsheet and assignments

The following packages will setup the Intellisense via the Language-Server Protokoll  
Installing of language servers is down via the `Mason` command.

- **[VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)**
    - **requirements for LSP support**
        - **[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**
        - **[williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)**
        - **[williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)**

    - **requirements for autocompletion**
        - **[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)**
        - **[hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)**
        - **[hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)**
        - **[saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)**
        - **[hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)**
        - **[hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)**

    - **requirements for Snippets**
        - **[l3mon4d3/luasnip](https://github.com/l3mon4d3/luasnip)**
        - **[rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)**
---
## Keybindings

Leader = ` <Space> `

### Standard Vim
| Binding | Effect |
|---------|--------|
\<leader>qq | Quit |
\<leader>QQ | force Quite |
\<leader>qa | Quite all |
\<leader>QA | force Quite all|
\<leader>ww | write / save |
\<leader>WW | force write / force save |
\<leader>wa | write / save all |
\<leader>WA | force write / save all |
\<leader>f |  Auto reindent content of file |

### Clipboard
| Binding | Effect |
|---------|--------|
\<leader>y | Yank to System Clipboard |      
\<leader>p | Paste from System Clipboard |      

### Git
| Binding | Effect |
|---------|--------|
\<leader>gt | Open LazyGIT in current CWD |

### Telescope
| Binding | Effect |
|---------|--------|
\<leader> ff | find file in CWD 
\<leader> fs | find files containing string
\<leader> fu | like fs, but asks for the string before hand
\<leader> fg | find file in GIT
\<leader> fb | find open buffer
\<leader> fh | find help tag
\<leader> fk | find key


###  Nvim-Tree additions
| Binding | Effect |
|---------|--------|
\<C-n> | Toggle Nvim-Tree
\<leader> \<CR> | set selected as new CWD


### Harpoon
| Binding | Effect |
|---------|--------|
\<leader>hm | Add current File too Harpoon list |
\<leader>hh | show Harpoon list |
\<leader>1 | open file at 1. entry on Harpoon list |
\<leader>2 | open file at 2. entry on Harpoon list |
\<leader>3 | open file at 3. entry on Harpoon list |
\<leader>4 | open file at 4. entry on Harpoon list |
\<leader>5 | open file at 5. entry on Harpoon list |
\<leader>6 | open file at 6. entry on Harpoon list |
\<leader>7 | open file at 7. entry on Harpoon list |
\<leader>8 | open file at 8. entry on Harpoon list |
\<leader>9 | open file at 9. entry on Harpoon list |


### Intellisense / LSP
| Binding | Effect |
|---------|--------|
gd | Goto definition |
K | Show hover / mouse over |
\<leader>vws | goto Workspace Symbol|
\<leader>vd | show diagnostics Floating window|
\[d | Goto next diagnostics |
\]d | Goto previous diagnostics |
\<leader>vca | Code Action |
\<leader>vrr | Show references |
\<leader>vrn | rename symbol in whole file|
\<leader>vff | Format accoring to LSP |
\<C-h> | show function signature / help |


### Vimspector
| Binding | Effect |
|---------|--------|
\<leader>db| Toggle Breakpoint |  
\<leader>dr| Launch Vimspector |  
\<leader>dl (vim motion right)| Stop Into |  
\<leader>dj (vim motion down)| Step Over |  
\<leader>dh (vim motion left) | Stop Out |  
\<leader>d\<CR>| Continue to next Breakpoint |
\<leader>ds| Stop and Close Vimspector |  


### MarkdownPreview
| Binding | Effect |
|---------|--------|
\<leader>dr| Open Preview |  
\<leader>ds| End Preview  |



