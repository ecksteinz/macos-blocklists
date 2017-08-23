#!/bin/bash

cp -a built/0hosts/. ~/Library/Gas\ Mask/Local/;

for f in ~/Library/Gas\ Mask/Local/*.txt; do
  mv -- "$f" "${f%.txt}.hst"
done
