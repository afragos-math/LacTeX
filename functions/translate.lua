local controls = require("controls")

local M = {}

    function M.dmath(f, index_dmath)
        --Display math mode
        modified = f:gsub(controls.dmath_indent,
            function()
                index_dmath = (index_dmath + 1) % 2
            return (index_dmath == 1) and ' \\begin{displaymath} ' or ' \\end{displaymath}'
            end)
        return modified, index_dmath
    end

    function M.math(f, index_math)
        --Regular math mode
        modified = f:gsub(controls.math_indent,
            function()
            index_math = (index_math + 1) % 2
            return (index_math == 1) and ' \\begin{math} ' or ' \\end{math}'
            end)
        return modified, index_math
    end

    function M.tabs(f)
        --Detect tabs
        modified = f:gsub(controls.tab_indent, '|TISP|')
        return modified
    end

    function M.tabs_back(f)
        --Bring tab spaces back
        modified = f:gsub('|TISP|', controls.tab_indent)
        return modified
    end

return M
