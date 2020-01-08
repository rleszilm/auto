--------------------------------------------------------------------------------
-- Job specific setup
--------------------------------------------------------------------------------
function user_setup()
    -- Set any default Modes here

    -- Set buffs to track
    state.Buff.Battuta = false

    -- Flags for Weapon Set Mode
    state.WeaponSetMode:options('None', 'Aettir', 'Dolichenus')
    state.WeaponSetMode:set('Aettir')
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

    -- fc sets
    sets.precast.FC = {
        -- quickens +02
        -- fastcast +43
        ammo="Impatiens",              -- quickens +02 02
        head=gear.HQ.Carmine.Head.D,   -- fastcast +14 14
        body=gear.Taeon.Body.FC,       -- fastcast +09 23
        hands="Leyline Gloves",        -- fastcast +07 30
        legs="Aya. Cosciales +2",      -- fastcast +05 35
        feet=gear.HQ.Carmine.Feet,     -- fastcast +08 43
        neck="Voltsurge Torque",       -- fastcast +04 47
        left_ear="Etiolation Earring", -- fastcast +01 48
        right_ear="Loquac. Earring",   -- fastcast +02 50
        left_ring="Prolix Ring",       -- fastcast +02 52
    }

    sets.precast.FC['Ehancing Magic'] = set_combine(sets.precast.FC, {legs="Futhark trousers +1"})

    -- ja sets
    sets.precast.JA = {}

    sets.precast.JA["Elemental Sforzo"] = {body="Futhark coat +3"}
    sets.precast.JA["Swordplay"] = {hands="Futhark mitons +1"}
    sets.precast.JA["Embolden"] = {}
    sets.precast.JA["One for All"] = {}
    sets.precast.JA["Odyllic Subterfuge"] = {}
    sets.precast.JA["Elemental Sforzo"] = {}
    sets.precast.JA["Vivacious Pulse"] = {head="Erilaz galea +1"}
    -- wards
    sets.precast.JA["Vallation"] = {body="Runeist's Coat +3"}
    sets.precast.JA["Pflug"] = {feet="Runeist's boots +2"}
    sets.precast.JA["Valiance"] = {body="Runeist's Coat +3"}
    sets.precast.JA["Liement"] = {body="Futhark coat +3"}
    sets.precast.JA["Battuta"] = {head="Futhark bandeau +3"}
    -- effusions
    sets.precast.JA["Swipe"] = {}
    sets.precast.JA["Lunge"] = {}
    sets.precast.JA["Gambit"] = {hands="Runeist's mitons +2"}   sets.precast.JA["Rayke"] = {feet="Futhark boots +1"}

    -- ws sets
    sets.precast.WS = {}

    sets.precast.WS.Resolution = {
        ammo="Seeth. Bomblet +1",
        head=gear.HQ.Lustratio.Head.A,
        body=gear.HQ.Adhemar.Body.A,
        hands=gear.HQ.Adhemar.Hands.A,
        legs="Meg. Chausses +2",
        feet=gear.HQ.Lustratio.Feet.D,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear=gear.Moonshade,
        right_ear="Sherida Earring",
        left_ring="Ilabrat Ring",
        right_ring="Niqmaddu Ring",
    }

    sets.precast.WS.Resolution.CappedAtt = {
        ammo="Knobkierrie",
        head=gear.HQ.Lustratio.Head.A,
        body=gear.HQ.Lustratio.Body.A,
        hands==gear.HQ.Adhemar.Hands.A,
        legs="Samnuha Tights",
        feet=gear.HQ.Lustratio.Feet.D,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear=gear.Moonshade,
        right_ear="Sherida Earring",
        left_ring="Epona's Ring",
        right_ring="Niqmaddu Ring",
    }

    sets.precast.WS.Dimidiation = {
        ammo="Knobkierrie",
        head="Lilitu Headpiece",
        body=gear.HQ.Adhemar.Body,
        hands="Meg. Gloves +2",
        legs=gear.HQ.Lustratio.Legs.B,
        feet=gear.HQ.Lustratio.Feet.D,
        neck="Caro Necklace",
        waist="Grunfeld Rope",
        left_ear=gear.Moonshade,
        right_ear="Sherida Earring",
        left_ring="Ilabrat Ring",
        right_ring="Niqmaddu Ring",
    }

    sets.precast.WS.Dimidiation.CappedAtt = {
        ammo="Knobkierrie",
        head="Lilitu Headpiece",
        body=gear.HQ.Adhemar.Body,
        hands="Meg. Gloves +2",
        legs=gear.HQ.Lustratio.Legs.B,
        feet=gear.HQ.Lustratio.Feet.D,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear=gear.Moonshade,
        right_ear="Sherida Earring",
        left_ring="Epona's Ring",
        right_ring="Niqmaddu Ring",
    }

    sets.precast.WS.Decimation = {
        ammo="Seeth. Bomblet +1",
        head=gear.HQ.Adhemar.A,
        body=gear.HQ.Adhemar,
        hands=gear.HQ.Adhemar.A,
        legs="Meg. Chausses +2",
        feet=gear.Herculean.Feet.TripleAttack,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Brutal Earring",
        right_ear="Sherida Earring",
        left_ring="Epona's Ring",
        right_ring="Rufescent Ring",
    }

    -- ra sets
    sets.precast.RA = {}

    -- item sets-
    sets.precast.Item = {}

    ------------------------------------------------------------
    -- midcast
    ------------------------------------------------------------
    -- midcast.[SPECIFIC_SET].[state.CastingMode]
    sets.midcast.Enmity = {
        -- enm +74
        ammo="Aqreqaq Bomblet",        -- enm +02 02
        body="Emet Harness +1",        -- enm +10 12
        hands="Kurys Gloves",          -- enm +09 21
        legs="Eri. Leg Guards +1",     -- enm +11 32
        feet="Erilaz greaves +1",      -- enm +06 38
        neck="Moonlight Necklace",     -- enm +15 53
        waist="Kasiri belt",           -- enm +03 56
        left_ear="Friomisi Earring",   -- enm +02 58
        left_ring="Begrudging Ring",   -- enm +05 63
        right_ring="Eihwaz Ring",      -- enm +05 68
        back=gear.JSE.RUN.Back.Enmity, -- enm +10 78
    }

    sets.midcast.Flash = sets.midcast.Enmity
    sets.midcast.Jettatura = sets.midcast.Enmity
    sets.midcast['Blank Gaze'] = sets.midcast.Enmity
    sets.midcast['Sheep song'] = sets.midcast.Enmity
    sets.midcast['Geist Wall'] = sets.midcast.Enmity

    sets.midcast.SIR = {
        -- sir -89
        ammo="Staunch Tathlum +1",     -- sir -11 -11
        head=gear.Taeon.Head.SIR,      -- sir -08 -19
        body=gear.Taeon.Body.SIR,      -- sir -10 -29
        hands=gear.Rawhide.Hands.B,    -- sir -15 -44
        legs=gear.HQ.Carmine.Legs,     -- sir -20 -64
        neck="Moonlight Necklace",     -- sir -15 -79
        left_ear="Halasz Earring",     -- sir -05 -84
        right_ring="Evanescence Ring", -- sir -05 -89
    }

    sets.midcast.EnhancingSkill = {
        -- enhancing skill +85
        head=gear.HQ.Carmine.D,                         -- enhancing skill +11 11
        hands="Runeist's mitons +2",                    -- enhancing skill +15 26
        legs=gear.HQ.Carmine,                           -- enhancing skill +18 44
        neck="Melic Torque",                            -- enhancing skill +10 54
        waist="Olympus Sash",                           -- enhancing skill +05 59
        left_ear="Andoaa Earring",                      -- enhancing skill +05 64
        left_ring=gear.Ring['Stikini Ring +1'].Left,   -- enhancing skill +08 72
        right_ring=gear.Ring['Stikini Ring +1'].Right, -- enhancing skill +08 80
        back="Merciful Cape",                           -- enhancing skill +05 85
    }

    sets.midcast.EnhancingDuration = set_combine(sets.midcast.EnhancingSkill, {
        head="Erilaz galea +1",
        legs="Futhark Trousers +1"
    })

    sets.midcast.BarElement = set_combine(sets.midcast.EnhancingSkill, sets.midcast.EnhancingDuration)

    sets.midcast.Phalanx = {
        -- phalanx +18
        -- enhancing skill +41
        head="Fu. Bandeau +3",                          -- phalanx +7 07
        body=gear.Taeon.Body.Phalanx,                   -- phalanx +3 10
        hands=gear.Taeon.Hands.Phalanx,                 -- phalanx +3 13
        legs=gear.Taeon.Legs.Phalanx,                   -- phalanx +3 16
        feet=gear.Taeon.Feet.Phalanx,                   -- phalanx +2 18
        neck="Melic Torque",                            -- enhancing skill +10 10
        waist="Olympus Sash",                           -- enhancing skill +05 15
        left_ear="Andoaa Earring",                      -- enhancing skill +05 20
        left_ring=gear.Ring['Stikini Ring +1'].Left,   -- enhancing skill +08 72
        right_ring=gear.Ring['Stikini Ring +1'].Right, -- enhancing skill +08 80
        back="Merciful Cape",                           -- enhancing skill +05 41
    }

    -- midcast.RA.[SPECIFIC_SET].[RANGED_SET]
    sets.midcast.RA = {}

    -- midcast.Item.[SPECIFIC_SET]
    sets.midcast.Item = {}

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
        head="Meghanada Visor +2",
        body="Futhark coat +3",
        hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
        feet="Turms Leggings +1",
        neck="Sanctity Necklace",
        waist="Flume Belt +1",
        left_ear="Odnowa Earring +1",
        right_ear="Odnowa Earring",
        left_ring="Meghanada Ring",
        right_ring="Stikini Ring +1",
        back="Moonlight Cape"
    }

    -- sets.idle.Weak = {}
    -- sets.idle.Town = {}
    -- sets.idle.Field = {}

    -- idle sets w/pet
    -- sets.idle.Weak.Pet = {}
    -- sets.idle.Town.Pet = {}
    -- sets.idle.Field.Pet = {}

    -- idle sets w/Engaged pet
    -- sets.idle.Weak.Pet.Engaged = {}
    -- sets.idle.Town.Pet.Engaged = {}
    -- sets.idle.Field.Pet.Engaged = {}

    ------------------------------------------------------------
    -- resting
    ------------------------------------------------------------
    -- resting.[state.RestingMode]
    sets.resting = {}

    ------------------------------------------------------------
    -- engaged
    ------------------------------------------------------------
    -- engaged.
    --  [state.Subjob].
    --  [state.CombatForm].
    --  [state.CombatSkill].
    --  [state.CombatWeapon].
    --  [state.CombatPosition].
    --  [state.OffenseMode].
    --  [state.HybridMode].
    --  [class.CustomMeleeGroups]...
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

    -- hybrid swaps
    sets.hybrid = {}
    sets.hybrid.Full = {
        ammo="Yamarang",
        body="Ashera Harness",
        legs="Meg. CHausses +2",
        neck="Futhark Torque +2",
        waist="Ioskeha belt +1",
        left_ring="Defending Ring",
    }

    -- h2h sets
    sets.engaged['H2H'] = {}

    -- 1 handed sets
    sets.engaged['1H'] = {
        ammo="Ginsen",
        head=gear.HQ.Adhemar.Head.A,
        body=gear.HQ.Adhemar.Body.A,
        hands=gear.HQ.Adhemar.Hands.A,
        legs="Samnuha Tights",
        feet=gear.Herculean.Feet.TripleAttack,
        neck="Anu Torque",
        waist="Windbuffet Belt +1",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Epona's Ring",
        right_ring="Niqmaddu Ring",
        back="Moonlight Cape"
    }
    sets.engaged['1H']['Hybrid-Full'] = set_combine(sets.engaged['1H'], sets.hybrid.Full)

    -- 2 handed sets
    sets.engaged['2H'] = {
        sub="Utu Grip",
        ammo="Ginsen",
        head=gear.HQ.Adhemar.Head.A,
        body=gear.HQ.Adhemar.Body.A,
        hands=gear.HQ.Adhemar.Hands.A,
        legs="Samnuha Tights",
        feet=gear.Herculean.Feet.TripleAttack,
        neck="Anu Torque",
        waist="Windbuffet Belt +1",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Epona's Ring",
        right_ring="Niqmaddu Ring",
        back="Moonlight Cape"
    }
    sets.engaged['2H']['Hybrid-Full'] = set_combine(sets.engaged['2H'], sets.hybrid.Full)

    -- dual wield
    sets.engaged['DW'] = {
        ammo="Ginsen",
        head=gear.HQ.Adhemar.Head.A,
        body=gear.HQ.Adhemar.Body.A,
        hands=gear.HQ.Adhemar.Hands.A,
        legs="Samnuha Tights",
        feet=gear.Herculean.Feet.TripleAttack,
        neck="Anu Torque",
        waist="Windbuffet Belt +1",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Epona's Ring",
        right_ring="Niqmaddu Ring",
        back="Moonlight Cape"
    }
    sets.engaged['DW']['Hybrid-Full'] = set_combine(sets.engaged['DW'], sets.hybrid.Full)

    ------------------------------------------------------------
    -- defense
    ------------------------------------------------------------
    -- defense.[state.Subjob].[state.PhysicalDefenseMode].[classes.CustomDefenseGroups]...
    -- defense.[state.Subjob].[state.MagicalDefenseMode].[classes.CustomDefenseGroups]...
    -- 
    -- customize_defense_set(defenseset)
    
    sets.defense.Idle = {
        sub="Alber Strap",
        ammo="Staunch Tathlum +1",
        head="Meghanada Visor +2",
        body="Futhark coat +3",
        hands="Turms Mittens +1",
        legs="Meg. Chausses +2",
        feet="Turms Leggings +1",
        neck="Futhark Torque +2",
        waist="Flume Belt +1",
        left_ear="Odnowa Earring +1",
        right_ear="Odnowa Earring",
        left_ring="Moonlight Ring",
        right_ring="Defending Ring",
        back="Moonlight Cape"
    }

    -- physical defense sets
    sets.defense.Default = {}
    sets.defense.Default.Idle = sets.defense.Idle
    sets.defense.Default.Engaged = {
        sub="Alber Strap",
        ammo="Staunch Tathlum +1",
        head="Turms Cap +1",
        body="Futhark coat +3",
        hands="Turms Mittens +1",
        legs="Eri. Leg Guards +1",
        feet="Turms Leggings +1",
        neck="Futhark Torque +2",
        waist="Flume Belt +1",
        left_ear="Odnowa Earring +1",
        right_ear="Odnowa Earring",
        left_ring="Moonlight Ring",
        right_ring="Defending Ring",
        back="Ogma's Cape",
    }

    sets.defense.PMed = {}
    sets.defense.PMed.Idle = sets.defense.Idle
    
    sets.defense.PHigh = {}
    sets.defense.PHigh.Idle = sets.defense.Idle
    
    sets.defense.PTurtle = {}
    sets.defense.PTurtle.Idle = sets.defense.Idle
    sets.defense.PTurtle.Engaged = sets.defense.Idle
    

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
    sets.running = {legs=gear.HQ.Carmine.Legs}

    ------------------------------------------------------------
    -- Weapon sets
    ------------------------------------------------------------
    -- Weapon sets to be toggled between via WeaponSetMode
    sets.weapons.Aettir = {
        main="Aettir",
    }
    
    sets.weapons['Dolichenus'] = {
        main="Dolichenus",
        sub="Firangi"
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
    local status = player.status
    if defenseset[status] then
        defenseset = defenseset[status]
    end
    return defenseset
end

----------------------------------------
-- job_get_custom_wsmode
----------------------------------------
function job_get_custom_wsmode(spell, spellMap, ws_mode)
    return ws_mode
end
