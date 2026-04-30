function suscript(word, environment)

    --Subscript
    if word == '_' then
        if environment == 'SUB' then
            s = '}'
        else
            s = '_{'
        end
    
    --Supscript
    elseif word == '^' then
        if environment == 'SUP' then
            s = '}'
        else
            s = '^{'
        end
    end
    
    return s
end

return suscript
