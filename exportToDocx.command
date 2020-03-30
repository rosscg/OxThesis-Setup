#!/bin/bash

cd "${BASH_SOURCE%/*}/"
pandoc Oxford_Thesis.tex --bibliography=bib/library.bib -o Oxford_Thesis.docx
