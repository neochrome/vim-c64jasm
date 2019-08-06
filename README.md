# c64jasm plugin for vim

A vim plugin for the [c64jasm](https://github.com/nurpax/c64jasm) assembler.

## Features
* Syntax highlighting
	* 6502 opcodes, including DTV specific
* Auto indent following labels and braces
* Support for vim automatic comment formatting features

## Installation

For [vim-plug](https://github.com/junegunn/vim-plug) (or similar) use:
```vim
" latest version
Plug 'neochrome/vim-c64jasm'

" specific tag
Plug 'neochrome/vim-c64jasm', { 'tag': '0.7.*' }
```

Or copy the contents of the `ftplugin/`, `indent/` and `syntax/` directories to the
corresponding locations in your vim runtimepath.

## Optional configuration

No filetype auto detection is enabled by default. In order to enable,
put this in your `~/.vimrc`:
```vim
filetype plugin indent on
augroup filetypedetect
    au BufNewFile,BufRead *.asm set ft=c64jasm
augroup END
```
