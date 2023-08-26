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
- `lazygit`
- `npm` since some of the packages use node

for debian based systems (Debian/Ubuntu/Linux Mint)
```shell
sudo apt install g++ npm

mkdir -p /tmp/lazygitinstall && cd /tmp/lazygitinstall && \
curl -L "https://github.com/jesseduffield/lazygit/releases/download/v0.37.0/lazygit_0.37.0_Linux_x86_64.tar.gz" | tar -xzv && \
cp /tmp/lazygitinstall/lazygit ~/bin/lazygit
```

## How to customize
You can modify this configuration for your personal needs via using one or more of the 
following methods.

### customization for your install 
create a `init.lua` in `~/.config/$NVIM_APPNAME/lua/custom` 
All files in the `custom` directory will be ignored by GIT.
If a `custom/init.lua` exists, it will be loaded however

### customization per Workspace
it is also possible to create a config depending on the workspace you are opening.

simply create a `.nviminit.lua` inside the folder you are opening NeoVim from.
(in following refered to as `[WorkingDir]/.nviminit.lua`)


A `[WorkingDir]/.nviminit.lua` is loaded after the `~/.config/$NVIM_APPNAME/lua/custom/init.lua` has finished
loading. Since it resides in what ever workind directory NeoVim was opened from,
you can use it to changes the settings to something, that fits your current "Project" best.



---
## This Configuration uses the following Package/Plugins
- **[Packer](https://github.com/wbthomason/packer.nvim)** for package managing
- **[ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)** for better bookmarking of files
- **[itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)** to improve the visuals more 
- **[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** as fuzzy finder
- **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** to provide syntax highlighting
- **[kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)** for handling anything git related

- **[Tokyonight](https://github.com/folke/tokyonight.nvim)** as current colorscheme
- **[morhetz/gruvbox](https://github.com/morhetz/gruvbox)** as alternate colorscheme  
- **[francoiscabrol/ranger.vim](https://github.com/francoiscabrol/ranger.vim)** for a better overview over the project files
- **[folke/which-key.nvim](https://github.com/folke/which-key.nvim)** keyboard shortcut cheatsheet and assignments

- **[camspiers/lens.vim](https://github.com/camspiers/lens.vim)** to make better use of small screen spaces
- **[rcarriga/nvim-dap-ui & mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)** as the Debugger
- **[iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)** to preview Markdown files
- **[kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)** Lazygit integration
- **[EmmaEwert/vim-rgbds](https://github.com/EmmaEwert/vim-rgbds)** Syntax highlighting for GBZ80 Assembly
- **[kkoomen/vim-doge](https://github.com/kkoomen/vim-doge)** Docblock generator for functions
- **[preservim/tagbar](https://github.com/preservim/tagbar)** Open the current taglist

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

All Keybindings are explained via Hydra  
Just press <Space> and wait a second, to see all available steps from their.
The help is split into two sections.

The top one has keys, that can be invoced without the  Leader being pressed first
The bottom one has keys, that require you to press Leader first
