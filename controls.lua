return {
    tab_indent      = (' '):rep(4),         --How many spaces is your tab?
    math_indent     = (' '):rep(2),         --How many spaces signify math mode?
    dmath_indent    = (' '):rep(3),         --How many spaces signify display math mode?
    
    input_file      = 'input.txt',          --Which is your input file?
    output_file     = 'file.tex',           --Which is your output file?
    bib_file        = 'ref.bib',            --Which is your bib file? (Optional, '' for none)
    
    vers_default    = 'pdflatex',           --What should the default version be?
    bib_default     = 'plain',              --What is the bibliography style?
    
    execute_tex     = false,                --Do you want to compile .tex afterwards?
}
