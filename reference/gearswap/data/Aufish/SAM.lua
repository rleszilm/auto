--------------------------------------------------------------------------------
-- Job specific setup
--------------------------------------------------------------------------------
function user_setup()
    -- Set any default Modes here
    state.WeaponSetMode:options("None", "Ichi")
    state.WeaponSetMode:set("Ichi")
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
    --
    -- merge:
    --  |- dummysong

    -- fc sets
    sets.precast.FC = {}

    -- ja sets
    sets.precast.JA = {}

    -- ws sets
    sets.precast.WS = {
        sub="Utu Grip",
        ammo="Knobkierrie",
        head=gear.Valorous.Head.WSD,
        body="Flamma Korazin +2",
        hands=gear.Valorous.Hands.WSD,
        legs="Hiza. Hizayoroi +1",
        feet="Flam. Gambieras +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear=gear.Moonshade,
        right_ear="Ishvara Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back="Moonlight Cape",
    }

    sets.precast.WS['Tachi: Jinpu'] = {
        ammo="Knobkierrie",
        head=gear.Valorous.Head.HybridWSD,
        body="Found. Breastplate",
        hands="Founder's Gauntlets",
        legs="Founder's Hose",
        feet="Founder's Greaves",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Friomisi Earring",
        right_ear="Ishvara Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
    }

    -- ra sets
    sets.precast.RA = {}

    -- item sets
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
        head="Genmei kabuto",
        body="Hiza. Haramaki +1",
        hands="Rao Kote +1",
        legs="Rao Haidate +1",
        feet="Rao Sune-Ate +1",
        neck="Twilight Torque",
        waist="Flume Belt +1",
        left_ear="Odnowa Earring +1",
        right_ear="Odnowa Earring",
        left_ring="Chirich Ring +1",
        right_ring="Defending Ring",
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
    sets.engaged['H2H'] = {}

    -- 1 handed sets
    sets.engaged['1H'] = {}

    -- 2 handed sets
    sets.engaged['2H'] = {
        ammo="Ginsen",
        head="Flam. Zucchetto +2",
        body="Flamma Korazin +2",
        hands="Flamma Manopolas +2",
        legs=gear.Valorous.Legs.DoubleAttack,
        feet="Flam. Gambieras +2",
        neck="Moonlight Nodowa",
        waist="Ioskeha Belt +1",
        left_ear="Telos Earring",
        right_ear="Dedition Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Flamma Ring",P
    }

   sets.engaged["2H"].Half = set_combine(sets.engaged['2H'], {
        --head="Ken. Jinpachi +1",
        body="Ken. Samue +1",
        hands="Ken. Tekko +1",
        legs="Ken. Hakama +1",
        feet="Ken. Sune-Ate +1",
        right_ring="Chirich Ring +1",
    })


    -- dual wield
    sets.engaged['DW'] = {}

    ------------------------------------------------------------
    -- defense
    ------------------------------------------------------------
    -- defense.[state.Subjob].[state.PhysicalDefenseMode].[classes.CustomDefenseGroups]...
    -- defense.[state.Subjob].[state.MagicalDefenseMode].[classes.CustomDefenseGroups]...
    -- 
    -- customize_defense_set(defenseset)
    
    -- physical defense sets
    sets.defense.PLow = {}
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
    sets.running = {left_ring = "Shneddick Ring"}

    ------------------------------------------------------------
    -- Weapon sets
    ------------------------------------------------------------
    -- Weapon sets to be toggled between via WeaponSetMode
    sets.weapons = {}

    sets.weapons.Ichi = {
        main="Ichigohitofuri",
        sub="Utu Grip",
    }

    ------------------------------------------------------------
    -- RangedWeapon sets
    ------------------------------------------------------------
    -- RangedWeapon sets to be toggled between via RangedWeaponSetMode
    sets.rangedweapons = {}

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
function job_customize_melee_set(idleset)
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
