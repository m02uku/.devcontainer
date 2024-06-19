#!/bin/bash

# `version` でバージョンを確認するもの
commands=(
  "hugo"
)

# `--version` でバージョンを確認するもの
commands_=(
  "python"
  "pip"
  "cargo"
  "julia"
  "node"
  "npm"
  "codon"
)

for c in "${commands[@]}"
do
  echo -n "$c: "
  # printf "%7d: " $c
  $c version
done

for c in "${commands_[@]}"
do
  echo -n "$c: "
  # printf "%7d: " $c
  $c --version
done