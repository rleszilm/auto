-------------------------------------------------------------------------------
-- GearSwap API
-------------------------------------------------------------------------------
-- get_sets()
------------------------------------------------------------
function get_sets()
    windower.add_to_chat(12, "user has not overridden get_sets")
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

function auto_pre_precast(spell, position, eventArgs)
    eventArgs.equip = true
end

------------------------------------------------------------
-- midcast
------------------------------------------------------------
function midcast(spell)
    handle_action("midcast", spell)
end

function auto_pre_midcast(spell, eventArgs)
    eventArgs.equip = true
end

------------------------------------------------------------
-- aftercast
------------------------------------------------------------
function aftercast(spell)
    handle_action("aftercast", spell)
end

function auto_pre_aftercast(spell, eventArgs)
    eventArgs.equip = true
end

------------------------------------------------------------
-- status_change
------------------------------------------------------------
function status_change(new, old)
    handle_action("status_change", new, old)
end

------------------------------------------------------------
-- pet_change
------------------------------------------------------------
function pet_change(pet, gain)
    handle_action("pet_change", pet, gain)
end

------------------------------------------------------------
-- pet_midcast
------------------------------------------------------------
function pet_midcast(spell)
    handle_action("pet_midcast", spell)
end

------------------------------------------------------------
-- pet_aftercast
------------------------------------------------------------
function pet_aftercast(spell)
    handle_action("pet_aftercast", spell)
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
-- file_unload
------------------------------------------------------------
function file_unload(file_name)
    handle_action("file_unload", indi, gain)
end

-------------------------------------------------------------------------------
-- handle_action
-------------------------------------------------------------------------------
function handle_action(action, ...)
    local args = {...}
    local eventArgs = {
        equip = false,   -- whether gear should be equipped during the default phase
        handled = false, -- whether the action has been handled
        cancel = false   -- whether the spell should be cancelled
    }
    args[#args + 1] = eventArgs

    -- filter
    _ = _G["filter_"..action](unpack(args))
    
    -- pre-equip logic
    for _, phase in pairs({"auto_pre_", "user_pre_", "job_pre_",}) do
        -- eventArgs is always the last element of args
        if not eventArgs.cancel and not eventArgs.handled then
            _ = _G[phase..fun] and _G[phase..fun](unpack(args))
            if eventArgs.cancel then
                cancel_spell()
            end
        end
    end

    -- equip gear
    if eventArgs.equip and not eventArgs.cancel and not eventArgs.handled then
        handle_equip(action, unpack(args))
    end
    
    -- post-equip logic
    for _, phase in pairs({"auto_post_", "user_post_", "job_post_",}) do
        -- eventArgs is always the last element of args
        if not eventArgs.cancel then
            _ = _G[phase..fun] and _G[phase..fun](unpack(args))
            if eventArgs.cancel then
                cancel_spell()
            end
        end
    end

    -- cleanup
    _ = _G["cleanup_"..action](unpack(args))
end
