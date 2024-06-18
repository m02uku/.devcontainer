#!/bin/bash

commands=(
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
  $c --version
done