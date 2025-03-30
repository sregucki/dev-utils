#!/bin/bash

set -e
touch .prettierrc.yaml
{
  printf "plugins:"
  printf "\n"
  printf "  - prettier-plugin-java"
  printf "\n"
  printf "useTabs: false"
  printf "\n"
  printf "tabWidth: 4"
} >> .prettierrc.yaml
npm init
npm install prettier prettier-plugin-java husky lint-staged --save-dev
awk 'NR==16{print "\ \ \},\n\ \ \"husky\":\ \{\n\ \ \ \ \"hooks\":\ \{\n\ \ \ \ \ \ \"pre-commit\":\ \"lint-staged\"\n\ \ \ \ \}\n\ \ \},\n\ \ \"lint-staged\":\ \{\n\ \ \ \ \"\*.\{,java\}\":\ \[\n\ \ \ \ \ \ \"prettier\ --write\",\n\ \ \ \ \ \ \"git\ add\"\n\ \ \ \ \]"}1' package.json > package.txt
mv package.txt package.json
npx husky init
echo "npx --no lint-staged" > .husky/pre-commit
{
  printf "\n"
  printf "node_modules/"
} >> .gitignore