" ===
" === Install Plugins with Vim-Plug
" ===

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin('$HOME/.config/nvim/plugged')
"eg：Plug 'user/repository'

" Pretty Dress
Plug 'glepnir/galaxyline.nvim'
Plug 'bagrat/vim-buffet'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hardcoreplayers/dashboard-nvim'
Plug 'Yggdroot/indentLine',{ 'for': ['lua', 'c', 'h', 'cpp', 'py', 'json', 'go', 'java', 'vim', 'hs'] }

" Themes
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'hardcoreplayers/oceanic-material'
Plug 'mhartington/oceanic-next'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr'

" Taglist
Plug 'liuchengxu/vista.vim', {'on':'Vista'}

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'honza/vim-snippets',{ 'for': ['lua', 'c', 'h', 'cpp', 'py', 'json', 'go', 'java', 'vim', 'hs'] }

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'kdheepak/lazygit.nvim'

"===
"=== All For Rust Below
"===
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
" Completion framework
Plug 'hrsh7th/nvim-cmp'
" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'
" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'
" Fuzzy finder
" Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'f-person/pubspec-assist-nvim', { 'for' : ['pubspec.yaml'] }

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" Editor Enhancement
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'easymotion/vim-easymotion'
Plug 'kevinhwang91/rnvimr', {'on': 'RnvimrToggle'}
Plug 'junegunn/goyo.vim'

call plug#end()

