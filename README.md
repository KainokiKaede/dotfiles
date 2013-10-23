Q. Why are you using \_vimrc, not .vimrc?
A. Because I began using Vim on Windows.
   \_vimrc is a windows-style filename of .vimrc.
   Both MacVim and Vim on windows can read \_vimrc.

Q. Why are there both \_vimrc and .vimrc?
A. Because github won't syntax-highlight \_vimrc.
   I wrote the following to my .git/hooks/pre-commit,
   to make git automatically copy \_vimrc to .vimrc before committing.

    #!/bin/sh
    cp -f _vimrc .vimrc
    cp -f _gvimrc .gvimrc
    git add .
