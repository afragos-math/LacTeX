local function inbrace(word, environment)
    if word == 'LABEL' then
        return ' \\label{'
    elseif word == 'REF' then
        return ' \\ref{'
    elseif word == 'REFP' then
        return ' (\\ref{'    
    elseif word == 'BB' then
        return ' \\mathbb{'
    elseif word == 'BF' then
        return ' \\mathbf{'
    elseif word == 'CAL' then
        return ' \\mathcal{'
    elseif word == 'FRAK' then
        return ' \\mathfrak{'
    elseif word == 'RMN' then
        return ' \\mathrm{'
    elseif word == 'SCR' then
        return ' \\mathscr{'
    elseif environment == 'REFP' then
        return word .. '})'
    else
        return word .. '}'
    end
end

return inbrace
