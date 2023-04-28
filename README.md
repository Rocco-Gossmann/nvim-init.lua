# This is my personal NeoVim configuration.

### To make full use of it, install the following packages on your system.
- `python-nvim` to make the Vimspector work
- `lazygit`

for debian based systems (Debian/Ubuntu/Linux Mint)
```shell
sudo apt install python-nvim 

mkdir -p /tmp/lazygitinstall && cd /tmp/lazygitinstall && \
curl -L "https://github.com/jesseduffield/lazygit/releases/download/v0.37.0/lazygit_0.37.0_Linux_x86_64.tar.gz" | tar -xzv && \
cp /tmp/lazygitinstall/lazygit ~/bin/lazygit
```

### it uses the following Package/Plugins
- **[Packer](https://github.com/wbthomason/packer.nvim)** for package managing
- **[morhetz/gruvbox](https://github.com/morhetz/gruvbox)** as the colorsheme  
- **[itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)** to improve the visuals more 
- **[nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** as the file explorer
- **[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** as fuzzy finder
- **[ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)** for better bookmarking of files
- **[kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)** for handling anything git related
- **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** to provide syntax highlighting
- **[puremourning/vimspector](https://github.com/puremourning/vimspector)** as the Debugger
- **[iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)** to preview Markdown files

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
\<leader>ht | open a terminal session (return when terminal is closed) |


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
\<leader>d\<ESC>| Stop and Close Vimspector |  

