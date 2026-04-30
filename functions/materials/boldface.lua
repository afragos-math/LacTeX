local function boldface(word)
    --\mathbb{}
    if word == 'BB' then
        return ' \\mathbb{'
    else
        return word .. '}'
    end
end

return boldface
