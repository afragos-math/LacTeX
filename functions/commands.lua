local M = {}

    --Environments and alike

    function M.general(command, insertion, attributes)
        insertion = '{' .. insertion .. '}'
        
        --If attributes exist, \command[]{}, else \command{}
        if attributes and attributes ~= '' then
            attributes = '[' .. attributes .. ']'
            s = '\\' .. command .. attributes .. insertion .. '\n'
        else
            s = '\\' .. command .. insertion .. '\n'
        end
        
        return s
    end
    
    function M.begin_this(command)
        return '\\begin{' .. command .. '}'
    end
    
    function M.end_this(command)
        return '\\end{' .. command .. '}'
    end

return M
