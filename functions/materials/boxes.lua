local M = {}

    function M.begin_this(word)
        if word == 'CONJ' then
            return '\\begin{conjecture}'
        elseif word == 'COR' then
            return '\\begin{corollary}'
        elseif word == 'DEF' then
            return '\\begin{definition}'
        elseif word == 'EXER' then
            return '\\begin{exercise}'
        elseif word == 'LEM' then
            return '\\begin{lemma}'
        elseif word == 'PROP' then
            return '\\begin{proposition}'
        elseif word == 'REM' then
            return '\\begin{remark}'
        elseif word == 'THM' then
            return '\\begin{theorem}'
        end
    end
    
    function M.end_this(word)
        if word == 'CONJ' then
            return '\\end{conjecture}'
        elseif word == 'COR' then
            return '\\end{corollary}'
        elseif word == 'DEF' then
            return '\\end{definition}'
        elseif word == 'EXER' then
            return '\\end{exercise}'
        elseif word == 'LEM' then
            return '\\end{lemma}'
        elseif word == 'PROP' then
            return '\\end{proposition}'
        elseif word == 'REM' then
            return '\\end{remark}'
        elseif word == 'THM' then
            return '\\end{theorem}'
        end
    end
    
return M
