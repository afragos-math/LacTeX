local function frakture(word)
    --\mathfrak{}
    if word == 'FRAK' then
        return ' \\mathfrak{'
    else
        return word .. '}'
    end
end

return frakture
