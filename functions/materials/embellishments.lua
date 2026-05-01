local unchanged = {
    ['ACUTE']       = true,
    ['BAR']         = true,
    ['BREVE']       = true,
    ['CHECK']       = true,
    ['DOT']         = true,
    ['DDOT']        = true,
    ['HAT']         = true,
    ['GRAVE']       = true,
    ['MATHRING']    = true,
    ['VEC']         = true,
}

local function embellishments(word)
    
    if word == 'WHAT' then
        return ' \\widehat'
    elseif word == 'TIL' then
        return ' \\tilde'
    elseif word == 'WTIL' then
        return ' \\widetilde'
    elseif word == 'UNDER_' then
        return ' \\underline'
    elseif word == 'OVER_' then
        return ' \\overline'
    elseif word == 'UNDER}' then
        return ' \\underbrace'
    elseif word == ' UNDER]' then
        return ' \\underbracket'
    elseif word == 'OVER}' then
        return ' \\overbrace'
    elseif word == 'OVER]' then
        return ' \\overbracket'
    elseif word == 'L<' then
        return ' \\langle'
    elseif word == 'R>' then
        return ' \\rangle'
    elseif word == '|_' then
        return  ' \\lfloor'
    elseif word == '_|' then
        return ' \\rfloor'
    elseif word == '|-' then
        return ' \\lceil'
    elseif word == '-|' then
        return ' \\rceil'
    elseif word == 'OVER->' then
        return ' \\overrightarrow'
    elseif word == 'OVER<-' then
        return  ' \\overleftarrow'
    elseif word == 'OVER<->' then
        return ' \\overleftrightarrow'
    elseif word == 'UNDER->' then
        return ' \\underrightarrow'
    elseif word == 'UNDER<-' then
        return ' \\underleftarrow'
    elseif word == 'UNDER<->' then
        return ' \\underleftrightarrow'
    elseif unchanged[word] then
        return ' \\' .. word:lower()
    end
    
end

return embellishments
