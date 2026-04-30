local function calligraphy(word)
    --\mathcal{}
    if word == 'CAL' then
        return ' \\mathcal{'
    else
        return word .. '}'
    end
end

return calligraphy
