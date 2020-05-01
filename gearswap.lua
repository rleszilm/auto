require("logger")

-------------------------------------------------------------------------------
-- GearSwap API
-------------------------------------------------------------------------------
-- get_sets()
------------------------------------------------------------
function get_sets()
    init()
end

------------------------------------------------------------
-- pretarget
------------------------------------------------------------
function pretarget(spell)
    handle_action("pretarget", spell)
end

------------------------------------------------------------
-- precast
------------------------------------------------------------
function precast(spell, position)
    handle_action("precast", spell, position)
end

function auto_pre_precast(eventArgs, spell, position)
    eventArgs.equip = true
end

function auto_post_precast(eventArgs, spell, position)
    if eventArgs.cancel then
        return
    end
    
    state.busyUntil = "midcast"
end

------------------------------------------------------------
-- midcast
------------------------------------------------------------
function midcast(spell)
    handle_action("midcast", spell)
end

function auto_pre_midcast(eventArgs, spell)
    eventArgs.equip = true
end

function auto_post_midcast(eventArgs, spell)
    if spell.prefix == "/pet" and spell.type ~= "PetCommand" then
        state.busyUntil = "pet_aftercast"
    else
        state.busyUntil = "aftercast"
    end
end

------------------------------------------------------------
-- aftercast
------------------------------------------------------------
function aftercast(spell)
    handle_action("aftercast", spell)
end

function auto_pre_aftercast(eventArgs, spell)
    eventArgs.equip = true
end

function auto_post_aftercast(eventArgs, spell)
    if state.busyUntil then
        state.busyUntil = nil
    end
end

------------------------------------------------------------
-- status_change
------------------------------------------------------------
function status_change(new, old)
    handle_action("status_change", new, old)
end

function auto_pre_status_change(eventArgs, new, old)
    eventArgs.equip = true
end

------------------------------------------------------------
-- pet_change
------------------------------------------------------------
function pet_change(pet, gain)
    handle_action("pet_change", pet, gain)
end

function auto_pre_pet_change(eventArgs, pet, gain)
    eventArgs.equip = true
end

------------------------------------------------------------
-- pet_midcast
------------------------------------------------------------
function pet_midcast(spell)
    handle_action("pet_midcast", spell)
end

function auto_pre_pet_midcast(eventArgs, spell)
    eventArgs.equip = true
end

------------------------------------------------------------
-- pet_aftercast
------------------------------------------------------------
function pet_aftercast(spell)
    handle_action("pet_aftercast", spell)
end

function auto_pre_pet_aftercast(eventArgs, spell)
    eventArgs.equip = true
end

function auto_post_pet_aftercast(eventArgs, spell)
    if state.busyUntil == "pet_aftercast" then
        state.busyUntil = nil
    end
end

------------------------------------------------------------
-- pet_status_change
------------------------------------------------------------
function pet_status_change(new, old)
    handle_action("pet_status_change", new, old)
end

------------------------------------------------------------
-- filtered_action
------------------------------------------------------------
function filtered_action(spell)
    handle_action("filtered_action", spell)
end

------------------------------------------------------------
-- sub_job_change
------------------------------------------------------------
function sub_job_change(new, old)
    handle_action("sub_job_change", new, old)
end

------------------------------------------------------------
-- buff_change
------------------------------------------------------------
function buff_change(name, gain, buff_details)
    handle_action("buff_change", name, gain, buff_details)
end

function auto_buff_change(eventArgs, name, gain, buff_details)
    eventArgs.equip = true
end

------------------------------------------------------------
-- buff_refresh
------------------------------------------------------------
function buff_refresh(name, buff_details)
    handle_action("buff_refresh", name, buff_details)
end

------------------------------------------------------------
-- party_buff_change
------------------------------------------------------------
function party_buff_change(member, name, gain, buff)
    handle_action("party_buff_change", member, name, gain, buff)
end

------------------------------------------------------------
-- indi_change
------------------------------------------------------------
function indi_change(indi, gain)
    handle_action("indi_change", indi, gain)
end

------------------------------------------------------------
-- self_command
------------------------------------------------------------
-- see commands.lua

------------------------------------------------------------
-- refresh
------------------------------------------------------------
function auto_pre_refresh(eventArgs, spell)
    eventArgs.equip = true
end

------------------------------------------------------------
-- receiving
------------------------------------------------------------
-- non-gs action. Triggers when certain spell types are being cast directly on the player.
-- equips for the first spell being cast and lock gear selection until that spell is cast or interrupted.
function receiving(spell)
    handle_action("receiving", spell)
end

function auto_pre_receiving(eventArgs, spell)
    eventArgs.equip = true
    if state.busyUntil then
        eventArgs.handled = true
    end
end

function auto_post_receiving(eventArgs, spell)
    state.busyUntil = "receiving_aftercast"
end

------------------------------------------------------------
-- receiving_aftercast
------------------------------------------------------------
-- non-gs action. Triggers when certain spell types are being cast directly on the player.
-- equips for the first spell being cast and lock gear selection until that spell is cast or interrupted.
function receiving_aftercast(spell)
    handle_action("receiving_aftercast", spell)
end

function auto_pre_receiving_aftercast(eventArgs, spell)
    eventArgs.equip = true
end

function auto_post_receiving_aftercast(eventArgs, spell)
    if state.busyUntil == "receiving_aftercast" then
        state.busyUntil = nil
    end
end

------------------------------------------------------------
-- file_unload
------------------------------------------------------------
function file_unload(file_name)
    --TODO: Add logic
    state.binds:release()
end

-------------------------------------------------------------------------------
-- Action Handler
-------------------------------------------------------------------------------
function handle_action(action, ...)
    if state.busyUntil and state.busyUntil ~= action then
        --windower.add_to_chat(32, "Busy in ("..action..") waiting for - "..state.busyUntil)
        return
    end

    --windower.add_to_chat(32, "Handling "..action)

    local args = {...}
    local eventArgs = {
        action = action,
        equip = false,   -- whether gear should be equipped during the default phase
        handled = false, -- whether the action has been handled
        cancel = false   -- whether the spell should be cancelled
    }

    -- pass action to modules
    for _, module in pairs(state.modules) do
        if module[action] then
            module[action](module, eventArgs, unpack(args))            
        end
    end

    -- filter
    _ = _G["filter_"..action] and _G["filter_"..action](unpack(args))
    
    -- pre-equip logic
    call_foreach("pre_"..action, checkHandledCancel, eventArgs, unpack(args))
    if eventArgs.cancel then
        cancel_spell()
    end

    -- event logic
    call_foreach(action, checkHandledCancel, eventArgs, unpack(args))
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

-------------------------------------------------------------------------------
-- Equip handler
-------------------------------------------------------------------------------
function handle_equip(action, eventArgs, ...)
    local args = {...}
    local equipSet = {}

    if action == "pet_midcast" then
        -- pet_midcast is set during midcast
        return
    elseif action ~= "precast" and action ~= "midcast" and action ~= "receiving" then
        action = "by_status"
    end

    state.setPath:clear()

    -- walk the gearset tree to find base set
    equipSet = call_reduce("get_set_"..action, check_handled_cancel, equipSet, eventArgs, unpack(args))
    
    -- apply swaps
    equipSet = call_reduce("apply_swaps_"..action, check_handled_cancel, equipSet, eventArgs, unpack(args))
    
    -- equip gear
    display_set_path()

    equip(equipSet)
    state.setPath:clear()
    state.setSwaps:clear()
end

-------------------------------------------------------------------------------
-- Core
-------------------------------------------------------------------------------
phases = {"auto_", "user_", "job_"}

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
    local args = {...}
    for _, p in pairs(phases) do
        if (not continue or not continue(eventArgs)) and _G[p..fun] then
            acc = _G[p..fun](eventArgs, acc, unpack(args))
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
