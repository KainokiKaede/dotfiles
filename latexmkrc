# Mostly from http://kwakita.wordpress.com/2014/04/01/my-latexmkrc-setting/
@default_files = ('main.tex');
$tmpdir = '/tmp';
$latexargs          = '-shell-escape -synctex=1';
$latexsilentargs    = $latexargs . ' -interaction=batchmode';
$latex            = 'uplatex ' . $latexargs;
$latex_silent     = 'uplatex ' . $latexsilentargs;
# $latex  = 'platex -src-specials -file-line-error -kanji=utf8 -interaction=nonstopmode';  # My original settings.
# $latex            = 'platex ' . $latexargs;
# $latex_silent     = 'platex ' . $latexsilentargs;
# $dvipdf = 'dvipdfmx -f ~/Dropbox/dotfiles/bin/hiraginoEmbed.map %O -o %D %S';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$dvips  = 'pdvips';
# $bibtex           = 'bibtex';
$bibtex           = 'pbibtex';
$biber            = 'biber --bblencoding=utf8 -u -U --output_safechars';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode         = 3; # 0: no PDF, 1: pdflatex, 2: ps2pdf, 3: dvipdfmx
$aux_dir          = 'texoutput';
$out_dir          = $aux_dir;
$pvc_view_file_via_temporary = 0;  # Overwrite, don't delete present PDF file.
$pdf_previewer = 'open -ga /Applications/Skim.app';
