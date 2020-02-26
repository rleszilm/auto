-------------------------------------------------------------------------------
-- Gear Selectors
-------------------------------------------------------------------------------
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
        equipSet = get_set_pet_ability(eventArgs, equipSet, spell)
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
    return equipSet
end

----------------------------------------
-- auto_get_set_engaged
----------------------------------------
function auto_get_set_engaged(eventArgs, equipSet)
    if not sets.engaged then
        return equipSet
    end

    state.setPath:append("sets")
    state.setPath:append("engaged")

    equipSet = sets.engaged

    local steps = {get_set_defense, get_set_pet_status, get_set_engaged, state.CustomMeleeGroups}
    return step_set(steps, eventArgs, equipSet)
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
    return step_set(steps, eventArgs, equipSet)
end

------------------------------------------------------------
-- sets
------------------------------------------------------------
-- get_set_defense
----------------------------------------
function get_defense_set(eventArgs, equipSet, spell)
    if not equipSet.defense then
        return equipSet
    end

    local dm = state.DefenseMode.current
    if dm == "None" then
        return equipSet
    end

    local dmm = state[state.DefenseMode.current.."DefenseMode"].current
    if dmm == "None" then
        dmm = nil
    end

    local steps = {"defense", dm, dmm}
    return step_set(steps, eventArgs, equipSet, spell)
end

----------------------------------------
-- get_set_engaged
----------------------------------------
function get_set_engaged(eventArgs, equipSet, spell)
    local steps = {
        player.sub_job,
        state.MeleeForm.current, 
        state.MeleeSkill.current,
        state.MeleeWeapon.current,
        state.TargetAccuracy.current,
        haste_bucket and haste_bucket(state.HasteNeeded),
        state.CustomMeleeGroups,
    }
    return step_set(steps, eventArgs, equipSet, spell)
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
    return step_set(steps, eventArgs, equipSet, spell)
end

----------------------------------------
-- get_set_item
----------------------------------------
function get_set_item(eventArgs, equipSet, spell)
    if not equipSet.item then 
        return equipSet
    end

    local steps = {"item", spell.en, state.CustomItemGroups}
    return step_set(steps, eventArgs, equipSet, spell)
end

----------------------------------------
-- get_set_ja
----------------------------------------
function get_set_ja(eventArgs, equipSet, spell)
    if not equipSet.ja then 
        return equipSet
    end

    local steps = {"ja", spell.en, state.CustomJAGroups}
    return step_set(steps, eventArgs, equipSet, spell)
end

----------------------------------------
-- get_set_ma
----------------------------------------
function get_set_ma(eventArgs, equipSet, spell)
    if not equipSet.ma then 
        return equipSet
    end
    
    local steps = {"ma", state.CastingMode.current, get_spell_group(spell), spell.type, spell.skill, spell.en, state.CustomMAGroups}
    return step_set(steps, eventArgs, equipSet, spell)
end

----------------------------------------
-- get_set_pet_ability
----------------------------------------
function get_set_pet_ability(eventArgs, equipSet, spell)
    if not equipSet.pet then 
        return equipSet
    end

    local steps = {"pet", state.PetAbilityMode.current, pet.name, get_petspell_group(spell), spell.en, state.CustomPetAbilityGroups}
    return step_set(steps, eventArgs, equipSet, spell)
end

----------------------------------------
-- get_set_pet_status
----------------------------------------
function get_set_pet_status(eventArgs, equipSet, spell)
    if not equipSet.pet then 
        return equipSet
    end

    local p
    if pet.status == "Engaged" then
        p = {state.PetTargetAccuracy, state.CustomPetEngagedGroups}
    elseif pet.status == "Idle" then
        p = {state.PetIdleMode, state.CustomPetIdleGroups}
    end

    local steps = {"pet", pet.name, pet.status, p}
    return step_set(steps, eventArgs, equipSet, spell)
end

----------------------------------------
-- get_set_ra
----------------------------------------
function get_set_ra(eventArgs, equipSet)
    if not equipSet.ra then 
        return equipSet
    end

    local steps = {
        "ra",
        player.sub_job,
        state.RangedSkill.current,
        state.RangedWeapon.current,
        state.TargetRangedAccuracy.current,
        snapshot_bucket and snapshot_bucket(),
        state.CustomRangedGroups,
    }
    return step_set(steps, eventArgs, equipSet)
end

----------------------------------------
-- get_set_ws
----------------------------------------
function get_set_ws(eventArgs, equipSet, spell)
    if not equipSet.ws then 
        return equipSet
    end

    local steps = {"ws", state.WeaponSkillMode.current, spell.en, state.CustomWSGroups}
    return step_set(steps, eventArgs, equipSet, spell)
end

------------------------------------------------------------
-- apply_swaps phases
------------------------------------------------------------
-- auto_apply_swaps_precast
----------------------------------------
function auto_apply_swaps_precast(eventArgs, equipSet, spell, position)
    return equipSet
end

----------------------------------------
-- auto_apply_swaps_midcast
----------------------------------------
function auto_apply_swaps_midcast(eventArgs, equipSet, spell)
    return equipSet
end

----------------------------------------
-- auto_apply_swaps_by_status
----------------------------------------
function auto_apply_swaps_by_status(eventArgs, equipSet, spell)
    local swaps = {
        "running"
    }
    return apply_swaps(swaps, equipSet, eventArgs, spell)
end

----------------------------------------
-- auto_apply_swaps_engaged
----------------------------------------
function auto_apply_swaps_engaged(eventArgs, equipSet)
    return equipSet
end

----------------------------------------
-- auto_apply_swaps_idle
----------------------------------------
function auto_apply_swaps_idle(eventArgs, equipSet)
    return equipSet
end

------------------------------------------------------------
-- helpers
------------------------------------------------------------
-- spell_category
----------------------------------------
function spell_category(spell)
    if spell.action_type == "Item" then
        return "item"
    elseif spell.action_type == "Ability" then
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
-- spell groups
----------------------------------------
function get_spell_group(spell)
    local group
    
    for _, fun in pairs({job_get_spell_group, user_get_spell_group, auto_get_spell_group}) do
        if fun then
            local g = fun(spell)
            if g then
                return g
            end
        end
    end
end

function auto_get_spell_group(spell)
    if spell then
        return spell_maps[spell.en]
    end
end

----------------------------------------
-- step_set
----------------------------------------
function step_set(step, eventArgs, equipSet, spell)
    if type(step) == "table" then
        for _, s in pairs(step) do
            equipSet = step_set(s, eventArgs, equipSet, spell)
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
    end
    return equipSet
end

----------------------------------------
-- apply_swaps
----------------------------------------
function apply_swaps(swap, equipSet, eventArgs, spell)
    local swappedSet = equipSet
    if type(swap) == "table" then
        for _, s in pairs(swap) do
            swappedSet = apply_swaps(s, swappedSet, eventArgs, spell)
        end
    else
        if sets.swaps[swap] then
            if _G['swap_'..swap] and _G['swap_'..swap](eventArgs, spell) then
                state.setSwaps:append(swap)
                swappedSet = set_combine(equipSet, sets.swaps[swap])
            end
        end
    end
    return swappedSet
end

------------------------------------------------------------
-- display_set_path
------------------------------------------------------------
function display_set_path()
    local setStr
    local swapStr

    for k, name in ipairs(state.setPath) do
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

    for k, name in ipairs(state.setSwaps) do
        if not swapStr then
            swapStr = name
        else
            swapStr = swapStr .. ',' .. name
        end
    end

    --windower.add_to_chat(22, "Equipping set - "..setStr)
    --if swapStr then
    --    windower.add_to_chat(22, "     w. swaps - "..swapStr)
    --end
end
