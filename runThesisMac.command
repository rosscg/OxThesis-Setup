#!/bin/bash

cd "${BASH_SOURCE%/*}/"

git pull

open -a Atom.app ./;
latexmk -pdf -pvc;
cp Oxford_Thesis.pdf temp_export.pdf;
latexmk -c;
mv temp_export.pdf Oxford_Thesis.pdf;
rm *.bbl;

git add --all;
git commit -m "auto-commit `date`";
git push;
