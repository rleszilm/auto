--------------------------------------------------------------------------------
-- Job specific setup
--------------------------------------------------------------------------------
function user_setup()
    -- Set any default Modes here
    state.WeaponSetMode:options("None", "Sagitta", "Spharai")
    state.WeaponSetMode:set("Sagitta")

    -- Set buffs to track
    state.Buff['Impetus'] = false

    -- Set any default Modes here
    --state.HybridMode:options("None","Half-DT", "Full-DT")
    --state.HybridMode:set("None")
end

--------------------------------------------------------------------------------
-- Gear Sets
--------------------------------------------------------------------------------
function init_gear_sets()
    ------------------------------------------------------------
    -- precast
    ------------------------------------------------------------
    -- precast.FC.[SPECIFIC_SET].[state.CastingMode]
    -- precast.JA.[SPECIFIC_SET].[classes.JAMode]
    -- precast.WS.[SPECIFIC_SET].[WS_MODE]
    -- precast.RA.[SPECIFIC_SET].[RANGED_SET]
    -- precast.Item.[SPECIFIC_SET]
    ----------------------------------------
    -- precast.FC
    ---------------------------------------- 
    sets.precast.FC = {
    }

    ----------------------------------------
    -- precast.JA
    ----------------------------------------
    sets.precast.JA.Impetus = {
        body="Bhikku Cyclas +1",
    }

    ----------------------------------------
    -- precast.WS
    ----------------------------------------
    -- Raging Fists
    sets.precast.WS["Raging Fists"] = {
        ammo="Knobkierrie",
        head=gear.HQ.Adhemar.Head.A,
        body="Ken. Samue +1",
        hands=gear.HQ.Adhemar.Hands.A,
        legs="Ken. Hakama +1",
        feet="Ken. Sune-Ate +1",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear=gear.Moonshade,
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
    }

    -- Howling Fist
    sets.precast.WS["Howling Fist"] = {
        ammo="Knobkierrie",
        head="Hes. Crown +3",
        body="Ken. Samue +1",
        hands="Anchor. Gloves +3",
        legs="Ken. Hakama +1",
        feet=gear.Herculean.Feet.TripleAttack,
        neck="Mnk. Nodowa +2",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear=gear.Moonshade,
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
    }

    -- Asuran Fists
    sets.precast.WS["Asuran Fists"] = {
        ammo="Knobkierrie",
        head="Hes. Crown +3",
        body="Hes. Cyclas +3",
        hands="Anchor. Gloves +3",
        legs="Ken. Hakama +1",
        feet="Ken. Sune-Ate +1",
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Ishvara Earring",
        right_ear=gear.Moonshade,
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
    }

    -- Tornado Kick
    sets.precast.WS["Tornado Kick"] = {
        neck="Fotia Gorget",
        waist="Fotia Belt",
    }

    -- Victory Smite
    sets.precast.WS["Victory Smite"] = {
        ammo="Knobkierrie",
        head=gear.HQ.Adhemar.Head.A,
        body="Ken. Samue +1",
        hands={name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
        legs="Ken. Hakama +1",
        feet=gear.Herculean.Feet.TripleAttack,
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Brutal Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back=gear.JSE.MNK.Back.DoubleAttack,
    }
    sets.precast.WS["Victory Smite"]['Impetus'] = set_combine(sets.precast.WS["Victory Smite"], {
        body="Bhikku Cyclas +1",
    })

    -- Shijin Spiral
    sets.precast.WS["Shijin Spiral"] = {
        ammo="Jukukik Feather",
        head="Ken. Jinpachi +1",
        body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs="Malignance Tights",
        feet="Ken. Sune-Ate +1",
        neck="Caro Necklace",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Mache Earring +1",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back=gear.JSE.MNK.Back.DoubleAttack,
    }

    ----------------------------------------
    -- precast.RA
    ---------------------------------------- 
    sets.precast.RA = {}

    ----------------------------------------
    -- precast.Item
    ---------------------------------------- 
    sets.precast.Item = {}

    ------------------------------------------------------------
    -- midcast
    ------------------------------------------------------------
    -- midcast.RA.[SPECIFIC_SET].[RANGED_SET]
    -- midcast.Item.[SPECIFIC_SET]
    -- midcast.[SPECIFIC_SET].[state.CastingMode]

    -- ra sets
    sets.midcast.RA = {}

    -- item sets
    sets.midcast.Item = {}

    -- magic sets

    ------------------------------------------------------------
    -- midcast.Pet
    ------------------------------------------------------------
    -- midcast.Pet.[SPECIFIC_SET].[state.CastingMode]
    -- midcast.Pet.[SPECIFIC_SET].[state.OffenseMode]

    -- pet midcast sets
    sets.midcast.Pet = {}

    ------------------------------------------------------------
    -- idle
    ------------------------------------------------------------
    -- idle.Weak.[state.IdleMode].[Pet].[Engaged].[classes.CustomIdleGroups]...
    -- idle.Town.[state.IdleMode].[Pet].[Engaged].[classes.CustomIdleGroups]...
    -- idle.Field.[state.IdleMode].[Pet].[Engaged].[classes.CustomIdleGroups]...
    --
    -- merge:
    --  |- defense
    --  |- kiting
    --
    -- customize_idle_set(idleset)
    --  |- job_customize_idle_set()
    --  |- [CUSTOM_COMMON]
    
    -- idle sets
    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Sanctity Necklace",
        waist="Moonbow Belt +1",
        left_ear="Odnowa Earring +1",
        right_ear="Odnowa Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Moonlight Cape",
    }

    sets.idle.Weak = sets.idle
    sets.idle.Town = sets.idle
    sets.idle.Field = sets.idle

    -- idle sets w/pet
    sets.idle.Weak.Pet = sets.idle
    sets.idle.Town.Pet = sets.idle
    sets.idle.Field.Pet = sets.idle

    -- idle sets w/Engaged pet
    sets.idle.Weak.Pet.Engaged = sets.idle
    sets.idle.Town.Pet.Engaged = sets.idle
    sets.idle.Field.Pet.Engaged = sets.idle

    ------------------------------------------------------------
    -- resting
    ------------------------------------------------------------
    -- resting.[state.RestingMode]
    sets.resting = {}

    ------------------------------------------------------------
    -- engaged
    ------------------------------------------------------------
    -- engaged.[state.Subjob].[state.CombatForm].[state.CombatSkill].[state.CombatWeapon].[state.CombatPosition].[state.OffenseMode].[state.HybridMode].[class.CustomMeleeGroups]...
    --
    -- state.CombatForm      - H2H | 1H | 2H | DW
    -- state.CombatyPosition - None | Front | Flank | Rear
    --
    -- merge:
    --  |- defense
    --  |- kiting
    --
    -- customize_melee_set(meleeset)
    --  |- job_customize_melee_set()
    --  |- [CUSTOM_COMMON]

    -- h2h sets
    sets.engaged['H2H'] = { -- 1235 acc
        ammo="Ginsen",
        head=gear.HQ.Adhemar.Head.A,
        body="Ken. Samue +1",
        hands=gear.HQ.Adhemar.Hands.A,
        legs="Hes. Hose +3",
        feet="Anch. Gaiters +3",
        neck="Mnk. Nodowa +2",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Telos Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back=gear.JSE.MNK.Back.DoubleAttack,
    }
   
    sets.engaged['H2H']['Impetus'] = set_combine(sets.engaged['H2H'], { -- 1195 acc
        body="Bhikku Cyclas +1",
    })
    
    sets.engaged['H2H']['Acc+'] = set_combine(sets.engaged['H2H'], { -- 1289 acc
        head="Ken. Jinpachi +1",
        body="Ken. Samue +1",
        hands="Ken. Tekko +1",
        legs="Ken. Hakama +1",
        feet="Ken. Sune-Ate +1",
    })

    sets.engaged['H2H']['Acc+']['Impetus'] = set_combine(sets.engaged['H2H']['Acc+'], {
        body="Bhikku Cyclas +1",
    })

    sets.engaged['H2H']['Acc++'] = sets.engaged['H2H']['Acc+']
    sets.engaged['H2H']['Acc+++'] = sets.engaged['H2H']['Acc++'] 

    sets.engaged['H2H']['Half'] = {
        ammo="Ginsen",
        head="Ken. Jinpachi +1",
        body="Ashera Harness",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Ken. Sune-Ate +1",
        neck="Mnk. Nodowa +2",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Telos Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Gere Ring",
        back=gear.JSE.MNK.Back.DoubleAttack,
    }

    sets.engaged['H2H']['Full'] = {
        ammo="Ginsen",
        head="Ken. Jinpachi +1",
        body="Ashera Harness",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Ken. Sune-Ate +1",
        neck="Mnk. Nodowa +2",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Telos Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Defending Ring",
        back=gear.JSE.MNK.Back.DoubleAttack,
    }

    -- 1 handed sets
    sets.engaged['1H'] = {}

    -- 2 handed sets
    sets.engaged['2H'] = {}

    -- dual wield
    sets.engaged['DW'] = {
    }

    ---- offense modes
    sets.engaged['DW']['Acc+'] = {
    }

    ---- hybrid modes
    sets.engaged['DW']['Half-DT'] = {
    }

    sets.engaged['DW']['Full-DT'] = {
    }

    ------------------------------------------------------------
    -- defense
    ------------------------------------------------------------
    -- defense.[state.Subjob].[state.PhysicalDefenseMode].[classes.CustomDefenseGroups]...
    -- defense.[state.Subjob].[state.MagicalDefenseMode].[classes.CustomDefenseGroups]...
    -- 
    -- customize_defense_set(defenseset)
    
    -- physical defense sets
    sets.defense.PLow = {}
    sets.defense.PLow = {
        head="Malignance Chapeau",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
    }
    sets.defense.PMed = {}
    sets.defense.PHigh = {}
    sets.defense.PTurtle = {}

    -- magical defense sets
    sets.defense.MLow = {}
    sets.defense.MMed = {}
    sets.defense.MHigh = {}
    sets.defense.MTurtle = {}

    ------------------------------------------------------------
    -- kiting
    ------------------------------------------------------------
    -- Kiting
    sets.Kiting = {}

    ------------------------------------------------------------
    -- running
    ------------------------------------------------------------
    -- Running
    sets.running = {left_ring="Shneddick ring"}


    ------------------------------------------------------------
    -- Weapon sets
    ------------------------------------------------------------
    -- Weapon sets to be toggled between via WeaponSetMode
    sets.weapons.Sagitta = {
        main="Sagitta",
    }
    
    sets.weapons.Spharai = {
        main="Spharai",
    }

    ------------------------------------------------------------
    -- WS_MODE
    ------------------------------------------------------------
    -- [state.WeaponskillMode] when Normal
    --  |- [state.RangedMode] when spell.skill == (Archery or Marksmanship)
    --  |  [state.OffenseMode]
    -- [state.WeaponskillMode]
    --
    -- get_custom_wsmode(spell, spellMap, ws_mode)

    ------------------------------------------------------------
    -- RANGED_SET
    ------------------------------------------------------------
    -- [state.CombatForm].[state.RangedWeapon].[state.RangedSkill].[state.RangedMode].[classes.CustomRangedGroups]...

    ------------------------------------------------------------
    -- SPECIFIC_SET
    ------------------------------------------------------------
    -- [NAMED_SET]
    -- [spell.skill].[NAMED_SET] - When not classes.SkipSkillCheck
    -- [spell.type].[NAMED_SET]

    ------------------------------------------------------------
    -- NAMED_SET
    ------------------------------------------------------------
    -- [classes.CustomClass]
    -- [spell.english]
    -- [spellMap]
    --  |- job_get_spell_map(spell, defaultSpellMap) or classes.SpellMaps[spell.english]

    ------------------------------------------------------------
    -- ELEMENTAL_GEAR
    ------------------------------------------------------------
    -- 
    -- gear.ElementalGorget.name - Fotia Gorget    | gear.default_weaponskill_neck  | ""
    -- gear.ElementalBelt.name   - Fotia Belt      | gear.default.weaponskill_waist | ""
    -- gear.ElementalObi.name    - Hachirin-no-obi | gear.default.obi_waist         | ""
    -- gear.ElementalCape.name   - if Obi: Twilight Cape else: gear.default.obi_back
    -- gear.ElementalRing.name   - if Obi and Not Divine|Dark|Healing|Impact: Zodiac Ring else: gear.default.obi_ring
    -- gear.FastcastStaff.name   - elemental staff | gear.default.fastcast_staff    | ""
    -- gear.FastcastStaff.name   - elemental staff | gear.default.recast_staff      | ""
end

--------------------------------------------------------------------------------
-- Customize Gear Sets
--------------------------------------------------------------------------------
-- job_customize_idle_set
----------------------------------------
function job_customize_idle_set(idleset)
    return idleset
end

----------------------------------------
-- job_customize_melee_set
----------------------------------------
function job_customize_melee_set(meleeset)
    return meleeset
end

----------------------------------------
-- job_customize_defense_set
----------------------------------------
function job_customize_defense_set(defenseset)
    return defenseset
end

----------------------------------------
-- job_get_custom_wsmode
----------------------------------------
function job_get_custom_wsmode(spell, spellMap, ws_mode)
    return ws_mode
end

----------------------------------------
-- job_customize_melee_groups
----------------------------------------
-- updates classes.CustomMeleeGroups
function job_customize_melee_groups()
    -- clear groups
    classes.CustomMeleeGroups:clear()

    -- add Impetus if active
    if state.Buff["Impetus"] then
        classes.CustomMeleeGroups:append('Impetus')
    end
end