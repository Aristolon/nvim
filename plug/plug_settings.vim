
" ===================== Start of Plugin Settings =====================

" ===
" === coc.nvim
" ===
source ~/.config/nvim/plug/coc/coc_config.vim

" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1

" ===
" ===  markdown-preview
" ===
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0
" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0
" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''
" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'chromium'
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0
" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''
" use a custom port to start server or random for empty
let g:mkdp_port = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" ===
" === FZF
" ===
nnoremap <c-p> :Leaderf file<CR>
" noremap <silent> <C-p> :Files<CR>
noremap <silent> <C-f> :Rg<CR>
noremap <silent> <C-h> :History<CR>
"noremap <C-t> :BTags<CR>
" noremap <silent> <C-l> :Lines<CR>
noremap <silent> <C-w> :Buffers<CR>
noremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc

" ===
" === vim-visual-multi
" ===
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
let g:VM_maps['i']                  = 'k'
let g:VM_maps['I']                  = 'K'
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'

" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]

" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" function! NearestMethodOrFunction() abort
" 	return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:scrollstatus_size = 15

" ===
" === fzf-gitignore
" ===
noremap <LEADER>gi :FzfGitignore<CR>

" ===
" === vim-easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1

" ===
" === goyo
" ===
map <LEADER>gy :Goyo<CR>

" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" ===
" === rnvimr
" ===
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]

" ===
" === nvim-treesitter
" ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"typescript", "dart", "java"},     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF

" ===
" === lazygit.nvim
" ===
noremap <c-g> :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support



" ===
" === Dress up my nvim
" ===

set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"Dashboard
" let g:dashboard_custom_header = [
"       \ '',
"       \ '███████╗██╗   ██╗ ██████╗ ██╗    ██╗   ██╗███████╗    ██╗',
"       \ '██╔════╝██║   ██║██╔═══██╗██║    ██║   ██║██╔════╝    ██║',
"       \ '█████╗  ██║   ██║██║   ██║██║    ██║   ██║█████╗      ██║',
"       \ '██╔══╝  ╚██╗ ██╔╝██║   ██║██║    ╚██╗ ██╔╝██╔══╝      ╚═╝',
"       \ '███████╗ ╚████╔╝ ╚██████╔╝███████╗╚████╔╝ ███████╗    ██╗',
"       \ '╚══════╝  ╚═══╝   ╚═════╝ ╚══════╝ ╚═══╝  ╚══════╝    ╚═╝',
"       \ '',
"       \ '                       [Aristolon]',
"       \ '',
"       \ ]
let g:dashboard_preview_command = 'cat'
let g:dashboard_preview_file = '~/.config/nvim/dashboard.cat'
let g:dashboard_preview_file_height = 10
let g:dashboard_preview_file_width = 80
let g:dashboard_default_executive ='telescope'
let g:dashboard_default_executive ='fzf'
" let g:dashboard_custom_shortcut={
"       \ 'last_session'       : 'Ctrl X',
"       \ 'find_history'       : 'Ctrl H',
"       \ 'find_file'          : 'Ctrl P',
"       \ 'new_file'           : 'Ctrl E',
"       \ 'change_colorscheme' : 'Ctrl T',
"       \ 'find_word'          : 'Ctrl F',
"       \ 'book_marks'         : 'Ctrl M',
"       \ }
let g:dashboard_custom_shortcut={
			\ 'last_session'       : 'SPC s l',
			\ 'find_history'       : 'SPC f h',
			\ 'find_file'          : 'SPC f f',
			\ 'new_file'           : 'SPC f n',
			\ 'change_colorscheme' : 'SPC t c',
			\ 'find_word'          : 'SPC f a',
			\ 'book_marks'         : 'SPC f b',
			\ }
noremap <LEADER>fn :DashboardNewFile<CR>

"Galaxyline
luafile ~/.config/nvim/theme/eviline.lua

"rust.vim
syntax enable
filetype  plugin indent on
let g:rustfmt_autosave = 1 " 保存时代码自动格式化
" Visual 模式下格式化
vnoremap <leader>ft :RustFmtRanger<CR>
" Normal 模式下整体格式化
nnoremap <leader>ft :RustFmtRanger<CR>
" Alt-t 检查占用，快捷键绑定
nnoremap <M-t> :RustTest<CR>

"Nerdcommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"racer-vim
let g:racer_cmd = "/home/lxc/.cargo/bin/racer"

" "===
" "=== ALL FOR RUST
" "===
"
" " Set completeopt to have a better completion experience
" " :help completeopt
" " menuone: popup even when there's only one match
" " noinsert: Do not insert text until a selection is made
" " noselect: Do not select, force user to select one from the menu
" set completeopt=menuone,noinsert,noselect
"
" " Avoid showing extra messages when using completion
" set shortmess+=c
"
" " Configure LSP through rust-tools.nvim plugin.
" " rust-tools will configure and enable certain LSP features for us.
" " See https://github.com/simrat39/rust-tools.nvim#configuration
" lua <<EOF
" local nvim_lsp = require'lspconfig'
"
" local opts = {
"     tools = { -- rust-tools options
"         autoSetHints = true,
"         hover_with_actions = true,
"         inlay_hints = {
"             show_parameter_hints = false,
"             parameter_hints_prefix = "",
"             other_hints_prefix = "",
"         },
"     },
"
"     -- all the opts to send to nvim-lspconfig
"     -- these override the defaults set by rust-tools.nvim
"     -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
"     server = {
"         -- on_attach is a callback called when the language server attachs to the buffer
"         -- on_attach = on_attach,
"         settings = {
"             -- to enable rust-analyzer settings visit:
"             -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
"             ["rust-analyzer"] = {
"                 -- enable clippy on save
"                 checkOnSave = {
"                     command = "clippy"
"                 },
"             }
"         }
"     },
" }
"
" require('rust-tools').setup(opts)
" EOF
"
" " Setup Completion
" " See https://github.com/hrsh7th/nvim-cmp#basic-configuration
" lua <<EOF
" local cmp = require'cmp'
" cmp.setup({
"   -- Enable LSP snippets
"   snippet = {
"     expand = function(args)
"         vim.fn["vsnip#anonymous"](args.body)
"     end,
"   },
"   mapping = {
"     ['<C-p>'] = cmp.mapping.select_prev_item(),
"     ['<C-n>'] = cmp.mapping.select_next_item(),
"     -- Add tab support
"     ['<S-Tab>'] = cmp.mapping.select_prev_item(),
"     ['<Tab>'] = cmp.mapping.select_next_item(),
"     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
"     ['<C-f>'] = cmp.mapping.scroll_docs(4),
"     ['<C-Space>'] = cmp.mapping.complete(),
"     ['<C-e>'] = cmp.mapping.close(),
"     ['<CR>'] = cmp.mapping.confirm({
"       behavior = cmp.ConfirmBehavior.Insert,
"       select = true,
"     })
"   },
"
"   -- Installed sources
"   sources = {
"     { name = 'nvim_lsp' },
"     { name = 'vsnip' },
"     { name = 'path' },
"     { name = 'buffer' },
"   },
" })
" EOF
" "=== END OF ALL FOR RUST ==="

"Vim-buffet
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)
