local function boldface_math(word)
    --\mathbf{}
    if word == 'BF' then
        return ' \\mathbf{'
    else
        return word .. '}'
    end
end

return boldface_math
