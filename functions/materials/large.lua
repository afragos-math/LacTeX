local unchanged = {
    ['TINY']            = true,
    ['SCRIPTSIZE']      = true,
    ['FOOTNOTESIZE']    = true,
    ['SMALL']           = true,
    ['NORMALIZE']       = true,
    ['LARGE']           = true,
    ['HUGE']            = true,
}

local function large(word)
    if word == 'LLARGE' then
        return ' \\Large'
    elseif word == 'LLLARGE' then
        return ' \\LARGE'
    elseif word == 'HHUGE' then
        return ' \\Huge'
    elseif unchanged[word] then
        return ' \\' .. word:lower()
    end
end

return large
