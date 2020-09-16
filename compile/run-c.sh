#!/usr/bin/env zsh
clear
rm -rf a.out 
clang $1 -W -Wall -Wextra -pedantic
./a.out
