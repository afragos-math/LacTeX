local M = {}

    function M.this_line(f)
        splited_f = f:gmatch("%S+")
        return splited_f
    end

return M
