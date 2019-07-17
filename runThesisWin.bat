cd /d %~dp0
start /B Atom ./
latexmk -pdf -pvc
copy Oxford_Thesis.pdf temp_export.pdf
latexmk -c
del /f *.bbl
rename temp_export.pdf Oxford_Thesis.pdf

git add --all
git commit -m 'auto-commit'
git push
