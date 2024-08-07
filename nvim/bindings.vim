let g:mapleader="\<Space>"

" Managing buffers
"
" Close all buffers
nnoremap <silent> <leader>C :bufdo bd<CR>:Dashboard<CR>
" Yank to clipboard with leader
noremap <silent> <leader>y "+y<CR>
" Cut to clipboard with leader
noremap <silent> <leader>d "+d<CR>

" Managing files
nnoremap <silent> <leader><leader> :noh<CR>

" Centerpad
nnoremap <silent><leader>z <cmd>lua require'centerpad'.toggle { leftpad = math.floor(vim.api.nvim_win_get_width(0)/(1+math.sqrt(5))), rightpad = math.floor(vim.api.nvim_win_get_width(0)/(1+math.sqrt(5))) }<CR>

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

" Insert literal tab
inoremap <silent> <S-Tab> <C-V><Tab><CR> 

noremap <silent> <leader>k :close<CR>
noremap <silent> <leader>K :close!<CR>

noremap <silent> <leader>ww :vs<CR>
noremap <silent> <leader>ws :sp<CR>
noremap <silent> <leader>r :source $MYVIMRC<CR>:echo "Configuration reloaded"<CR>
noremap <silent> <leader>Q :qa!<CR>

