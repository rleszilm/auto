-------------------------------------------------------------------------------
-- Gear Selectors
-------------------------------------------------------------------------------
-- handle_action
------------------------------------------------------------
function handle_equip(action, eventArgs, ...)
    local args = {...}
    local equipSet = {}

    if action ~= "precast" and action ~= "midcast" and action ~= "pet_midcast" then
        action = "by_status"
    else
        return
    end

    -- walk the gearset tree to find base set
    equipSet = call_reduce("get_set_"..action, check_handled_cancel, equipSet, eventArgs, unpack(args))
    
    -- apply swaps
    equipSet = call_reduce("apply_swaps_", check_handled_cancel, equipSet, eventArgs, unpack(args))
    
    -- equip gear
    equip(equipSet)
end

------------------------------------------------------------
-- auto_get_set
------------------------------------------------------------
-- auto_get_set_precast
----------------------------------------
function auto_get_set_precast(eventArgs, equipSet, spell, position)
    if not sets.precast then
        return {}
    end

    state.setPath:append("sets")
    state.setPath:append("precast")

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
        return {}
    end

    state.setPath:append("sets")
    state.setPath:append("midcast")

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
-- auto_get_by_status
----------------------------------------
function auto_get_set_by_status(eventArgs, equipSet)
    equipSet = step_set({_G[state.DefenseMode.current.."DefenseMode"].current, state.IdleMode.current}, equipSet)

    if player.status == "Engaged" then
        equipSet = get_set_engaged(eventArgs, equipSet)
    else
        equipSet = get_set_idle(eventArgs, equipSet)
    end
    return equipSet
end

------------------------------------------------------------
-- helpers
------------------------------------------------------------
-- get_set_engaged
----------------------------------------
function get_set_engaged(eventArgs, equipSet)
    local haste = haste_bucket and haste_bucket(state.HasteNeeded)
    local steps = {}
    equipSet = get_set_pet_status(eventArgs, equipSet)
    steps[#steps] = {state.CombatForm.current, state.CombatSkill.current, state.CombatWeapon.current, state.TargetAcc.current, haste}
    steps[#steps] = state.CustomMeleeGroups

    return step_set(steps, equipSet)
end

----------------------------------------
-- get_set_idle
----------------------------------------
function get_set_idle(eventArgs, equipSet)
    if pet then
        equipSet = get_set_pet_status(eventArgs, equipSet)
    end
    
    local steps = {}
    if state.Buffs.weakness then
        steps = {"weak"}
    elseif areas.Cities:contains(world.area) then
        steps = {"town"}
    else
        steps = {"field"}
    end
    steps[#steps] = state.CustomIdleGroups
    return step_set(steps, equipSet)
end

----------------------------------------
-- get_set_item
----------------------------------------
function get_set_item(eventArgs, equipSet, spell)
    local steps = {spell.en}
    steps[#steps] = state.CustomItemGroups
    return step_set(steps, equipSet)
end


----------------------------------------
-- get_set_ja
----------------------------------------
function get_set_ja(eventArgs, equipSet, spell)
    local steps = {spell.en}
    steps[#steps] = state.CustomJAGroups
    return step_set(steps, equipSet)
end

----------------------------------------
-- get_set_ma
----------------------------------------
function get_set_ma(eventArgs, equipSet, spell)
    local steps = {state.CastingMode.current, get_spell_group(spell), spell.type, spell.skill, spell.en}
    steps[#steps] = state.CustomMAGroups
    return step_set(steps, equipSet)
end

----------------------------------------
-- get_set_pet_ability
----------------------------------------
function get_set_pet_ability(eventArgs, equipSet, spell)
    local steps = {state.PetMode.current, pet.name, get_petspell_group(spell), spell.en}
    steps[#steps] = state.CustomPetAbilityGroups
    return step_set(steps, equipSet)
end

----------------------------------------
-- get_set_pet_status
----------------------------------------
function get_set_pet_status(eventArgs, equipSet)
    local steps = {state.PetMode.current, pet.name, pet.status}
    steps[#steps] = state.CustomPetGroups
    return step_set(steps, equipSet)
end

----------------------------------------
-- get_set_ra
----------------------------------------
function get_set_ra(eventArgs, equipSet)
    local haste = snapshot_bucket and snapshot_bucket(state.SnapshotNeeded)
    local steps = {state.RangedMode.current, haste}
    steps[#steps] = state.CustomRangedGroups
    return step_set(steps, equipSet)
end

----------------------------------------
-- get_set_ws
----------------------------------------
function get_set_ws(eventArgs, equipSet, spell)
    local steps = {state.WeaponSkillMode.current, spell.en}
    steps[#steps] = state.CustomWSGroups
    return step_set(steps, equipSet)
end

----------------------------------------
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
function step_set(steps, evenetArgs, equipSet, mandatory)
    if type(steps) == "table" then
        for _, step in pairs(steps) do
            step_set(step, equipSet, mandatory)
        end
    elseif type(step) == "function" then
        equipSet = step(eventArgs, equipSet)
        if eventArgs.selected then
            return equipSet
        end
    else
        if equipSet[steps] then
            state.setPath:append(steps)
            return equipSet[steps]
        end
        if mandatory then
            return nil
        end
    end
    return equipSet
end
