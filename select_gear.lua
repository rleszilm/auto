-------------------------------------------------------------------------------
-- Gear Selectors
-------------------------------------------------------------------------------
-- handle_action
------------------------------------------------------------
function handle_equip(action, eventArgs, ...)
    local args = {...}
    local equipSet = {}

    if action == "pet_midcast" then
        action = "midcast"
    elseif action ~= "precast" and action ~= "midcast" then
        action = "by_status"
    else
        return
    end

    -- walk the gearset tree to find base set
    equipSet = call_reduce("get_set_"..action, check_handled_cancel, equipSet, eventArgs, unpack(args))
    
    -- apply swaps
    equipSet = call_reduce("apply_swaps_"..action, check_handled_cancel, equipSet, eventArgs, unpack(args))
    
    -- equip gear
    if state.DebugMode then
        logger.log("equipping", state.setPath)
    end
    equip(equipSet)
    state.setPath:clear()
    state.setSwaps:clear()
end

------------------------------------------------------------
-- get_set phases
------------------------------------------------------------
-- auto_get_set_precast
----------------------------------------
function auto_get_set_precast(eventArgs, equipSet, spell, position)
    if not sets.precast then
        return equipSet
    end

    state.setPath:append("sets")
    state.setPath:append("precast")

    equipSet = sets.precast

    local category = spell_category(spell)
    if category == "item" then
        equipSet = get_set_item(eventArgs, equipSet, spell)
    elseif category == "ja" then
        equipSet = get_set_ja(eventArgs, equipSet, spell)
    elseif category == "ma" then
        equipSet = get_set_ma(eventArgs, equipSet, spell)
    elseif category == "pet" then
        equipSet = get_set_pet_ability(eventArgs, equipSet, spell)
    elseif category == "ra" then
        equipSet = get_set_ra(eventArgs, equipSet)
    elseif category == "ws" then
        equipSet = get_set_ws(eventArgs, equipSet, spell)
    end

    return equipSet
end

----------------------------------------
-- auto_get_set_midcast
----------------------------------------
function auto_get_set_midcast(eventArgs, equipSet, spell)
    if not sets.midcast then
        return equipSet
    end

    state.setPath:append("sets")
    state.setPath:append("midcast")

    equipSet = sets.midcast

    local category = spell_category(spell)
    if category == "item" then
        equipSet = get_set_item(eventArgs, equipSet, spell)
    elseif category == "ma" then
        equipSet = get_set_ma(eventArgs, equipSet, spell)
    elseif category == "pet" then
        equipSet = get_set_pet_ability(eventArgs, equipSet)
    elseif category == "ra" then
        equipSet = get_set_ra(eventArgs, equipSet)
    end

    return equipSet
end

----------------------------------------
-- auto_get_set_by_status
----------------------------------------
function auto_get_set_by_status(eventArgs, equipSet)
    if player.status == "Engaged" then
        return auto_get_set_engaged(eventArgs, equipSet)
    else
        return auto_get_set_idle(eventArgs, equipSet)
    end
end

----------------------------------------
-- auto_get_set_engaged
----------------------------------------
function auto_get_set_engaged(eventArgs, equipSet)
    if not sets.engaged then
        return {}
    end

    state.setPath:append("sets")
    state.setPath:append("engaged")

    equipSet = sets.engaged

    local steps = {get_set_defense, get_set_pet_status, get_set_engaged, state.CustomMeleeGroups}
    return step_set(steps, equipSet)
end

----------------------------------------
-- auto_get_set_idle
----------------------------------------
function auto_get_set_idle(eventArgs, equipSet)
    if not sets.idle then
        return equipSet
    end

    state.setPath:append("sets")
    state.setPath:append("idle")

    equipSet = get_set_pet_status(eventArgs, sets.idle)

    local steps = {get_set_defense, get_set_pet_status, state.CustomIdleGroups}
    return step_set(steps, equipSet)
end

------------------------------------------------------------
-- sets
------------------------------------------------------------
-- get_set_defense
----------------------------------------
function get_defense_set(eventArgs, equipSet, spell)
    local dm = state.DefenseMode.current
    if dm == "None" then
        return equipSet
    end

    local dmm = state[state.DefenseMode.current.."DefenseMode"].current
    if dmm == "None" then
        dmm = nil
    end

    local steps = {dm, dmm}
    return step_set(steps, equipSet, spell)
end

----------------------------------------
-- get_set_engaged
----------------------------------------
function get_set_engaged(eventArgs, equipSet, spell)
    local steps = {
        state.CombatForm.current, 
        state.CombatSkill.current,
        state.CombatWeapon.current,
        state.TargetAcc.current,
        haste_bucket and haste_bucket(state.HasteNeeded),
        state.CustomMeleeGroups,
    }
    return step_set(steps, equipSet, spell)
end

----------------------------------------
-- get_set_idle
----------------------------------------
function get_set_idle(eventArgs, equipSet, spell)
    local steps = {}
    if state.Buffs.weakness then
        steps = {"weak"}
    elseif areas.Cities:contains(world.area) then
        steps = {"town"}
    else
        steps = {"field"}
    end
    steps[#steps+1] = state.CustomIdleGroups
    return step_set(steps, equipSet, spell)
end

----------------------------------------
-- get_set_item
----------------------------------------
function get_set_item(eventArgs, equipSet, spell)
    local steps = {spell.en, state.CustomItemGroups}
    return step_set(steps, equipSet, spell)
end


----------------------------------------
-- get_set_ja
----------------------------------------
function get_set_ja(eventArgs, equipSet, spell)
    local steps = {spell.en, state.CustomJAGroups}
    return step_set(steps, equipSet, spell)
end

----------------------------------------
-- get_set_ma
----------------------------------------
function get_set_ma(eventArgs, equipSet, spell)
    local steps = {state.CastingMode.current, get_spell_group(spell), spell.type, spell.skill, spell.en, state.CustomMAGroups}
    return step_set(steps, equipSet, spell)
end

----------------------------------------
-- get_set_pet_ability
----------------------------------------
function get_set_pet_ability(eventArgs, equipSet, spell)
    local steps = {state.PetAbilityMode.current, pet.name, get_petspell_group(spell), spell.en, state.CustomPetAbilityGroups}
    return step_set(steps, equipSet, spell)
end

----------------------------------------
-- get_set_pet_status
----------------------------------------
function get_set_pet_status(eventArgs, equipSet, spell)
    local steps = {state.PetStatusMode.current, pet.name, pet.status, state.CustomPetStatusGroups}
    return step_set(steps, equipSet, spell)
end

----------------------------------------
-- get_set_ra
----------------------------------------
function get_set_ra(eventArgs, equipSet)
    local steps = {
        state.RangedMode.current,
        snapshot_bucket and snapshot_bucket(state.SnapshotNeeded),
        state.CustomRangedGroups,
    }
    return step_set(steps, equipSet)
end

----------------------------------------
-- get_set_ws
----------------------------------------
function get_set_ws(eventArgs, equipSet, spell)
    local steps = {state.WeaponSkillMode.current, spell.en, state.CustomWSGroups}
    return step_set(steps, equipSet, spell)
end

------------------------------------------------------------
-- apply_swaps phases
------------------------------------------------------------
-- auto_apply_swaps_precast
----------------------------------------
function auto_apply_swaps_precast(eventArgs, equipSet, spell, position)
end

----------------------------------------
-- auto_apply_swaps_midcast
----------------------------------------
function auto_apply_swaps_midcast(eventArgs, equipSet, spell)
end

----------------------------------------
-- auto_apply_swaps_by_status
----------------------------------------
function auto_apply_swaps_by_status(eventArgs, equipSet, spell)
end

----------------------------------------
-- auto_apply_swaps_engaged
----------------------------------------
function auto_apply_swaps_engaged(eventArgs, equipSet)
end

----------------------------------------
-- auto_apply_swaps_idle
----------------------------------------
function auto_apply_swaps_idle(eventArgs, equipSet)
end

----------------------------------------
-- get_swap_weather
----------------------------------------
function get_swap_weather(eventArgs, equipSet, spell)
end

----------------------------------------
-- get_swap_day
----------------------------------------
function get_swap_day(eventArgs, equipSet, spell)
end

----------------------------------------
-- get_swap_time
----------------------------------------
function get_swap_time(eventArgs, equipSet, spell)
end

----------------------------------------
-- get_swap_running
----------------------------------------
function get_swap_running(eventArgs, equipSet, spell)
end

----------------------------------------
-- get_swap_treasurehunter
----------------------------------------
function get_swap_treasurehunter(eventArgs, equipSet, spell)
end

----------------------------------------
-- get_swap_buff
----------------------------------------
function get_swap_buff(eventArgs, equipSet, spell)
end

------------------------------------------------------------
-- helpers
------------------------------------------------------------
-- spell_category
----------------------------------------
function spell_category(spell)
    if spell.action_type == "Item" then
        return "item"
    elseif sepll.action_type == "Ability" then
        if spell.prefix == "/pet" then
            return "pet"
        elseif spell.type == "JobAbility" then
            return "ja"
        elseif spell.type == "WeaponSkill" then
            return "ws"
        end
    elseif spell.action_type == "Magic" then
        return "ma"
    elseif spell.action_type == "Ranged Attack" then
        return "ra"
    end
end

----------------------------------------
-- step_set
----------------------------------------
function step_set(step, action, eventArgs, equipSet, spell)
    if type(step) == "table" then
        for _, s in pairs(step) do
            step_set(s, equipSet, spell)
        end
    elseif type(step) == "function" then
        equipSet = step(eventArgs, equipSet, spell)
        if eventArgs.selected then
            return equipSet
        end
    else
        if equipSet[step] then
            state.setPath:append(step)
            return equipSet[step]
        end
        if mandatory then
            return nil
        end
    end
    return equipSet
end

----------------------------------------
-- swap_set
----------------------------------------
function swap_set(swap, action, eventArgs, equipSet, spell)
    local swappedSet = equipSet
    if type(swap) == "table" then
        for _, s in pairs(swap) do
            swappedSet = swap_set(s, swappedSet, spell)
        end
    elseif type(swap) == "function" then
        local swaps = swap(eventArgs, swappedSet, spell)
        swappedSet = set_combine(equipSet, swaps)
        if eventArgs.selected then
            return swappedSet
        end
    end
    return swappedSet
end

------------------------------------------------------------
-- display_set_path
------------------------------------------------------------
function display_set_path()
    local setStr

    for _, name in pairs(state.setPath) do
        if not setStr then
            setStr = name
        else
            if name:contains(' ') or name:contains("'") then
                setStr = setStr .. '["' .. name .. '"]'
            else
                setStr = setStr .. '.' .. name
            end
        end
    end
    windower.add_to_chat(22, "Equipping sets"..setStr)
end
