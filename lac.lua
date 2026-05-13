--Require
local builder = require("functions.builder")
local commands = require("functions.commands")
local controls = require("controls")
local innit = require("functions.innit")
local split = require("functions.split")
local translate = require("functions.translate")

--Clear
local output = io.open(controls.output_file, "w")
output:write("")
output:close()

--Opening
local input = io.open(controls.input_file, "r")
output = io.open(controls.output_file, "a")

--Initialise

    --Not in the commands.general category
    local vers = ''
    local vers_found = false
    local class = ''
    local class_found = false

    
local modified_line = ''
local inserted_line = ''
local last_word = ''

local environments = {'PREDOC'}
local environment = ''

    --In the commands.general category
    local insertion = ''
    local attributes = ''

local custom = {}
    
local instart = false
local inmath = false
local incommand = false
local braceafter = true

    --Indices, of course
    local index_dmath = 0
    local index_math = 0

--Predoc environments
local predoc = {
    ['VERS']        = true,
    ['CLASS']       = true,
    ['INNIT']       = true,
    ['INPUT']       = true,
    ['PAC']         = true,
}

--Start the document, either with \begin{document} or without
local start = {
    ['START']   = true,
    ['START*']  = true,
}

--Generic environments
local env_generic = {
    ['BIBLIOGRAPHY']    = true,
    ['CENTER']          = true,
    ['TABULAR']         = true,
    ['FIGURE']          = true,
    ['FOOTNOTE']        = true,
    ['TIKZ']            = true,
    ['PROOF']           = true,
    ['CONJ']            = true,
    ['COR']             = true,
    ['DEF']             = true,
    ['ENUMERATE']       = true,
    ['EXER']            = true,
    ['ITEMIZE']         = true,
    ['LEM']             = true,
    ['PROP']            = true,
    ['REM']             = true,
    ['THM']             = true,
    ['MAT']             = true,
    ['PMAT']            = true,
    ['BMAT']            = true,
    ['BBMAT']           = true,
    ['VMAT']            = true,
    ['VVMAT']           = true,
}

--newcommand, renewcommand to be added later. 
local newcommand = {
    ['NEWCOMMAND']  = true,
}

local declmath = {
    ['DECLMATH']    = true,
    ['DECLMATH*']   = true,
}

--Titlepage
local titles = {
    ['TITLE']   = true,
    ['AUTHOR']  = true,
    ['AFFIL']   = true,
    ['DATE']    = true,
}

--Sections
local sections = {
    ['PART']            = true,
    ['CHAPTER']         = true,
    ['SECTION']         = true,
    ['SUBSECTION']      = true,
    ['SUBSUBSECTION']   = true,
}

--Environments that innitiate inmath
local env_inmath = {
    ['ALIGN']       = true,
    ['ALIGN*']      = true,
    ['EQU']         = true,
    ['EQU*']        = true,
}

--Calligraphic
local cal = {
    ['BB']      = true,
    ['BF']      = true,
    ['CAL']     = true,
    ['FRAK']    = true,
    ['RMN']     = true,
    ['SCR']     = true,
}

--Read all the lines of the input
for line in input:lines() do

    --Initialise
    modified_line = line
    modified_line = translate.tabs(modified_line)
    
    --All the math modes
    modified_line, index_dmath = translate.dmath(modified_line, index_dmath)
    modified_line, index_math = translate.math(modified_line, index_math)
    
    --Bring back the tabs
    modified_line = translate.tabs_back(modified_line)  --Right now, by choice, the tabs are not preserved in LaTeX. Maybe needs to be fixed later on.
    
    --Read each word in the line
    for word in split.this_line(modified_line) do
        
        --Last environment
        environment = environments[#environments]
        
        --Find vers, class, write all of the \input{} and \usepackage[]{}, innit
        
        --Version to os.execute
        if environment == 'VERS' then
            
            vers = word:lower()
            table.remove(environments)
            
            --Messaging
            vers_found = true
        
        --\documentclass[]{}
        elseif environment == 'CLASS' and (not class_found) then
            
            --Check if attribute exists or not and diplay appropriately
            if not word:match('%[(.-)%]') then
                if class ~= '' then
                    output:write(commands.general('documentclass', class, attributes))
                    attributes = ''
                    
                    --You don't need to parse it again, you silly goose
                    table.remove(environments)
                    class_found = true
                else
                    class = word:lower()
                end
            else
                attributes = word:match('%[(.-)%]')
            end
            
        --\input{}
        elseif environment == 'INPUT' then
            
            --Use default class if none found
            
            
            if insertion ~= '' then
                output:write(commands.general('input', insertion))
            end
            insertion = word
        
        --usepackage[]{}
        elseif environment == 'PAC' then
            
            --Check if attribute exists or not and diplay appropriately
            if not word:match('%[(.-)%]') then
                if insertion ~= '' then
                    output:write(commands.general('usepackage', insertion, attributes))
                    attributes = ''
                end
                insertion = word
            else
                attributes = word:match('%[(.-)%]')    
            end
            
        --Prepare theorem-like environments    
        elseif environment == 'INNIT' then
            
            if word == 'THMS' then
                output:write(innit.thms(class))
            end
        
        --Titles and related
        elseif titles[environment] then

            if word == 'TODAY' then
                insertion = '\\today'
            else
                insertion = word 
            end
            
            --Check if attribute exists or not and diplay appropriately
            if braceafter then
                
                if not word:match('%[(.-)%]') then
                    insertion = '{ ' .. insertion
                else
                    insertion = insertion .. '{'
                end
                output:write(insertion)
                braceafter = false
                
            else
                output:write( ' ' .. insertion)
            end
        
        end
        
        --A gazillion commands and Bob the builder
        if instart then
            
            --Instart environments
            
            --Math mode
            if word:match('\\begin{(.-)math}') then
                table.insert(environments, 'MATH')
                inmath = true
            elseif word:match('\\end{(.-)math}') then
                table.remove(environments)
                inmath = false
            
            --Text in math
            elseif word == 'TEXT' then
                table.insert(environments, 'TEXT')
                inmath = false
                
            --Subscript
            elseif word == '_' then
                if environment == 'SUB' then
                    table.remove(environments) 
                else
                    table.insert(environments, 'SUB')
                end
                
            --Superscript
            elseif word == '^' then
                if environment == 'SUP' then
                    table.remove(environments) 
                else
                    table.insert(environments, 'SUP')
                end
            
            --Generic environments
            elseif env_generic[word] then
                table.insert(environments, word)
            
            --Sections
            elseif sections[word] then
                braceafter = false
                table.insert(environments, word)
             
            --Generic \begin{} that innitiates inmath
            elseif env_inmath[word] then
                table.insert(environments, word)
                inmath = true
                
            --Calligraphy
            elseif cal[word] and (not cal[environment]) then
                table.insert(environments, word)
            elseif cal[environment] then
                table.remove(environments)
            
            --Italics and bold
            elseif word == '//' then
                if environment == 'EMPH' then
                    table.remove(environments)
                else
                    table.insert(environments, 'EMPH')
                end
            elseif word == '**' then
                if environment == 'BOLD' then
                    table.remove(environments)
                else
                    table.insert(environments, 'BOLD')
                end
            end
            
            --Bob the builder. Two seperate instances, in \newcommand and in start.
            if not incommand then
                inserted_line = inserted_line .. builder(word, environment, inmath, custom)
            else
                
                --If inmath, we are in the definition section
                if inmath then
                    output:write(builder(word, environment, inmath, custom))
                elseif word:match('%[(.-)%]') then
                    attributes = word
                elseif word == 'IS' then
                    inmath = true
                    
                    --Check for variables
                    if attributes == '' then
                        output:write('}{')
                    else
                        output:write('}' .. attributes .. '{')
                    end
                    
                else
                    custom[word] = true         --Keep a matrix with all of the commands, for the builder.
                    output:write('\\' .. word)
                end
            end
            
        end
        
        --Environments before start
        if predoc[word] then
            table.insert(environments, word)
            
        elseif start[word] then
            instart = true
            
            if word == 'START' then
                --Remove 'PREDOC'
                table.remove(environments)
                output:write('\n' .. commands.begin_this('document'))
            end
            
            table.insert(environments, 'DOCUMENT')
            
        --Related to the title page
        elseif titles[word] then
            table.insert(environments, word)
            output:write('\\' .. word:lower())
        
        --\newcommand or \renewcommand
        elseif newcommand[word] then
            incommand = true
            instart = true
        
            table.insert(environments, word)
            output:write('\\' .. word:lower() .. '{')
        
        --DECLMATH
        elseif word == 'DECLMATH' then
            incommand = true
            instart = true
            
            table.insert(environments, word)
            output:write('\\' .. 'DeclareMathOperator' .. '{')
            
        elseif word == 'DECLMATH*' then
            incommand = true
            instart = true
            
            table.insert(environments, word)
            output:write('\\' .. 'DeclareMathOperator*' .. '{')
            
        --Many 'END's
        elseif word == 'END' then
            --It did its job
            insertion = ''
            attributes= ''
            
            --Miscellaneous after 'END'
            if environment == 'TEXT' then
                inmath = true
            elseif env_inmath[environment] then
                inmath = false
            elseif newcommand[environment] or declmath[environment] then
                incommand = false
                instart = false
                inmath = false
                output:write('}\n')
            end
            
            --Remove it
            table.remove(environments)
            
            --\end{document}
            if not environments[1] then
                output:write('\\end{document}')
            end
        end
        
    last_word = word    
    end
    
    --Line skip instart
    if instart and inserted_line ~= '' then
        output:write(inserted_line .. '\n')
        inserted_line = ''
    elseif instart then
        output:write('\n')
    end
    
    --Sections end with line
    if sections[environment] and (not braceafter) then
        braceafter = true
        output:write(' }\n')
        table.remove(environments)
    end
        
    --Titles end with line
    if titles[last_word] then
        braceafter = true
        output:write('{}\n')
        table.remove(environments)
    elseif not braceafter then
        braceafter = true
        output:write(' }\n')
        table.remove(environments)
    end
    
end

output:close()
input:close()
    
if not vers_found then
    print('No version found, using default: ' .. controls.vers_default)
else
    print('Version found: ' .. vers)
end

--Messaging
print('LacTeX to LaTeX translation completed!')

--Execute
if controls.execute_tex then
    os.execute(vers .. ' ' .. controls.output_file)
end

