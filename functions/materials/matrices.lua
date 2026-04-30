local M = {}

    function M.begin_this(word)
        if word == 'MAT' then
            return ' \\begin{matrix}'
        elseif word == 'PMAT' then
            return ' \\begin{pmatrix}'
        elseif word == 'BMAT' then
           return ' \\begin{bmatrix}'
        elseif word == 'BBMAT' then
            return ' \\begin{Bmatrix}'
        elseif word == 'VMAT' then
            return ' \\begin{vmatrix}'
        elseif word == 'VVMAT' then
            return ' \\begin{Vmatrix}'
        end
    end

    function M.end_this(word)
        if word == 'MAT' then
            return '\\end{matrix}'
        elseif word == 'PMAT' then
            return '\\end{pmatrix}'
        elseif word == 'BMAT' then
            return '\\end{bmatrix}'
        elseif word == 'BBMAT' then
            return '\\end{Bmatrix}'
        elseif word == 'VMAT' then
            return '\\end{vmatrix}'
        elseif word == 'VVMAT' then
            return '\\end{Vmatrix}'
        end
    end

return M
