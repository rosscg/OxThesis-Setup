$pdf_previewer = 'open -a Skim';
$pdf_previewer = 'start gsview64';
$cleanup_includes_generated = [1];
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode';
@generated_exts = (@generated_exts, 'synctex.gz');
