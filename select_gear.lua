-------------------------------------------------------------------------------
-- Gear Selectors
-------------------------------------------------------------------------------
-- handle_action
------------------------------------------------------------
function handle_equip(action, ...)
    local args = {...}
    local eventArgs = args[#args]
    local equipSet = {}

    if action ~= "precast" and action ~= "midcast" and action ~= "pet_midcast" then
        action = "by_status"
    elseif player.status == "Idle" then
        action = "idle"
    elseif player.satus == "Engaged" then
        action = "engaged"
    else
        return
    end

    -- walk the gearset tree to find base set
    for _, phase in pairs({"auto_get_set_", "user_get_set_", "job_get_set_"}) do
        if not eventArgs.handled and _G[phase..action] then
            equipSet = _G[phase..action](player.status, pet.status, equipSet, unpack(args))
        end
    end

    -- apply swaps
    for _, phase in pairs({"auto_apply_swaps_", "user_apply_swaps_", "job_apply_swaps_"}) do
        if not eventArgs.handled and _G[phase..action] then
            equipSet = _G[phase..action](player.status, pet.status, equipSet, unpack(args))
        end
    end

    equip(equipSet)
end

------------------------------------------------------------
-- auto_get_set
------------------------------------------------------------
-- auto_get_set_precast
----------------------------------------
function auto_get_set_precast(playerStatus, petStatus, equipSet, spell, position, eventArgs)
    if not sets.precast then
        return {}
    end

    state.setPath:append("sets")
    state.setPath:append("precast")

    local category

    if spell.action_type == "Magic" then
        category = "MA"
    elseif spell.action_type == "Ranged Attack" then
        category = "RA"
    elseif sepll.action_type == "Ability" then
        if spell.type == "JobAbility" then
            category = "JA"
        elseif spell.type == "WeaponSkill" then
            category = "WS"
        end
    elseif spell.action_type == "Item" then
        category = "Item"
    end

    if equipSet[category] then
        state.setPath:append(category)
        equipSet = equipSet[category]
    end
end

function moveSet(token, equipSet)
    if equipSet[token] then
        return equipSet[token]
    end
    return equipSet
end

----------------------------------------
-- auto_get_set_midcast
----------------------------------------
function auto_get_set_midcast(spell, position, eventArgs)
end

----------------------------------------
-- auto_get_set_pet_midcast
----------------------------------------
function auto_get_set_pet_midcast(spell, position, eventArgs)
end

----------------------------------------
-- auto_get_by_status
----------------------------------------
function auto_get_set_by_status(spell, position, eventArgs)
end

