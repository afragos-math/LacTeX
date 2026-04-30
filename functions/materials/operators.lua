local unchanged = {
    ['ETH']     = true,
    ['INT']     = true,
    ['IINT']    = true,
    ['IINT']    = true,
    ['IIINT']   = true,
    ['IIIINT']  = true,
    ['OINT']    = true,     --You pig
    ['OIINT']   = true,
    ['PROD']    = true,
    ['COPROD']  = true,
    ['SUM']     = true,
}

local function operators(word)
    if word == 'F/' then
        return ' \\frac'
    elseif word == 'F//' then
        return ' \\dfrac'
    elseif word == 'NAB' then
        return ' \\nabla'
    elseif word == 'PD' then
        return ' \\partial'
    elseif unchanged[word] then
        return ' \\' .. word:lower()
    end
end

return operators
