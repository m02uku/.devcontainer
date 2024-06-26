#!/bin/bash

# Check if the src folder exists
if [ ! -d "src" ]; then
  # Create the src folder
  mkdir src
  echo "src folder created"
else
  echo "src folder already exists"
fi