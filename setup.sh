#!/bin/zsh

# extract git location for select vim plugins
#
# for file in colorSchemeExplorer emmet-vim md-vim tcomment_vim vim-bundler vim-livedown vim-rails vim-ruby vim-sensible vim-surround; do
#   cat $file/.git/config | grep github
# done

for repo in git@github.com:jlanzarotta/colorSchemeExplorer.git git@github.com:mattn/emmet-vim.git git@github.com:dcvezzani/md-vim.git git@github.com:tomtom/tcomment_vim.git git://github.com/tpope/vim-bundler.git git@github.com:shime/vim-livedown.git git://github.com/tpope/vim-rails.git https://github.com/vim-ruby/vim-ruby.git git://github.com/tpope/vim-sensible.git https://github.com/tpope/vim-surround.git; do
  repo=git@github.com:jlanzarotta/colorSchemeExplorer.git
  _repo=$(echo ${repo%.*})
  repoName=$(echo ${_repo#*\/})
  echo $repoName

  if [ ! -e "./bundle/$repoName" ]; then
    git clone $repo bundle
  else
    echo "'bundle/$repoName' already exists"'!'"  Skipping git clone"
  fi
done

