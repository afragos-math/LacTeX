--Commands
local commands = require("functions.commands")

--Greek
local characters = require("functions.materials.characters")

--Materials
local arrows = require("functions.materials.arrows")
local boxes = require("functions.materials.boxes")
local embellishments = require("functions.materials.embellishments")
local inbrace = require("functions.materials.inbrace")
local large = require("functions.materials.large")
local matrices = require("functions.materials.matrices")
local operators = require("functions.materials.operators")
local orderings = require("functions.materials.orderings")
local sets = require("functions.materials.sets")
local suscript = require("functions.materials.suscript")


--Initialise
local arrow = {
    ['<=']      = true,     --\Leftarrow
    ['=>']      = true,     --\Rightarrow
    ['<-']      = true,     --\leftarrow
    ['->']      = true,     --\rightarrow
    ['<=>']     = true,     --\Leftrightarrow
    ['<->']     = true,     --\leftrightarrow
    ['<\\']     = true,     --\nwarrow
    ['/>']      = true,     --\nearrow
    ['</']      = true,     --\swarrow
    ['\\>']     = true,     --\searrow
    ['|^']      = true,     --uparrow
    ['|v']      = true,     --\downarrow
    ['|^v']     = true,     --\updownarrow
    ['||^']     = true,     --\Uparrow
    ['||v']     = true,     --\Downarrow
    ['||^v']    = true,     --\Updownarrow
    ['->->']    = true,     --\rightrightarrows
    ['<-<-']    = true,     --\leftleftarrows
    ['|->']     = true,     --\mapsto
    ['->/2']    = true,     --\rightharpoonup
    ['<-/2']    = true,     --\leftharpoonup
    ['c->']     = true,     --\hookrightarrow
    ['<-c']     = true,     --\hookleftarrow
    ['>->']     = true,     --\rightarrowtail
    ['<-<']     = true,     --\leftarrowtail
    ['->>']     = true,     --\twoheadrightarrow
    ['<<-']     = true,     --\twoheadleftarrow
    ['x->']     = true,     --\xrightarrow
    ['<-x']     = true,     --\xleftarrow
    ['x<->']    = true,     --\xleftrightarrow
    ['x=>' ]    = true,     --\xRightarrow
    ['<=x']     = true,     --\xLeftarrow
    ['x<=>']    = true,     --\xLeftrightarrow
}

local operator = {
    ['F/']      = true,     --\frac
    ['F//']     = true,     --\dfrac
    ['ETH']     = true,     --\eth
    ['NAB']     = true,     --\nabla
    ['INT']     = true,     --\int
    ['IINT']    = true,     --\iint
    ['IIINT']   = true,     --\iiint
    ['IIIINT']  = true,     --\iiiint
    ['OINT']    = true,     --\oint
    ['OIINT']   = true,     --\oiint
    ['PD']      = true,     --\partial
    ['PROD']    = true,     --\prod
    ['COPROD']  = true,     --\coprod
    ['SUM']     = true,     --\sum
    ['|E']      = true,     --\mathbb{E}
    ['|P']      = true,     --\mathbb{P}
    ['|V']      = true,     --\mathbb{V}
}

local suscr = {
    ['_']   = true,
    ['^']   = true,
}

local order = {
    ['<,=']     = true,     --\leqslant
    ['>,=']     = true,     --\geqslant
    ['<,~']     = true,     --\lesssim
    ['>,~']     = true,     --\gtrsim
    ['>,~~']    = true,     --\gtrpprox
    ['<.~~']    = true,     --\lessapprox
    ['<<']      = true,     --\ll
    ['>>']      = true,     --\gg
    ['==']      = true,     --\equiv
    ['~~']      = true,     --\sim
    ['~~~']     = true,     --\approx
    ['~=']      = true,     --\simeq
    ['~~=']     = true,     --\cong
    ['/=']      = true,     --\neq
}


local set = {
    ['ALEPH']   = true,     --\aleph
    ['IN']      = true,     --\ni
    ['NI']      = true,     --\ni
    ['MID']     = true,     --\mid
    ['MODELS']  = true,     --\models
    ['NEQ']     = true,     --\neq
    ['NEG']     = true,     --neg
    ['FORALL']  = true,     --\forall
    ['EXISTS']  = true,     --\exists
    ['OPLUS']   = true,     --\oplus
    ['OTIMES']  = true,     --\otimes
    ['PERP']    = true,     --\perp
    ['VDASH']   = true,     --\vdash
    ['DASHV']   = true,     --\dashv
    ['SBS']     = true,     --\subset
    ['SPS']     = true,     --\supset
    ['SBS=']    = true,     --\subseteq
    ['SPS=']    = true,     --supseteq
    ['\\']      = true,     --\backslash
    ['/0']      = true,     --\emptyset
    ['oo']      = true,     --\infty
    ['CAP']     = true,     --\cap
    ['CUP']     = true,     --\cup
    ['BCAP']    = true,     --\bigcap
    ['BCUP']    = true,     --\bigcup    
    ['OR']      = true,     --\lor
    ['AND']     = true,     --\land
    ['NOT']     = true,     --\not
    ['TIMES']   = true,     --\times
    ['|N']      = true,     --\mathbb{N}
    ['|Z']      = true,     --\mathbb{Z}
    ['|Q']      = true,     --\mathbb{Q}
    ['|A']      = true,     --\mathbb{A}
    ['|R']      = true,     --\mathbb{R}
    ['|C']      = true,     --\mathbb{C}
    ['|H']      = true,     --\mathbb{H}
    ['|S']      = true,     --\mathbb{S}
    ['IM']      = true,     --\Im
    ['RE']      = true,     --\Re
}

--Same name as in LaTeX
local generic_begin_end_this = {
    ['ALIGN']       = true,
    ['ALIGN*']      = true,
    ['CENTER']      = true,
    ['ENUMERATE']   = true,
    ['ITEMIZE']     = true,
    ['PROOF']       = true,
    ['TABULAR']     = true,
    ['FIGURE']      = true,
}

local env_line_end = {
    ['CHAPTER']         = true,
    ['SECTION']         = true,
    ['SUBSECTION']      = true,
    ['SUBSUBSECTION']   = true,
    ['PART']            = true,
    ['CAPTION']         = true,
}

local bigger = {
    ['TINY']            = true,
    ['SCRIPTSIZE']      = true,
    ['FOOTNOTESIZE']    = true,
    ['SMALL']           = true,
    ['NORMALSIZE']      = true,
    ['LARGE']           = true,
    ['LLARGE']          = true,
    ['LLLARGE']         = true,
    ['HUGE']            = true,
    ['HHUGE']           = true,
}

local simplest_begin = {
    ['FOOTNOTE']    = true,
}

--Inbrace environments
local inbraces = {
    ['LABEL']   = true,
    ['REF']     = true,
    ['REFP']     = true,
    ['BB']      = true,
    ['BF']      = true,
    ['CAL']     = true,
    ['FRAK']    = true,
    ['RMN']     = true,
    ['SCR']     = true,
}

--Theorem-like environments
local box = {
    ['CONJ']    = true,     --Conjecture
    ['COR']     = true,     --Corollary
    ['DEF']     = true,     --Definition
    ['EXER']    = true,     --Exercise
    ['LEM']     = true,     --Lemma
    ['PROP']    = true,     --Proposition
    ['REM']     = true,     --Remark
    ['THM']     = true,     --Theorem
}

local matrix = {
    ['MAT']     = true,     --matrix
    ['PMAT']    = true,     --pmatrix
    ['BMAT']    = true,     --bmatrix
    ['BBMAT']   = true,     --Bmatrix
    ['VMAT']    = true,     --vmatrix
    ['VVMAT']   = true,     --Vmatrix
}

local embellishment = {
    ['ACUTE']       = true,     --\acute
    ['BAR']         = true,     --\bar
    ['BREVE']       = true,     --\breve
    ['CHECK']       = true,     --\check
    ['DOT']         = true,     --\dot
    ['DDOT']        = true,     --\ddot
    ['HAT']         = true,     --hat
    ['GRAVE']       = true,     --grave
    ['MATHRING']    = true,     --\mathring
    ['VEC']         = true,     --\vec
    ['WHAT']        = true,     --\widehat
    ['TIL']         = true,     --\tilde
    ['WTIL']        = true,     --\widetilde
    ['UNDER_']      = true,     --\underline
    ['OVER_']       = true,     --\overline
    ['UNDER}']      = true,     --\underbrace
    ['UNDER]']      = true,     --\underbracket
    ['OVER}']       = true,     --\overbrace
    ['OVER]']       = true,     --\overbracket
    ['L<']          = true,     --\langle
    ['R>']          = true,     --\rangle
    ['|_']          = true,     --\lfloor
    ['_|']          = true,     --\rfloor
    ['|-']          = true,     --\lceil
    ['-|']          = true,     --\rceil
    ['UNDER->']     = true,     --\underrigtarrow
    ['UNDER<-']     = true,     --\underleftarrow
    ['OVER->']      = true,     --\overrightarrow
    ['OVER<-']      = true,     --\overleftarrow
    ['UNDER<->']    = true,     --\underleftrightarrow
    ['OVER<->']     = true,     --\overleftrightarrow
}

--Same name as in LaTeX and standalone
local generic_standalone = {
    ['CDOTS']           = true,     --Dots
    ['DDOTS']           = true,
    ['LDOTS']           = true,
    ['VDOTS']           = true,
    ['ELL']             = true,     --Characters
    ['FLAT']            = true,
    ['SHARP']           = true,
    ['MP']              = true,
    ['NATURAL']         = true,
    ['NPARALLEL']       = true,
    ['PM']              = true,
    ['HREF']            = true,     --Environments
    ['MAKETITLE']       = true,
    ['TABLEOFCONTENTS'] = true,
    ['ARCSIN']          = true,     --Functions
    ['SIN']             = true,
    ['ARCCOS']          = true,
    ['COS']             = true,
    ['ARCTAN']          = true,
    ['TAN']             = true,
    ['COT']             = true,
    ['SEC']             = true,
    ['CSC']             = true,
    ['SINH']            = true,
    ['COSH']            = true,
    ['TANH']            = true,
    ['COTH']            = true,
    ['MAX']             = true,
    ['MIN']             = true,
    ['SUP']             = true,
    ['INF']             = true,
    ['SQRT']            = true,
    ['ADDCONTENTSLINE'] = true,     --Misc
    ['APPENDIX']        = true,
    ['APPENDIXPAGE']    = true,
    ['BOT']             = true,
    ['BOX']             = true,
    ['CENTERING']       = true,
    ['COLOR']           = true,
    ['CITE']            = true,
    ['HBAR']            = true,
    ['HFILL']           = true,
    ['ITEM']            = true,
    ['LEFT']            = true,
    ['NEWPAGE']         = true,
    ['NONUMBER']        = true,
    ['QED']             = true,
    ['RIGHT']           = true,
    ['SQUARE']          = true,
    ['THISPAGESTYLE']   = true,
    ['TOP']             = true,
    ['TRIANGLE']        = true,
    ['VFILL']           = true,
}

local generic_end = {
    ['FOOTNOTE']    = true,
    ['SCAPS']       = true,
    ['TEXT']        = true,
}

local punct = {
    ['.']   = true,     ['·']       = true,
    [';']   = true,     [':']       = true,
    [',']   = true,
    ['?']   = true,
    ['!']   = true,
    ['\'']  = true,
    [')']   = true,
}


--Bob the builder.
local function builder(word, environment, inmath, custom)

    --Initialise
    local ininput = (word == 'INPUT' or environment == 'INPUT')
        
    --Sub and supscript
    if ininput then
        return ''
        
    elseif suscr[word] then
        return suscript(word, environment)
        
    --\begin{} generic
    elseif generic_begin_end_this[word] then
        return commands.begin_this(word:lower())
    
    --Commands that begin as \command{...} and have been implemented as 'COMMAND ... END'
    elseif simplest_begin[word] then
        return ' \\' .. word:lower() .. '{'
     
    --Sections
    elseif env_line_end[word] then
        return '\\' .. word:lower() .. '{'
    
    --Bibliography
    elseif word == 'BIBLIOGRAPHY' then
        return '\\begin{thebibliography}'
    
    --\begin{equation} and *
    elseif word == 'EQU' then
        return commands.begin_this('equation')
    elseif word == 'EQU*' then
        return commands.begin_this('equation*')
        
    --Theorem-like environments
    elseif box[word] then
        return boxes.begin_this(word)
        
    --Matrices
    elseif matrix[word] then
        return matrices.begin_this(word)
        
    --Inbrace environments (such as calligraphy)
    elseif inbraces[word] or inbraces[environment] then
        return inbrace(word, environment)
    
    --Italics and bold
    elseif word == '//' then
        if environment == 'EMPH' then
            s = '}'
        else
            s = '\\emph{'
        end
        
        return s
        
    elseif word == '**' then
        if environment == 'BOLD' then
            s = '}'
        else
            s = '\\textbf{'
        end
        
        return s
    
    --Larger
    elseif bigger[word] then
        return large(word)
    
    --Sets
    elseif set[word] then
        return sets(word)
    
    --Order
    elseif order[word] then
        return orderings(word)
        
    --Arrows
    elseif arrow[word] then
        return arrows(word)
        
    --Operators
    elseif operator[word] then
        return operators(word)
    
    --Text in math
    elseif word == 'TEXT' then
        return '\\text{ '
        
    --Embellishments
    elseif embellishment[word] then
        return embellishments(word)
    
    --Indentation and related
    elseif word == 'SKIP' then
        return '\\medskip'
    
    --Figures
    elseif word == 'GRAPHICS' then
        return ' \\includegraphics'
    elseif word == 'TIKZ' then
        return commands.begin_this('tikzpicture')
    
    --Custom
    elseif custom[word] then
        return ' \\' .. word
        
    --Miscellaneous
    elseif word == '##' then
        if environment ~= 'BIBLIOGRAPHY' then
            return ' \\item'
        else
            return ' \\bibitem'
        end
    elseif word == 'NOIN' then
        return ' \\noindent'
    elseif word == 'REDIR' then
        return ' \\hyperref'
    elseif word == 'TXTW' then
        return ' \\textwidth'
    elseif word == 'SCAPS' then
        return ' \\textsc{'
    elseif word == 'LaTeX' then
        return ' \\LaTeX{}'
    elseif generic_standalone[word] then
        return ' \\' .. word:lower()
        
    --'END'
    elseif word == 'END' then
        if generic_end[environment] then
            return '}'
        elseif generic_begin_end_this[environment] then
            return commands.end_this(environment:lower())
        elseif environment == 'EQU' then
            return commands.end_this('equation')
        elseif environment == 'EQU*' then
            return commands.end_this('equation*')
        elseif environment == 'TIKZ' then
            return commands.end_this('tikzpicture')
        elseif matrix[environment] then
            return matrices.end_this(environment)
        elseif box[environment] then
            return boxes.end_this(environment)
        elseif environment == 'BIBLIOGRAPHY' then
            return '\\end{thebibliography}'
        else
           return '' 
        end
        
    --Plain, regular words    
    else
        --Greek and miscellaneous math mode characters
        if inmath then
            return characters(word)
        else
            
            --If \end{math} is followed by punctuation, do not leave a space
            if word:match('\\end{math}') then
                if not punct[word:sub(11,11)] then
                    return ' \\end{math} ' .. word:sub(11)
                else
                    return word
                end
                
            --Regular words
            else
                
                --Check punctuation
                if punct[word:sub(1,1)] then
                    return word
                else
                    return ' ' .. word
                end
            end
        end
    end
    
end

return builder
