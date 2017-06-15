:set smartindent
:set tabstop=4
:set showmatch
:set shiftwidth=4
:set showmode
:set mouse=a
:set number
:set scrolloff=5
:set ruler
:set modeline

if &encoding == 'utf-8'
  set ambiwidth=double
  " 全角スペースの表示
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
  match ZenkakuSpace /　/
endif

"以下neobundle設定
:set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

"ここにいれる
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-n> :NERDTreeToggle<CR>

NeoBundle 'Shougo/vimproc', {
			\'build' : {
			\	'unix' : 'make -f make_unix.mak',
			\	},
			\}
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config={'*': {'split':''}}
let g:quickrun_config=get(g:, 'quickrun_config', {})
let g:quickrun_config._={
			\'runner': 'vimproc',
			\'runner/vimproc/updatetime' : 10,
			\'outputter' : 'error',
			\'outputter/error/success' : 'buffer',
			\'outputter/error/error'   : 'quickfix',
			\'outputter/buffer/close_on_empty' : 1,
			\}
au FileType qf nnoremap <silent><buffer>q :quit<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

NeoBundle "tyru/caw.vim.git"
nmap <C-k> <Plug>(caw:i:toggle)
vmap <C-k> <Plug>(caw:i:toggle)

NeoBundle 'LeafCage/yankround.vim'
let g:yankround_max_history = 100
nnoremap <silent><C-p> :<C-u>Unite yankround<CR>

" NeoBundle 'Townk/vim-autoclose'
" 括弧を自動で閉じる奴

call neobundle#end()

filetype plugin indent on

"インストールをチェックしてくれるやつ
NeoBundleCheck
