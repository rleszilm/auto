-------------------------------------------------------------------------------
-- Core
-------------------------------------------------------------------------------
phases = {"auto", "user", "job"}


------------------------------------------------------------
-- call_foreach
------------------------------------------------------------
-- Calls all phases of a function implemented.
function call_foreach(fun, continue, eventArgs, ...)
    for _, p in pairs(phases) do
        if (not continue or continue(eventArgs)) and _G[p..fun] then
            _G[p..fun](eventArgs, unpack({...}))
        end
    end
end

------------------------------------------------------------
-- call_reduce
------------------------------------------------------------
-- Calls all phases of a function implemented.
function call_reduce(fun, continue, acc, eventArgs, ...)
    local mapping = {}
    for _, p in pairs(phases) do
        if (not continue or continue(eventArgs)) and _G[p..fun] then
            acc = _G[p..fun](eventArgs, acc, unpack({...}))
        end
    end
    return acc
end

------------------------------------------------------------
-- call_best
------------------------------------------------------------
-- Calls the only most specific version of a function implemented.
function call_best(fun, continue, eventArgs, ...)
    if continue and not continue(eventArgs) then
        return
    end
    
    local call
    for _, p in pairs(phases) do
        if _G[p..fun] then
            call = _G[p..fun]
        end
    end

    if call then
        return call(eventArgs, unpack({...}))
    end
end


------------------------------------------------------------
-- eventArg validators
------------------------------------------------------------
function check_handled(eventArgs)
    return eventArgs.handled and eventArgs.handled == true
end

function check_cancel(eventArgs)
    return eventArgs.cancel and eventArgs.cancel == true
end

function check_handled_cancel(eventArgs)
    return check_handled(eventArgs) or check_cancel(eventArgs)
end