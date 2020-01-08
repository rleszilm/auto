--------------------------------------------------------------------------------
-- Job specific setup
--------------------------------------------------------------------------------
function user_setup()
    -- Set any default Modes here
    state.WeaponSetMode:options("None", "Crocea", "CroceaSeraph", "Tauret", 'Raetic')
    state.WeaponSetMode:set("Crocea")
end

--------------------------------------------------------------------------------
-- Gear Sets
--------------------------------------------------------------------------------
function init_gear_sets()
    ------------------------------------------------------------
    -- ELEMENTAL_GEAR
    ------------------------------------------------------------
    -- defaults for elemental gear swaps as provided by mote
    -- gear.ElementalGorget.name - Fotia Gorget    | gear.default_weaponskill_neck  | ""
    gear.default_weaponskill_neck = ""
    -- gear.ElementalBelt.name   - Fotia Belt      | gear.default.weaponskill_waist | ""
    gear.default.weaponskill_waist = ""
    -- gear.ElementalObi.name    - Hachirin-no-obi | gear.default.obi_waist         | ""
    gear.default.obi_waist = "Eschan stone"
    -- gear.ElementalCape.name   - if Obi: Twilight Cape else: gear.default.obi_back
    gear.default.obi_back = gear.JSE.RDM.Back.MAB
    -- gear.ElementalRing.name   - if Obi and Not Divine|Dark|Healing|Impact: Zodiac Ring else: gear.default.obi_ring
    gear.default.obi_ring = "Shiva ring +1"
    -- gear.FastcastStaff.name   - elemental staff | gear.default.fastcast_staff    | ""
    gear.default.fastcast_staff = ""
    -- gear.FastcastStaff.name   - elemental staff | gear.default.recast_staff      | ""
    gear.default.recast_staff = ""

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
    sets.precast.FC = {
        ammo="Impatiens",                -- 00|02 00|02
        head=gear.HQ.Carmine.Head.D,     -- 14|00 14|02
        body="Viti. Tabard +3",          -- 13|00 27|02
        hands="Leyline Gloves",          -- 07|00 34|02  -- uncapped
        legs="Gyve Trousers",            -- 04|00 38|02
        feet=gear.HQ.Carmine.Feet.B,     -- 08|00 46|02
        waist="Witful Belt",             -- 03|03 49|05
    }

    -- ja sets
    sets.precast.JA = {}

    sets.precast.JA.Chainspell = {}
    sets.precast.JA.Convert = {}
    sets.precast.JA.Composure = {}
    sets.precast.JA.Saboteur = {}
    sets.precast.JA.Spontaneity = {}
    sets.precast.JA.Stymie = {}

    -- ws sets
    sets.precast.WS = {}

    sets.precast.WS.Evisceration = {
        ammo="Yetshila +1",
        head=gear.Taeon.Head.TripleAttack,
        body="Ayanmo Corazza +2",
        hands=gear.Taeon.Hands.TripleAttack,
        legs=gear.Taeon.Legs.TripleAttack,
        feet="Aya. Gambieras +1",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Mache Earring +1",
        right_ear="Sherida Earring",
        left_ring="Ilabrat Ring",
        right_ring="Begrudging Ring",
    }

    sets.precast.WS['Savage Blade'] = {
        ammo="Quartz Tathlum +1",
        head="Viti. Chapeau +3",
        body="Ayanmo Corazza +2",
        hands="Jhakri Cuffs +2",
        legs=gear.HQ.Carmine.Legs.B,
        feet="Jhakri Pigaches +2",
        neck="Dls. Torque +2",
        waist="Prosilio Belt +1",
        left_ear="Ishvara Earring",
        right_ear=gear.Moonshade,
        left_ring="Rufescent Ring",
        right_ring="Epaminondas's Ring",
        back="Moonlight Cape",
    }

    sets.precast.WS['Sanguine Blade'] = {
        ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",
        body="Amalric Doublet +1",
        hands="Jhakri Cuffs +2",
        legs="Amalric Slops +1",
        feet="Jhakri Pigaches +2",
        neck="Sanctity necklace",
        ear1="Friomisi Earring",
        ear2="Regal Earring",
        ring1="Archon Ring",
        ring2="Epaminondas's Ring",
        waist="Orpheus's Sash",
    }

    sets.precast.WS['Seraph Blade'] = {
        ammo="Pemphredo Tathlum",
        head="Viti. Chapeau +3",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +2",
        legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        feet="Vitiation Boots +3",
        neck="Sanctity Necklace",
        waist="Orpheus's Sash",
        left_ear=gear.Moonshade,
        right_ear="Regal Earring",
        left_ring="Shiva Ring +1",
        right_ring="Epaminondas's Ring",
        back={name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10'}},
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

    -- magic sets
    ---- divine
    ---- healing
    ---- enhancing
    sets.midcast['Enhancing Magic'] = {
        -- enhancing skill +130 - 586
        head=gear.HQ.Carmine.Head.D,       -- +11  11
        body="Viti. Tabard +3",       -- +19  30
        hands="Viti. Gloves +3",      -- +20  50
        legs="Atrophy Tights +2",     -- +19  69
        feet="Leth. Houseaux +1",     -- +20  89
        neck="Melic Torque",          -- +10  99
        waist="Olympus Sash",         -- +05 104
        left_ear="Andoaa Earring",    -- +05 109
        left_ring={name="Stikini Ring +1", bag="Inventory"},  -- +08 117
        right_ring={name="Stikini Ring +1", bag="Wardrobe 3"}, -- +08 125
        back="Merciful Cape",         -- +05 130
    }

    sets.midcast['Enhancing Magic'].Duration = set_combine(sets.midcast['Enhancing Magic'], {
        hands="Atrophy Gloves +3",
        neck="Dls. Torque +2",
        back=gear.JSE.RDM.Back,
    })

    sets.midcast['Enhancing Magic'].Gain = set_combine(sets.midcast['Enhancing Magic'].Duration, {
        hands="Viti. Gloves +3",
    })

    sets.midcast['Enhancing Magic'].Skill = set_combine(sets.midcast['Enhancing Magic'], {
        main="Pukulatmuj +1",
    })

    sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
        body=gear.Taeon.Body.Phalanx,
        hands=gear.Taeon.Hands.Phalanx,
        legs=gear.Taeon.Legs.Phalanx,
        feet=gear.Taeon.Feet.Phalanx,
    })

    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'].Duration, {
        head=gear.HQ.Amalric.Head,
        body="Atrophy Tabard +3",
        waist="Gishdubar Sash",
    })

    sets.midcast.StoneSkin = set_combine(sets.midcast['Enhancing Magic'].Duration, {
        neck="Nodens gorget",
        waist="Siegel sash",
    })

    ---- enfeebling
    sets.midcast['Enfeebling Magic'] = {
        ammo="Hydrocera",
        head="Viti. Chapeau +3",
        body="Atrophy Tabard +3",
        hands=gear.HQ.Kaykaus.Hands.A,
        legs=gear.Chironic.Legs.MAcc,
        feet="Vitiation Boots +3",
        neck="Dls. Torque +2",
        waist="Luminary Sash",
        left_ear="Digni. Earring",
        right_ear="Malignance Earring",
        left_ring={name="Stikini Ring +1", bag="Inventory"},
        right_ring={name="Stikini Ring +1", bag="Wardrobe 3"},
        back=gear.JSE.RDM.Back.MAccMND,
    }
    sets.midcast['Enfeebling Magic'].Accuracy = sets.midcast['Enfeebling Magic']

    sets.midcast['Enfeebling Magic'].Potency = set_combine(sets.midcast['Enfeebling Magic'].Accuracy, {
        head="Viti. Chapeau +3",
        --body="Lethargy Sayon +1", -- empy body
    })
    sets.midcast['Enfeebling Magic'].Potency.Skill = sets.midcast['Enfeebling Magic'].Potency

    sets.midcast['Enfeebling Magic'].Potency.MND = set_combine(sets.midcast['Enfeebling Magic'].Accuracy, {
        head="Viti. Chapeau +3",
    })

    sets.midcast['Enfeebling Magic'].Potency.INT =  set_combine(sets.midcast['Enfeebling Magic'].Potency.MND, {
        --back=gear.JSE.RDM.Back.MAccINT
    })

    sets.midcast.Dispel = set_combine(sets.midcast['Enfeebling Magic'].Accuracy, {
        neck="Dls. Torque +2" -- Dispel +1
    })

    ---- elemental
    sets.midcast['Elemental Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Jhakri Coronal +2",
        body=gear.HQ.Amalric.Body.A,
        hands=gear.HQ.Amalric.Hands.D,
        legs=gear.HQ.Amalric.Legs.A,
        feet=gear.HQ.Amalric.Feet.D,
        neck="Sanctity Necklace",
        waist=gear.ElementalObi,
        left_ear="Friomisi Earring",
        right_ear="Malignance Earring",
        left_ring=gear.ElementalRing,
        right_ring="Shiva Ring +1",
        back=gear.ElementalCape,
    }

    ---- elemental burst
    sets.midcast['Elemental Magic'].Burst = set_combine(sets.midcast['Elemental Magic'], {
        main="Raetic Staff +1",
        sub="Enki Strap",
        head="Ea Hat +1",
        body="Ea Houppe. +1",
        legs="Ea Slops +1",
        feet="Ea Pigaches +1",
        right_ring="Mujin Band",
    })

    ---- dark
    sets.midcast.Aspir = set_combine(sets.midcast['Elemental Magic'], {
        ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",
        body=gear.HQ.Carmine.Body.D,
        feet="Merlinic Crackows",
        neck="Erra Pendant",
        waist="Fucho-no-Obi",
        left_ear="Digni. Earring",
        right_ear="Malignance Earring",
        left_ring="Evanescence Ring",
        right_ring="Archon Ring",
        back=gear.ElementalCape,
    })
    sets.midcast.Drain = sets.midcast.Aspir

    sets.midcast.Stun =  set_combine(sets.midcast['Enfeebling Magic'].Accuracy, {

    })
    
    -- ra sets
    sets.midcast.RA = {}

    -- item sets
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
        head="Viti. Chapeau +3",
        body="Jhakri Robe +2",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Twilight Torque",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Infused Earring",
        left_ring="Stikini Ring +1",
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
    sets.engaged['2H'] = {}

    -- dual wield
    sets.engaged['DW'] = {
        ammo="Ginsen",
        head=gear.Taeon.Head.TripleAttack,
        body="Ayanmo Corazza +2",
        hands=gear.Taeon.Hands.TripleAttack,
        legs=gear.Taeon.Legs.TripleAttack,
        feet=gear.HQ.Carmine.Feet.B,
        neck="Anu Torque",
        waist="Reiki Yotai",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Ilabrat Ring",
        right_ring="Hetairoi Ring",
        back=gear.JSE.RDM.Back.DW,
    }

    sets.engaged['DW']['Enspell'] = set_combine(sets.engaged['DW'], {
        hands="Aya. Manopolas +2",
        waist="Orpheus's Sash",
    })

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
    sets.running = {
        legs=gear.HQ.Carmine.Legs
    }

    ------------------------------------------------------------
    -- Weapon sets
    ------------------------------------------------------------
    -- Weapon sets to be toggled between via WeaponSetMode
    sets.weapons.Crocea = {
        main="Crocea Mors",
        sub="Ternion dagger +1",
    }

    sets.weapons.CroceaSeraph = {
        main="Crocea Mors",
        sub="Daybreak",
    }
    
    sets.weapons.Tauret = {
        main="Tauret",
        sub="Ternion dagger +1",
    }

    sets.weapons.Raetic = {
        main="Raetic staff +1",
        sub="Enki strap",
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
function job_customize_idle_set(idleset)
    return idleset
end

----------------------------------------
-- job_customize_melee_set
----------------------------------------
function job_customize_melee_set(meleeset)
    if state.Buff.Enspell and meleeset.Enspell then
        meleeset = meleeset.Enspell
    end

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
