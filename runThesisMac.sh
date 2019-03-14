cd "${BASH_SOURCE%/*}/"
open -a Atom.app ./;
latexmk -pdf -pvc;
cp Oxford_Thesis.pdf temp_export.pdf;
latexmk -c;
rm *.bbl;
mv temp_export.pdf Oxford_Thesis.pdf;

#git add --all;
#git commit -m 'auto-commit';
#git push;
