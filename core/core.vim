"
" ██████╗ ██████╗ ██████╗ ███████╗  ██╗   ██╗██╗███╗   ███╗
"██╔════╝██╔═══██╗██╔══██╗██╔════╝  ██║   ██║██║████╗ ████║
"██║     ██║   ██║██████╔╝█████╗    ██║   ██║██║██╔████╔██║
"██║     ██║   ██║██╔══██╗██╔══╝    ╚██╗ ██╔╝██║██║╚██╔╝██║
"╚██████╗╚██████╔╝██║  ██║███████╗██╗╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝

"============
"Auto load for first time uses
"============
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Modular configuration
source ~/.config/nvim/core/general_config.vim
source ~/.config/nvim/core/key_bindings.vim
source ~/.config/nvim/core/special_config.vim
source ~/.config/nvim/core/language_config.vim
source ~/.config/nvim/plug/plug_list.vim
source ~/.config/nvim/plug/plug_settings.vim
source ~/.config/nvim/theme/theme.vim
