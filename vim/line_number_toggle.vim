" Line number/Relative number
" Switch with Ctrl+n
" Auto switches on focus loss

function! NumberToggle()
  if(&relativenumber == 1 && &number == 1)
    set nonumber
    set norelativenumber
  elseif (&number == 1)
    set relativenumber
  else
      set number
  endif
endfunc

function! NumberLineMode(mode)
    if (&relativenumber == 1 || &number == 1)
        if (a:mode == 1)
            set number
            set norelativenumber
        else
            set number
            set relativenumber
        endif
    endif
endfunction

nnoremap <C-n> :call NumberToggle()<cr>

au FocusLost * call NumberLineMode(1)
au FocusGained * call NumberLineMode(2)

au InsertEnter * call NumberLineMode(1)
au InsertLeave * call NumberLineMode(2)