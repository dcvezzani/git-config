#!/bin/zsh

if [ -z $HOME_PATH ]; then
  echo "Please set HOME_PATH in your environment before continuing

e.g., 
export HOME_PATH=/Users/joe
"
fi

# extract git location for select vim plugins
#
# for file in colorSchemeExplorer emmet-vim md-vim tcomment_vim vim-bundler vim-livedown vim-rails vim-ruby vim-sensible vim-surround; do
#   cat $file/.git/config | grep github
# done

if [ ! -e ~/.vim/autoload/pathogen.vim ]; then
  echo "Installing pathogen"
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

if [[ $(echo $(which npm)) =~ "not found" ]]; then
  echo "Please install node (npm) before continuing"
  exit 1
else
  echo "Installing livedown for 'vim-livedown' plugin"
  npm install -g livedown
fi

# to get keyboard shortcuts to work
# System Preferences > Keyboard > Shortcuts > press Tab to move keyboard focus between [All controls]
# System Preferences > Keyboard > Shortcuts > Services
#
# look for workflow scripts and assign desired key combinations
#
for file in ruby-generate-file-name-from-scratch-for-selected-file.workflow ruby-generate-file-name-from-selected-text.workflow; do
  if [ ! -d "$HOME_PATH/Library/Services/${file}" ]; then
    cp -r "$HOME_PATH/scripts/${file}" "$HOME_PATH/Library/Services"
  else
    echo "${file} has already been installed"
  fi
done

for repo in git@github.com:jlanzarotta/colorSchemeExplorer.git git@github.com:mattn/emmet-vim.git git@github.com:dcvezzani/md-vim.git git@github.com:tomtom/tcomment_vim.git git://github.com/tpope/vim-bundler.git git@github.com:shime/vim-livedown.git git://github.com/tpope/vim-rails.git https://github.com/vim-ruby/vim-ruby.git git://github.com/tpope/vim-sensible.git https://github.com/tpope/vim-surround.git; do
  _repo=$(echo ${repo%.*})
  repoName=$(echo ${_repo##*\/})
  echo $repoName

  if [ ! -e "./bundle/$repoName" ]; then
    git clone $repo bundle/$repoName
  else
    echo "'bundle/$repoName' already exists"'!'"  Skipping git clone"
  fi
done

