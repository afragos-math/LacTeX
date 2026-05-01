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

local environments = {'PREDOC'}
local environment = ''

    --In the commands.general category
    local insertion = ''
    local attributes = ''

local instart = false
local inmath = false

    --Indices, of course
    local index_dmath = 0
    local index_math = 0

--Predoc environments
local predoc = {
    ['VERS']    = true,
    ['CLASS']   = true,
    ['INNIT']   = true,
    ['INPUT']   = true,
    ['PAC']     = true,
}

--Generic environments
local env_generic = {
    ['CENTER']      = true,
    ['TABULAR']     = true,
    ['FIGURE']      = true,
    ['CONJ']        = true,
    ['COR']         = true,
    ['DEF']         = true,
    ['ENUMERATE']   = true,
    ['EXER']        = true,
    ['ITEMIZE']     = true,
    ['LEM']         = true,
    ['PROP']        = true,
    ['REM']         = true,
    ['THM']         = true,
    ['MAT']         = true,
    ['PMAT']        = true,
    ['BMAT']        = true,
    ['BBMAT']       = true,
    ['VMAT']        = true,
    ['VVMAT']       = true,
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
        elseif environment == 'CLASS' then
            
            --Check if attribute exists or not and diplay appropriately
            if not word:match('%[(.-)%]') then
                if class ~= '' then
                    output:write(commands.general('documentclass', class, attributes))
                    attributes = ''
                    
                    --You don't need to parse it again, you silly goose
                    table.remove(environments)
                    
                    --Messaging
                    class_found = true
                    print('Class found: ' .. class)
                end
                class = word:lower()
            else
                attributes = word:match('%[(.-)%]')
            end
        
        --\input{}
        elseif environment == 'INPUT' then
            
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
            
        elseif environment == 'INNIT' then
            
            --Prepare theorem-like environments
            if word == 'THMS' then
                output:write(innit.thms())
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
            
            
            --Bob the builder
            inserted_line = inserted_line .. builder(word, environment, inmath)
        end
        
        --Environments before start
        if predoc[word] then
            table.insert(environments, word)
        elseif word == 'START' then
            instart = true
            
            --Remove 'PREDOC'
            table.remove(environments)
            
            table.insert(environments, 'DOCUMENT')
            output:write('\n' .. commands.begin_this('document'))

        --Many 'END's
        elseif word == 'END' then
            --It did its job
            insertion = ''
            
            --Miscellaneous after 'END'
            if environment == 'TEXT' then
                inmath = true
            elseif env_inmath[environment] then
                inmath = false
            end
            
            --Remove it
            table.remove(environments)
            
            --\end{document}
            if not environments[1] then
                output:write('\\end{document}')
            end
        end
        
    end
    
    if instart and inserted_line ~= '' then
        output:write(inserted_line .. '\n')
        inserted_line = ''
    elseif instart then
        output:write('\n')
    end
    
end

output:close()
input:close()

if not class_found then
    print('No class found, using default: ' .. controls.class_default)
end
    
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

