#!/usr/bin/env perl

use strict;
use warnings;

my $cdir = `pwd`;
chomp $cdir;

my $hdir = $ENV{'HOME'};
chomp $hdir;

foreach my $dotfile(qw/gitconfig vim/) {
    my $file = "$cdir/.$dotfile";
    my $link = "$hdir/.$dotfile";

    system "rm -f $link";
    system "ln -s $file $link";
}

system "git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim";
system "vim +PluginInstall +qall";
