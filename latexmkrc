$pdf_previewer = 'open -a Skim';
$cleanup_includes_generated = [1];
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode';
@generated_exts = (@generated_exts, 'synctex.gz');
