--Commands
local commands = require("functions.commands")

--Greek
local characters = require("functions.materials.characters")

--Materials
local arrows = require("functions.materials.arrows")
local boldface = require("functions.materials.boldface")
local boldface_math = require("functions.materials.boldface_math")
local boxes = require("functions.materials.boxes")
local calligraphy = require("functions.materials.calligraphy")
local embellishments = require("functions.materials.embellishments")
local frakture = require("functions.materials.frakture")
local matrices = require("functions.materials.matrices")
local operators = require("functions.materials.operators")
local orderings = require("functions.materials.orderings")
local roman = require("functions.materials.roman")
local sets = require("functions.materials.sets")
local script = require("functions.materials.script")
local suscript = require("functions.materials.suscript")


--Initialise
local arrow = {
    ['<=']      = true,     --\Rightarrow
    ['=>']      = true,     --\Leftarrow
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
    ['TABULAR']     = true,
    ['FIGURE']      = true,
}

--Theorem-like environments
local box = {
    ['CONJ']    = true,     --Conjecture
    ['COR']     = true,     --Corrolary
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
    ['CHAPTER']         = true,     --Sections
    ['SECTION']         = true,
    ['SUBSECTION']      = true,
    ['SUBSUBSECTION']   = true,
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
    ['ARCSIN']          = true,     --Functions
    ['SIN']             = true,
    ['ARCCOS']          = true,
    ['COS']             = true,
    ['ARCTAN']          = true,
    ['TAN']             = true,
    ['ARCCOT']          = true,
    ['COT']             = true,
    ['ARCSEC']          = true,
    ['SEC']             = true,
    ['ARCSEC']          = true,
    ['CSC']             = true,
    ['SINH']            = true,
    ['COSH']            = true,
    ['TANH']            = true,
    ['COTH']            = true,
    ['MAX']             = true,
    ['MIN']             = true,
    ['SUP']             = true,
    ['INF']             = true,
    ['BOT']             = true,     --Misc
    ['BOX']             = true,
    ['CITE']            = true,
    ['HBAR']            = true,
    ['HFILL']           = true,
    ['ITEM']            = true,
    ['LABEL']           = true,
    ['LEFT']            = true,
    ['NONAME']          = true,
    ['QED']             = true,
    ['REF']             = true,
    ['RIGHT']           = true,
    ['SQUARE']          = true,
    ['TOP']             = true,
    ['TRIANGLE']        = true,
    ['VFILL']           = true,
}

local generic_end = {
    ['TEXT']    = true,
}

local punct = {
    ['.']   = true,     ['·']       = true,
    [';']   = true,     [':']       = true,
    [',']   = true,
    ['?']   = true,
    ['!']   = true,
    ['\'']  = true,
}


--Bob the builder.
local function builder(word, environment, inmath)

    --Initialise
    local bb = (word == 'BB' or environment == 'BB')
    local bf = (word == 'BF' or environment == 'BF')
    local cal = (word == 'CAL' or environment == 'CAL')
    local frak = (word == 'FRAK' or environment == 'FRAK')
    local rmn = (word == 'RMN' or environment == 'RMN')
    local scr = (word == 'SCR' or environment == 'SCR')
    
    --Sub and supscript
    if suscr[word] then
        return suscript(word, environment)
        
    --\begin{} generic
    elseif generic_begin_end_this[word] then
        return commands.begin_this(word:lower())
        
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
        
    --Calligraphy
    elseif bb then
        return boldface(word)
    elseif bf then
        return boldface_math(word)
        
    elseif cal then
        return calligraphy(word)
    
    elseif frak then
        return frakture(word)
        
    elseif rmn then
        return roman(word)
        
    elseif scr then
        return script(word)
    
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

        
    --Miscellaneous
    elseif word == '##' then
        return ' \\item'
    elseif word == 'GRAPHICS' then
        return ' \\includegraphics'
    elseif word == 'NOIN' then
        return ' \\noindent'
    elseif word == 'TXTW' then
        return ' \\textwidth'
    elseif word == 'LaTeX' then
        return ' \\LaTeX{}'
    elseif generic_standalone[word] then
        return '\\' .. word:lower()
        
    --'END'
    elseif word == 'END' then
        if generic_end[environment] then
            return ' }'
        elseif generic_begin_end_this[environment] then
            return commands.end_this(environment:lower())
        elseif environment == 'EQU' then
            return commands.end_this('equation')
        elseif environment == 'EQU*' then
            return commands.end_this('equation*')
        elseif matrix[environment] then
            return matrices.end_this(environment)
        elseif box[environment] then
            return boxes.end_this(environment)
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
