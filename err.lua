local errors = false
    
local function err(index_dmath, index_math, last_environment, environment)

    if index_dmath == 1 then
        print('/!\\ Missing starting or ending display math')
        errors = true
    end
    
    if index_math == 1 then
        print('/!\\ Missing starting or ending math')
        errors = true
    end
    
    if not ( environment == nil or environment == 'DOCUMENT*' ) then
       print('/!\\ Missing END. Last open environment was ' .. last_environment)
       if environment == 'PREDOC' then
            print('/!\\ Possible issue in the Preable')
       end
       errors = true
    end
    
    if not (last_environment or environment) then
        print('/!\\ Extra END')
        errors = true
    end
        
    return errors
    
end

return err
