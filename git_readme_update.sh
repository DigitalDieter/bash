#!/bin/bash

# Update GitHub README.md

EI="\e[1;32m"
EO="\e[0m"

desc="Updating README.md"
echo -e $EI $desc $EO

git add README.md
git commit -m "README.md updated"
git push
