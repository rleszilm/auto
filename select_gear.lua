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

    local steps = {get_set_defense, get_set_pet_status, get_set_engaged, get_set_status_effects, state.CustomMeleeGroups}
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

    equipSet = sets.idle

    local steps = {get_set_defense, get_set_pet_status, get_set_idle, get_set_status_effects, state.CustomIdleGroups}
    return step_set(steps, eventArgs, equipSet)
end

------------------------------------------------------------
-- sets
------------------------------------------------------------
-- get_set_defense
----------------------------------------
function get_set_defense(eventArgs, equipSet, spell)
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
        dual_wield_bucket(),
        get_set_status_effects,
        state.CustomMeleeGroups,
    }
    return step_set(steps, eventArgs, equipSet, spell)
end

----------------------------------------
-- get_set_idle
----------------------------------------
function get_set_idle(eventArgs, equipSet, spell)
    local steps = {state.IdleMode.current}
    if buffactive.weakness then
        steps[#steps+1] = "weak"
    elseif areas.Cities:contains(world.area) then
        steps[#steps+1] = "town"
    else
        steps[#steps+1] = "field"
    end
    steps[#steps+1] = get_set_status_effects
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

    local steps = {"item", spell.en, get_set_status_effects, state.CustomItemGroups}
    return step_set(steps, eventArgs, equipSet, spell)
end

----------------------------------------
-- get_set_ja
----------------------------------------
function get_set_ja(eventArgs, equipSet, spell)
    if not equipSet.ja then 
        return equipSet
    end

    local steps = {"ja", get_spell_group(spell), spell.en, get_specific_mode(spell), get_set_status_effects, state.CustomJAGroups}
    return step_set(steps, eventArgs, equipSet, spell)
end

----------------------------------------
-- get_set_ma
----------------------------------------
function get_set_ma(eventArgs, equipSet, spell)
    if not equipSet.ma then 
        return equipSet
    end
    
    local steps = {
        "ma",
        state.CastingMode.current,
        spell.type,
        spell.skill,
        get_spell_group(spell),
        spell.en,
        get_specific_mode(spell),
        get_set_status_effects,
        state.CustomMAGroups
    }
    return step_set(steps, eventArgs, equipSet, spell)
end

----------------------------------------
-- get_set_pet_ability
----------------------------------------
function get_set_pet_ability(eventArgs, equipSet, spell)
    if not pet.isvalid then
        return equipSet
    end

    local steps = {
        "pet",
        state.PetAbilityMode.current,
        pet.name,
        spell.type,
        get_spell_group(spell),
        spell.en,
        get_specific_mode(spell),
        get_set_status_effects,
        state.CustomPetAbilityGroups
    }
    return step_set(steps, eventArgs, equipSet, spell)
end

----------------------------------------
-- get_set_pet_status
----------------------------------------
function get_set_pet_status(eventArgs, equipSet, spell)
    if not pet.isvalid then
        return equipSet
    end

    local p
    if pet.status == "Engaged" then
        p = {state.PetTargetAccuracy.current, state.CustomPetEngagedGroups}
    elseif pet.status == "Idle" then
        p = {state.PetIdleMode.current, state.CustomPetIdleGroups}
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
        state.RangedAmmo.current,
        state.TargetRangedAccuracy.current,
        snapshot_bucket and snapshot_bucket(),
        get_set_status_effects,
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

    local steps = {"ws", state.WeaponSkillMode.current, spell.en, get_specific_mode(spell), get_set_status_effects, state.CustomWSGroups}
    return step_set(steps, eventArgs, equipSet, spell)
end

----------------------------------------
-- get_set_status_effects
----------------------------------------
function get_set_status_effects(eventArgs, equipSet, spell)
    local steps = {}
    for _, buff in ipairs(state.buffs) do
        if buffactive[buff] then
            steps[#steps+1] = buff
        end
    end
    return step_set(steps, eventArgs, equipSet, spell)
end

------------------------------------------------------------
-- apply_swaps phases
------------------------------------------------------------
-- auto_apply_swaps_precast
----------------------------------------
function auto_apply_swaps_precast(eventArgs, equipSet, spell, position)
    local swaps = {swap_elemental_gear}
    return apply_swaps(swaps, equipSet, eventArgs, spell)
end

----------------------------------------
-- auto_apply_swaps_midcast
----------------------------------------
function auto_apply_swaps_midcast(eventArgs, equipSet, spell)
    local swaps = {swap_elemental_gear}
    return apply_swaps(swaps, equipSet, eventArgs, spell)
end

----------------------------------------
-- auto_apply_swaps_by_status
----------------------------------------
function auto_apply_swaps_by_status(eventArgs, equipSet, spell)
    local swaps = {swap_weapons, swap_rangedweapons, swap_ammo, "running"}
    return apply_swaps(swaps, equipSet, eventArgs, spell)
end

----------------------------------------
-- auto_apply_swaps_engaged
----------------------------------------
function auto_apply_swaps_engaged(eventArgs, equipSet)
    local swaps = {swap_weapons, swap_rangedweapons, swap_ammo}
    return apply_swaps(swaps, equipSet, eventArgs, spell)
end

----------------------------------------
-- auto_apply_swaps_idle
----------------------------------------
function auto_apply_swaps_idle(eventArgs, equipSet)
    local swaps = {swap_weapons, swap_rangedweapons, swap_ammo}
    return apply_swaps(swaps, equipSet, eventArgs, spell)
end

------------------------------------------------------------
-- swaps
------------------------------------------------------------
function swap_weapons(eventArgs, swappedSet, spell)
    if sets.weapons and sets.weapons[state.WeaponSetMode.current] then
        if state.MeleeFormOverride.current ~= "None" and sets.weapons[state.WeaponSetMode.current][state.MeleeFormOverride.current] then
            swappedSet = set_combine(swappedSet, sets.weapons[state.WeaponSetMode.current][state.MeleeFormOverride.current])
        else
            swappedSet = set_combine(swappedSet, sets.weapons[state.WeaponSetMode.current])
        end
    end
    return swappedSet
end

function swap_rangedweapons(eventArgs, swappedSet, spell)
    if sets.rangedweapons and sets.rangedweapons[state.RangedWeaponSetMode.current] then
        swappedSet = set_combine(swappedSet, sets.rangedweapons[state.RangedWeaponSetMode.current])
    end
    return swappedSet
end

function swap_ammo(eventArgs, swappedSet, spell)
    if sets.ammo and sets.ammo[state.AmmoSetMode.current] then
        swappedSet = set_combine(swappedSet, sets.ammo[state.AmmoSetMode.current])
    end
    return swappedSet
end

function swap_elemental_gear(eventArgs, swappedSet, spell)
    if spell.element == 'None' then
        return swappedSet
    end

    local cat = spell_category(spell)
    if (eventArgs.action == "midcast" and cat == "ma") or
        (eventArgs.action == "precast" and cat == "ja") or
        (eventArgs.action == "precast" and cat == "ws")
    then
        local worldElements = S{world.day_element}

        if world.weather_element ~= 'None' then
            worldElements:add(world.weather_element)
        end

        local player_storm = get_player_storm()
        if player_storm ~= 'None' then
            worldElements:add(player_storm)
        end

        local eleSwaps = {}
        if sets.swaps and sets.swaps.day_weather then
            eleSwaps = sets.swaps.day_weather
        end

        if eleSwaps[spell.element] then
            eleSwaps = eleSwaps[spell.element]
        end

        if eleSwaps[spell.name] then
            eleSwaps = eleSwaps[spell.name]
        end

        if worldElements:contains(spell.element) then
            swappedSet = set_combine(swappedSet, eleSwaps)    
        end
    end
    return swappedSet
end

function get_player_storm()
    local storm_ids = {
        178, 179, 180, 181, 182, 183, 184, 185,
        589, 590, 591, 592, 593, 594, 595, 596,
    }
    for _, buff_id in pairs(storm_ids) do
        if player.buffs[buff_id] then
            local storm = res.buffs[buff_id]
            if storm.en == "Firestorm" then
                return "Fire"
            elseif storm.en == "Hailstorm" then
                return "Ice"
            elseif storm.en == "Windstorm" then
                return "Wind"
            elseif storm.en == "Sandstorm" then
                return "Earth"
            elseif storm.en == "Thunderstorm" then
                return "Lightning"
            elseif storm.en == "Rainstorm" then
                return "Water"
            elseif storm.en == "Aurorastorm" then
                return "Light"
            elseif storm.en == "Voidstorm" then
                return "Dark"
            end
        end
    end
    return "None"
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
        elseif spell.type == "JobAbility" or spell.prefix == "/jobability" then
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
-- ja mode
----------------------------------------
function get_specific_mode(spell)
    local g = get_spell_group(spell)

    if state[spell.en.."Mode"] then
        return state[spell.en.."Mode"].current
    elseif g and type(g) == "string" and state[g.."Mode"] then
        return state[g.."Mode"].current
    end
    return "None"
end

----------------------------------------
-- step_set
----------------------------------------
function step_set(step, eventArgs, equipSet, spell)
    if type(step) == "table" then
        for _, s in ipairs(step) do
            equipSet = step_set(s, eventArgs, equipSet, spell)
        end
    elseif type(step) == "function" then
        equipSet = step(eventArgs, equipSet, spell)
        if eventArgs.selected then
            return equipSet
        end
    else
        if _settings.debug_mode then
            windower.add_to_chat(22, "select set step - "..step)
        end
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
        for _, s in ipairs(swap) do
            swappedSet = apply_swaps(s, swappedSet, eventArgs, spell)
        end
    elseif type(swap) == "function" then
        swappedSet = swap(eventArgs, swappedSet, spell)
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

    if _settings.show_swaps or _settings.debug_mode then
        windower.add_to_chat(22, "Equipping set - "..setStr)
        if swapStr then
            windower.add_to_chat(22, "     w. swaps - "..swapStr)
        end
    end
end
