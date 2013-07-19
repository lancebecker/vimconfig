# vim configs

 *Adapted from: https://github.com/Valloric/dotfiles/blob/master/vim/vimrc.vim*

## Installation

Link the .vimrc file

		ln -s ~/.vim/.vimrc ~/.vimrc


use Vundle to install the Bundles.

		vim +BundleInstall! +BundleClean +q

Grab and install the **Inconsolata-dz** patched font for Powerline:

<https://gist.github.com/1595572>

## What's packed in this:

### Package Manager

#### [vundle](https://github.com/gmarik/vundle)
Vundle, the plug-in manager for Vim


Name	     |  Desc                                       | Bindings
------------ | ------------------------------------------- | ------------
[ctrlp](https://github.com/kien/ctrlp.vim) | Fuzzy file, buffer, mru and tag finder | `,f`
[bufexplorer](https://github.com/c9s/bufexplorer) | With bufexplorer, you can quickly and easily switch between buffers. | `,be`
[easymotion](https://github.com/Lokaltog/vim-easymotion) | Vim motions on speed!  | `,,w` `,,t`
[ack](https://github.com/mileszs/ack.vim) | Vim plugin for the Perl module / CLI script | `,a`
[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) | A Vim plugin for visually displaying indent levels in code | `F4`
[Gundo](https://github.com/sjl/gundo.vim/) | Gundo.vim is Vim plugin to visualize your Vim undo tree. | `F3`
[powerline](https://github.com/Lokaltog/vim-powerline) | Mega overhaul of the statusbar, colorized per mode.
[fugitive](https://github.com/tpope/vim-fugitive) | fugitive.vim: a Git wrapper so awesome, it should be illegal
[syntastic](https://github.com/scrooloose/syntastic) | Syntax checking hacks for vim
[vim-git](https://github.com/tpope/vim-git) | Vim Git runtime files
[ctrlp](https://github.com/kien/ctrlp.vim) | Fuzzy file, buffer, mru and tag finder | `,f`
[sparkup](https://github.com/rstacruz/sparkup) | A parser for a condensed HTML format. | `,e`
[nerdcommenter](https://github.com/scrooloose/nerdcommenter) | The premier commenting tool. | `c<space>`
[matchit](https://github.com/mirell/vim-matchit) | Import of Benji Fisher's matchit vim plugin, with history, extends `%` support.
[supertab](https://github.com/ervandew/supertab) | Perform all your vim insert mode completions with Tab.



