local function script(word)
    --\mathcscr{}
    if word == 'SCR' then
        return ' \\mathscr{'
    else
        return word .. '}'
    end
end

return script
