" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" インデント方法の変更
set cinoptions+=:0
" メッセージ表示欄を2行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" rulerを表示
set ruler
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略されずに表示
set display=lastline
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コマンドラインの履歴を10000件保存する
set history=10000
" コメントの色を水色
hi Comment ctermfg=3
" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab
" インデント幅
set shiftwidth=4
" タブキー押下時に挿入される文字幅を指定
set softtabstop=4
" ファイル内にあるタブ文字の表示幅
set tabstop=4
" yでコピーした時にクリップボードに入る
set guioptions+=a
" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" スワップファイルを作成しない
set noswapfile
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" タイトルを表示
set title
" 行番号の表示
set number
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" シンタックスハイライト
syntax on
filetype plugin indent on
" すべての数を10進数として扱う
set nrformats=
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" バッファスクロール
set mouse=a

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
    " Declare the list of plugins.
    Plug 'tpope/vim-sensible'
    Plug 'junegunn/seoul256.vim'
    " for LSP
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'Shougo/deoplete.nvim'
    Plug 'lighttiger2505/deoplete-vim-lsp'
    Plug 'rust-lang/rust.vim'
    " for fzf
    Plug '~/homebrew/Cellar/fzf/0.26.0/plugin/fzf.vim'
    Plug '~/homebrew/bin/fzf'
    Plug 'junegunn/fzf'
    " for Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " for File tree
    Plug 'preservim/nerdtree'
    " for Icon
    Plug 'ryanoasis/vim-devicons'
    Plug 'lambdalisue/glyph-palette.vim'
    " git diff
    Plug 'airblade/vim-gitgutter'
    " git util
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    " add this line to your .vimrc file
    Plug 'mattn/emmet-vim'
    " etc utils
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'w0rp/ale'
    Plug 'jiangmiao/auto-pairs'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" lsp setting
let g:lsp_settings_root_markers = ['.projections.json', '.git', '.git/']

" Airline Tabline
let g:airline#extensions#tabline#enabled = 1

" <C-n>でファイルツリーを表示/非表示する
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" フォルダアイコンの表示をON
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Icon
set encoding=UTF-8
set guifont=Cica:h16
set printfont=Cica:h12
set ambiwidth=double

" ファイルツリーのアイコンに色をつける
" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

"" git操作
" g]で前の変更箇所へ移動する
nnoremap g[ :GitGutterPrevHunk<CR>
" g[で次の変更箇所へ移動する
nnoremap g] :GitGutterNextHunk<CR>
" ghでdiffをハイライトする
nnoremap gh :GitGutterLineHighlightsToggle<CR>
" gpでカーソル行のdiffを表示する
nnoremap gp :GitGutterPreviewHunk<CR>
" 記号の色を変更する
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red

"" 反映時間を短くする(デフォルトは4000ms)
set updatetime=250


"" fzf.vim
" <C-p>でファイル検索を開く
" git管理されていれば:GFiles、そうでなければ:Filesを実行する
" fun! FzfOmniFiles()
"   let is_git = system('git status')
"   if v:shell_error
"     :Files
"   else
"     :GFiles
"   endif
" endfun
" nnoremap <C-p> :call FzfOmniFiles()<CR>

" " <C-g>で文字列検索を開く
" " <S-?>でプレビューを表示/非表示する
" command! -bang -nargs=* Rg
" \ call fzf#vim#grep(
" \ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
" \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
" \ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
" \ <bang>0)
" nnoremap <C-g> :Rg<CR>

" " frでカーソル位置の単語をファイル検索する
" nnoremap fr vawy:Rg <C-R>"<CR>
" " frで選択した単語をファイル検索する
" xnoremap fr y:Rg <C-R>"<CR>
" 
" " fbでバッファ検索を開く
" nnoremap fb :Buffers<CR>
" " fpでバッファの中で1つ前に開いたファイルを開く
" nnoremap fp :Buffers<CR><CR>
" " flで開いているファイルの文字列検索を開く
" nnoremap fl :BLines<CR>
" " fmでマーク検索を開く
" nnoremap fm :Marks<CR>
" " fhでファイル閲覧履歴検索を開く
" nnoremap fh :History<CR>
" " fcでコミット履歴検索を開く
" nnoremap fc :Commits<CR>
" 
