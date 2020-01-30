-------------------------------------------------------------------------------
-- Core
-------------------------------------------------------------------------------
function handle_action(action, ...)
    local args = {...}
    local eventArgs = {
        equip = false,   -- whether gear should be equipped during the default phase
        handled = false, -- whether the action has been handled
        cancel = false   -- whether the spell should be cancelled
    }

    -- filter
    _ = _G["filter_"..action] and _G["filter_"..action](unpack(args))
    
    -- pre-equip logic
    call_foreach("pre_"..action, checkHandledCancel, eventArgs, unpack(args))
    if eventArgs.cancel then
        cancel_spell()
    end
    
    -- equip gear
    if eventArgs.equip and not eventArgs.cancel and not eventArgs.handled then
        handle_equip(action, eventArgs, unpack(args))
    end
    
    -- post-equip logic
    call_foreach("post_"..action, checkCancel, eventArgs, unpack(args))
    if eventArgs.cancel then
        cancel_spell()
    end

    -- cleanup
    _ = _G["cleanup_"..action] and _G["cleanup_"..action](unpack(args))
end