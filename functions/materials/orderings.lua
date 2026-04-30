local function orderings(word)
    if word == '<,=' then
        return ' \\leqslant'
    elseif word == '>,=' then
        return ' \\geqslant'
    elseif word == '<,~' then
        return ' \\lesssim'
    elseif word == '>,~' then
        return ' \\gtrsim'
    elseif word == '<,~~' then
        return ' \\lessapprox'
    elseif word == '>,~~' then
        return ' \\gtrapprox'
    elseif word == '<<' then
        return ' \\ll'
    elseif word == '>>' then
        return ' \\gg'
    elseif word == '==' then
        return ' \\equiv'
    elseif word == '~~' then
        return ' \\sim'
    elseif word == '~~~' then
        return ' \\approx'
    elseif word == '~=' then
        return ' \\simeq'
    elseif word == '~~=' then
        return ' \\cong'
    end
end

return orderings
