" plugin/scratch.vim

if (exists('g:scratch_disable') && g:scratch_disable) || &compatible
  finish
endif

if !exists('g:scratch_autohide')
  let g:scratch_autohide = &hidden
endif
if !exists('g:scratch_insert_autohide')
  let g:scratch_insert_autohide = 1
endif
if !exists('g:scratch_filetype')
  let g:scratch_filetype = 'scratch'
endif
if !exists('g:scratch_height')
  let g:scratch_height = 0.2
endif
if !exists('g:scratch_top')
  let g:scratch_top = 1
endif
if !exists('g:scratch_horizontal')
  let g:scratch_horizontal = 1
endif
if !exists('g:scratch_persistence_file')
  let g:scratch_persistence_file = ''
endif

command! -bang -nargs=? Scratch call scratch#open(<bang>0, <f-args>)
command! -bang -nargs=? ScratchInsert call scratch#insert(<bang>0, <f-args>)
command! -bang -nargs=? -range ScratchSelection call scratch#selection(<bang>0, <f-args>)
command! -nargs=? ScratchPreview call scratch#preview(<f-args>)

nnoremap <silent> <plug>(scratch-insert-reuse) :call scratch#insert(0)<cr>
nnoremap <silent> <plug>(scratch-insert-clear) :call scratch#insert(1)<cr>
xnoremap <silent> <plug>(scratch-selection-reuse) :<c-u>call scratch#selection(0)<cr>
xnoremap <silent> <plug>(scratch-selection-clear) :<c-u>call scratch#selection(1)<cr>

if !exists('g:scratch_no_mappings')
  nmap gs <plug>(scratch-insert-reuse)
  nmap gS <plug>(scratch-insert-clear)
  xmap gs <plug>(scratch-selection-reuse)
  xmap gS <plug>(scratch-selection-clear)
  nnoremap gZzZz gs
endif
