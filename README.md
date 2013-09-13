# Trevor's dotfiles

These are my personal bash/vim settings. Fee free to use them.

## Prerequisites

You will need to install Homebrew first (if you are on Mac OS X):

    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

To get advanced bash tab completion:

    brew install bash-completion

There are some other tools you might want as well:

    brew install ack  # this is an alternative to grep that is very awesome
    brew install tmux # this is an alternative to screen that is very awesome
    \curl -L https://get.rvm.io | bash -s stable # RVM allows you to install multiple Ruby interpreters
    gem install pry # pry is a GREAT alternative to irb for Ruby development

## Installation

Add these files to your home directory.

If you are using Windows, change the following files:

    move .vimrc _vimrc
    move .gvimrc _gvimrc
    move .vim vimfiles

## License

Copyright 2011-2013 Trevor Lalish-Menagh

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
