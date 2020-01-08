-------------------------------------------------------------------------------
-- Gear Selectors
-------------------------------------------------------------------------------
-- handle_action
------------------------------------------------------------
function handle_equip(action, ...)
    local args = {...}
    local eventArgs = args[#args]
    local equipSet = {}

    if action ~= "precast" and action ~= "midcast" and action ~= "aftercast" and 
       action ~= "pet_midcast" and action ~= "pet_aftercast"
    then
        action = "by_status"
    end

    -- walk the gearset tree to find base set
    for _, phase in pairs({"auto_get_set_", "user_get_set_", "job_get_set_"}) do
        if not eventArgs.handled then
            _ = _G[phase..action] and _G[phase..action](player.status, pet.status, equipSet, unpack(args))
        end
    end

    -- apply swaps
    for _, phase in pairs({"auto_apply_swaps_", "user_apply_swaps_", "job_apply_swaps_"}) do
        if not eventArgs.handled then
            _ = _G[phase..action] and _G[phase..action](player.status, pet.status, equipSet, unpack(args))
        end
    end

    equip(equipSet)
end