set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" run :PluginInstall
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/screen'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on


" ===========================================================================
" UltiSnip
" 
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
map \s :UltiSnipsEdit<cr>
" ===========================================================================

" ===========================================================================
" YCM
" 
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/ycmd/cpp/ycm/.ycm_extra_conf_jb.py'
" ===========================================================================

" syntax on
set selectmode=mouse
set ts=2
set comments-=://
set nosmartindent
set noautoindent
set nocindent
set hlsearch
set selectmode=mouse
set tabstop=2
set expandtab
set ignorecase
set smartcase
set incsearch
set hlsearch

" unmap <C-c>
" set noexpandtab
" set shiftwidth=2
" set shiftround
" set cmdheight=2
map ,, :w<CR>
" set foldmethod=marker
"
" map ] <Esc>:tabn<CR>
" map [ <Esc>:tabp<CR>
" map <C-n> <Esc>:tabnew<CR>
map     <C-n>   :tabnew<CR>
map     <C-e>   :tabe
map     <Tab>   :tabn<CR>
map     <S-Tab> :tabp<CR>
map     qq      :call QuitAllTabs()<CR>
map     <F12>   :nohlsearch<CR>

func! QuitAllTabs()
    :tabonly!
    :q!
endfunc

syntax enable
set background=dark
" colorscheme grb256
colorscheme jellybeans
" colorscheme solarized
" colorscheme distinguished

" check: https://raw.github.com/ervandew/screen/master/doc/screen.txt

function! s:ScreenShellListener()
  if exists('g:ScreenShellActive') && g:ScreenShellActive
    if g:ScreenShellCmd == 'python'
      nmap <buffer> <C-c><C-c> :ScreenSend<cr>
      vmap <buffer> <C-c><C-c> :ScreenSend<cr>
    else
      nmap <buffer> <C-c><C-c> <Nop>
    endif
  else
    nmap <buffer> <C-c><C-c> :ScreenShellVertical python<cr>
  endif
endfunction

call s:ScreenShellListener()
augroup ScreenShellEnter
  autocmd User *.py call <SID>ScreenShellListener()
augroup END
augroup ScreenShellExit
  autocmd User *.py call <SID>ScreenShellListener()
augroup END


map  <f2> <Plug>RStart
nmap <f5> <Plug>RSendLine
vmap <f5> <Plug>RSendSelection

autocmd FileType python map <f3> :ScreenShellVertical python<cr>
autocmd FileType python nmap <buffer> <f5> :ScreenSend<cr>
autocmd FileType python vmap <buffer> <f5> :ScreenSend<cr>
