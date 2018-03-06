$pdf_mode = 1; # use pdflatex
$pdflatex = 'pdflatex -file-line-error --shell-escape %O %S';
$pdf_previewer = 'okular %O %S';
@default_excluded_files = ( "conclusions.tex", "defs.tex", "denotations.tex", "tasks.tex", "tikzsetup.tex", "titul.tex" );

# vim: ft=perl
