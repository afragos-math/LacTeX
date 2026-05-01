local unchanged = {
    ['ALEPH']   = true,
    ['CUP']     = true,
    ['CAP']     = true,
    ['DASHV']   = true,
    ['FORALL']  = true,
    ['EXISTS']  = true,
    ['IN']      = true,
    ['MID']     = true,
    ['MODELS']  = true,
    ['NI']      = true,
    ['NOT']     = true,
    ['NEG']     = true,
    ['NEQ']     = true,
    ['OPLUS']   = true,
    ['OTIMES']  = true,
    ['PERP']    = true,
    ['TIMES']   = true,
    ['VDASH']   = true,
}

local function sets(word)
    if word == '\\' then
        return ' \\backslash'
    elseif word == '/0' then
        return ' \\emptyset'
    elseif word == 'oo' then
        return ' \\infty'
    elseif word == 'SBS' then
        return ' \\subset'
    elseif word == 'SPS' then
        return ' \\supset'
    elseif word == 'SBS=' then
        return  ' \\subseteq'
    elseif word == 'SPS=' then
        return ' \\supseteq'
    elseif word == 'BCAP' then
        return ' \\bigcap'
    elseif word == 'BCUP' then
        return ' \\bigcup'
    elseif word == 'OR' then
        return ' \\lor'
    elseif word == 'AND' then
        return ' \\land'
    elseif word == '|N' then
        return ' \\mathbb{N}'
    elseif word == '|Z' then
        return ' \\mathbb{Z}'
    elseif word == '|Q' then
        return ' \\mathbb{Q}'
    elseif word == '|A' then
        return ' \\mathbb{A}'
    elseif word == '|R' then
        return ' \\mathbb{R}'
    elseif word == '|C' then
        return ' \\mathbb{C}'
    elseif word == '|H' then
        return ' \\mathbb{H}'
    elseif word == '|S' then
        return ' \\mathbb{S}'
    elseif word == 'IM' then
        return ' \\Im'
    elseif word == 'RE' then
        return ' \\Re'
    elseif unchanged[word] then
        return ' \\' .. word:lower()
    end
end

return sets
