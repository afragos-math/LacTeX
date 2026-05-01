local function arrows(word)
    if word == '<=' then
        return ' \\Leftarrow'
    elseif word == '<-' then
        return ' \\leftarrow'    
    elseif word == '=>' then
        return ' \\Rightarrow'
    elseif word == '->' then
        return ' \\rightarrow'
    elseif word == '<=>' then
        return ' \\Leftrightarrow'
    elseif word == '<->' then
        return ' \\leftrightarrow'
    elseif word == '/>' then
        return ' \\nearrow'
    elseif word == '<\\' then
        return ' \\nwarrow'
    elseif word == '\\>' then
        return ' \\searrow'
    elseif word == '</' then
        return ' \\swarrow'
    elseif word == '|^' then
        return ' \\uparrow'
    elseif word == '|v' then
        return ' \\downarrow'
    elseif word == '|^v'
        return ' \\updownarrow'
    elseif word == '||^' then
        return ' \\Uparrow'
    elseif word == '||v' then
        return ' \\Downarrow'
    elseif word == '||^v' then
        return ' \\Updownarrow'
    elseif word == '->->' then
        return ' \\rightrightarrows'
    elseif word == '<-<-' then
        return ' \\leftleftarrows'
    elseif word == '|->' then
        return ' \\mapsto'
    elseif word == '->/2' then
        return  ' \\rightharpoonup'
    elseif word == '<-/2' then
        return ' \\leftharpoonup'
    elseif word == 'c->' then
        return ' \\hookrightarrow'
    elseif word == '<-c' then
        return ' \\hookleftarrow'
    elseif word == '>->' then
        return ' \\rightarrowtail'
    elseif word == '<-<' then
        return ' \\leftarrowtail'
    elseif word == '->>' then
        return ' \\twoheadrightarrow'
    elseif word == '<<-' then
        return ' \\twoheadleftarrow'
    elseif word == 'x->' then
        return ' \\xrightarrow'
    elseif word == '<-x' then
        return ' \\xleftarrow'
    elseif word == 'x<->' then
        return ' \\xleftrightarrow'
    elseif word == 'x=>' then
        return ' \\xRightarrow'
    elseif word == '<=x' then
        return ' \\xLeftarrow'
    elseif word == 'x<=>' then
        return ' \\xLeftrightarrow'
    end
end

return arrows
