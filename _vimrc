set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'dracula/vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Syntastic'
Plugin 'xuhdev/singlecompile'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim

""""""""""""""""""""""""""""""""�÷���Ŵ&��Ʈ"""""""""""""""""""""""""""""""""""
colorscheme dracula
set guifont=D2Coding:h14:b:cHANGEUL:qDRAFT


""""""""""""""""""""""""""""""""Ű����""""""""""""""""""""""""""""""""""""""""""
map <C-S> :w<CR>
map <C-O> :browse e<CR>
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | set nocompatible     " �������� VI�� ȣȯ���� ����
:let &pythonthreedll = 'C:\path\to\python36.dll'
set autoindent       " �ڵ� �鿩����
set cindent          " C ���α׷��ֿ� �ڵ� �鿩����
set smartindent      " ����Ʈ�� �鿩����
set wrap
set nowrapscan       " �˻��� �� ������ ������ ó������ �ȵ��ư�
set nobackup         " ��� ������ �ȸ���
set noswapfile
"set visualbell      " Ű�� �߸������� �� ȭ�� ������
set ruler            " ȭ�� ���� �ϴܿ� ���� Ŀ���� ��ġ(��,ĭ) ǥ��
set shiftwidth=4     " �ڵ� �鿩���� 4ĭ
set nu     	     " ���ȣ ǥ��, set nu �� ����
set fencs=ucs-bom,utf-8,euc-kr.latin1 " �ѱ� ������ euc-kr��, �����ڵ�� �����ڵ��
set fileencoding=utf-8 " �����������ڵ�
set tenc=utf-8       " �͹̳� ���ڵ�
"set expandtab       " �Ǵ�� �����̽�
set hlsearch         " �˻��� ����, set hls �� ����
set ignorecase       " �˻��� ��ҹ��� ����, set ic �� ����
set tabstop=4        " ���� 4ĭ����
set lbr
set incsearch        " Ű���� �Է½� ������ �˻�
set cursorline       " ���� ��ġ�� Ŀ�� ���� ����
set laststatus=2     " ���¹� ǥ�ø� �׻��Ѵ�
syntax on "  �������� ���
filetype indent on   " ���� ������ ���� ��������
set background=dark  " ���̶����� lihgt / dark
set backspace=eol,start,indent "  ���� ��, ����, �鿩���⿡�� �齺���̽��� �����ٷ�
set history=1000     " vi ������� ��ﰹ�� .viminfo�� ���

highlight Comment term=bold cterm=bold ctermfg=4 " �ڸ�Ʈ ���̶���Ʈ
set mouse=a          " vim���� ���콺 ���
set t_Co=256         " �� ����let arg2 = '"' . arg2 . '"' | endif

set runtimepath^=~/.vim/bundle/ctrlp.vim
:helptags ~/.vim/bundle/ctrlp.vim/doc

  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav

    " for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
 
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
let g:syntastic_c_compiler_options = "-std=c11 -Wall -Wextra -Wpedantic"


  endif
endfunction

