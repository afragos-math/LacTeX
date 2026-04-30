local function roman(word)
    --\mathrm{}
    if word == 'RMN' then
        return ' \\mathrm{'
    else
        return word .. '}'
    end
end

return roman
