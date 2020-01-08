--------------------------------------------------------------------------------
-- Job specific setup
--------------------------------------------------------------------------------
function user_setup()
    -- Set any default Modes here
    state.WeaponSetMode:options('None', 'Father Time', 'Apocolypse', 'Ragnarok')
    state.WeaponSetMode:set('Father Time')
end

--------------------------------------------------------------------------------
-- Gear Sets
--------------------------------------------------------------------------------
function init_gear_sets()
    ------------------------------------------------------------
    -- precast
    ------------------------------------------------------------
    -- precast.FC.[SPECIFIC_SET].[state.CastingMode]
    sets.precast.FC = {
        ammo="Sapience Orb",
        head=gear.HQ.Carmine.Head.D,
        body=gear.Odyssean.Body.FC,
        hands="Leyline Gloves",
        legs=gear.Eschite.Legs.D,
        feet=gear.HQ.Carmine.Feet,
        neck="Voltsurge Torque",
        waist="Tempus Fugit +1",
        left_ear="Malignance Earring",
        right_ear="Loquac. Earring",
        left_ring="Prolix Ring",
    }
    sets.precast.FC['Enfeebling Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC['Dark Magic'] = set_combine(sets.precast.FC, {head="Fall. Burgeonet +3"})

    -- precast.JA.[SPECIFIC_SET].[classes.JAMode]
    sets.precast.JA['Blood Weapon'] = {body="Fallen's Cuirass +3"}
    sets.precast.JA['Arcane Circle'] = {}
    sets.precast.JA['Last Resort'] = {}
    sets.precast.JA['Weapon Bash'] = {}
    sets.precast.JA['Soul Eater'] = {}
    sets.precast.JA['Consume Mana'] = {}
    sets.precast.JA['Dark Seal'] = {head="Fallen's Burgeonet +3"}
    sets.precast.JA['Diabolic Eye'] = {hands="Fallen's Finger Gauntlets +3"}
    sets.precast.JA['Nether Void'] = {legs="Heathen's Flanchard +1"}
    sets.precast.JA['Arcane Crest'] = {}
    sets.precast.JA['Scarlet Delirium'] = {}
    sets.precast.JA['Soul Enslavement'] = {}

    -- precast.WS.[SPECIFIC_SET].[WS_MODE]
    -- Scythe Sets
    sets.precast.WS["Scythe-STR/INT"] = {
        ammo="Seething Bomblet +1",
        head="Fall. Burgeonet +3",
        body=gear.HQ.Argosy.Body.A,
        hands=gear.HQ.Argosy.Hands.D,
        legs="Fall. Flanchard +3",
        feet="Sulev. Leggings +2",
        neck="Abyssal Beads +2",
        waist="Prosilio Belt +1",
        left_ear=gear.Moonshade,
        right_ear="Mache Earring +1",
        left_ring="Niqmaddu Ring",
        right_ring="Epaminondas's Ring",
        back=gear.JSE.DRK.Back.WSD
    }

    sets.precast.WS["Scythe-STR/MND"] = {
        ammo="Seeth. Bomblet +1",
        head="Ratri Sallet +1",
        body="Ratri Plate +1",
        hands="Rat. Gadlings +1",
        legs={name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect'}},
        feet="Rat. Sollerets +1",
        neck="Abyssal Beads +2",
        waist="Prosilio Belt +1",
        left_ear=gear.Moonshade,
        right_ear="Ishvara Earring",
        left_ring="Rufescent Ring",
        right_ring="Epaminondas's Ring",
        back=gear.JSE.DRK.Back.WSD
    }
    
    sets.precast.WS["Scythe-INT"] = {
        ammo="Floestone",
        head="Ratri Sallet +1",
        body="Ratri Plate +1",
        hands="Rat. Gadlings +1",
        legs={name="Fall. Flanchard +3",
              augments={'Enhances "Muted Soul" effect'}},
        feet="Rat. Sollerets +1",
        neck="Fotia Gorget",
        waist="Prosilio Belt +1",
        left_ear={name="Moonshade Earring",
                  augments={'Accuracy+4','TP Bonus +250'}},
        right_ear="Mache Earring +1",
        left_ring="Shiva Ring +1",
        right_ring="Shiva Ring +1",
        back=gear.JSE.DRK.Back.WSD
    }

    -- GSWD Sets
    sets.precast.WS["GSWD-STR"] = {
        ammo="Seething Bomblet +1",
        head=gear.HQ.Argosy.Head.D,
        body=gear.HQ.Argosy.Body.A,
        hands=gear.HQ.Argosy.Hands.D,
        legs=gear.HQ.Argosy.Legs.A,
        feet=gear.HQ.Argosy.Feet.A,
        neck="Abyssal Beads +2",
        waist="Prosilio Belt +1",
        left_ear={name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250'}},
        right_ear="Mache Earring +1",
        left_ring="Niqmaddu Ring",
        right_ring="Rufescent Ring",
        back=gear.JSE.DRK.Back.WSD
    }

    sets.precast.WS["STR/VIT"] = {
        ammo="Seeth. Bomblet +1",
        head={name="Fall. Burgeonet +3",
              augments={'Enhances "Dark Seal" effect',}},
        body={name="Fall. Cuirass +3",
              augments={'Enhances "Blood Weapon" effect',}},
        hands={name="Fall. Fin. Gaunt. +3",
               augments={'Enhances "Diabolic Eye" effect',}},
        legs={name="Fall. Flanchard +3",
              augments={'Enhances "Muted Soul" effect',}},
        feet="Sulev. Leggings +2",
        neck="Abyssal Beads +2",
        waist="Prosilio Belt +1",
        left_ear={name="Moonshade Earring",
                  augments={'Accuracy+4','TP Bonus +250'}},
        right_ear="Ishvara Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Epaminondas's Ring",
        back=gear.JSE.DRK.Back.WSD
    }

    sets.precast.WS["GSWD-VIT"] = {
        ammo="Seeth. Bomblet +1",
        head={name="Fall. Burgeonet +3",
              augments={'Enhances "Dark Seal" effect'}},
        body={name="Fall. Cuirass +3",
              augments={'Enhances "Blood Weapon" effect'}},
        hands="Rat. Gadlings +1",
        legs={name="Fall. Flanchard +3",
              augments={'Enhances "Muted Soul" effect'}},
        feet="Sulev. Leggings +2",
        neck="Abyssal Beads +2",
        waist="Prosilio Belt +1",
        left_ear={name="Moonshade Earring",
                  augments={'Accuracy+4','TP Bonus +250'}},
        right_ear="Ishvara Earring",
        left_ring="Titan Ring",
        right_ring="Epaminondas's Ring",
        back=gear.JSE.DRK.Back.WSD
    }

    -- Scythe
    ---- Guillotine
    sets.precast.WS["Guillotine"] = set_combine(sets.precast.WS["Scythe-STR/MND"], {neck="Fotia Gorget"})

    ---- Cross Reaper
    sets.precast.WS["Cross Reaper"] = {
        ammo="Knobkierrie",
        head="Ratri Sallet +1",
        body="Ratri Plate +1",
        hands="Rat. Gadlings +1",
        legs={name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect'}},
        feet="Rat. Sollerets +1",
        neck="Abyssal Beads +2",
        waist="Fotia Belt",
        left_ear=gear.Moonshade,
        right_ear="Ishvara Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Epaminondas's Ring",
        back=gear.JSE.DRK.Back.WSD
    }

    ---- Spiral Hell
    sets.precast.WS["Spiral Hell"] = sets.precast.WS["Scythe-STR/INT"]

    ---- Infernal Scythe
    sets.precast.WS["Infernal Scythe"] = sets.precast.WS["Scythe-STR/INT"]

    ---- Entropy
    sets.precast.WS["Entropy"] = set_combine(sets.precast.WS["Scythe-INT"], {neck="Fotia Gorget"})

    ---- Catastrophe
    sets.precast.WS["Catastrophe"] = {
        ammo="Knobkierrie",
        head="Ratri Sallet +1",
        body="Ratri Plate +1",
        hands="Rat. Gadlings +1",
        legs={name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect'}},
        feet="Rat. Sollerets +1",
        neck="Abyssal Beads +2",
        waist="Prosilio Belt +1",
        left_ear="Ishvara Earring",
        right_ear="Mache Earring +1",
        left_ring="Niqmaddu Ring",
        right_ring="Epaminondas's Ring",
        back=gear.JSE.DRK.Back.WSD
    }

    ---- Quietus
    sets.precast.WS["Quietus"] = sets.precast.WS["Cross Reaper"]

    ---- Insurgency
    sets.precast.WS["Insurgency"] = set_combine(sets.precast.WS["Scythe-STR/INT"], {neck="Fotia Gorget"})

    -- Great Sword
    ---- Spinning Slash
    sets.precast.WS["Spinning Slash"] = sets.precast.WS["GSWD-STR/INT"]

    ---- Ground Strike
    sets.precast.WS["Ground Strike"] = sets.precast.WS["GSWD-STR/INT"]

    ---- Herculean Slash
    sets.precast.WS["Herculean Slash"] = sets.precast.WS["GSWD-VIT"]

    ---- Resolution
    sets.precast.WS["Resolution"] = set_combine(sets.precast.WS["GSWD-STR"], {neck="Fotia Gorget", waist="Fotia belt"})

    ---- Scourge
    sets.precast.WS["Scourge"] = sets.precast.WS["GSWD-STR/VIT"]

    ---- Torcleaver
    sets.precast.WS["Torcleaver"] = sets.precast.WS["GSWD-VIT"]

    -- precast.RA.[SPECIFIC_SET].[RANGED_SET]
    -- precast.Item.[SPECIFIC_SET]

    ------------------------------------------------------------
    -- midcast
    ------------------------------------------------------------
    -- midcast.RA.[SPECIFIC_SET].[RANGED_SET]
    -- midcast.Item.[SPECIFIC_SET]
    -- midcast.[SPECIFIC_SET].[state.CastingMode]
    -- Dark Magic
    sets.midcast['Dark Magic'] = {
        head="Pixie Hairpin +1",
        body=gear.HQ.Carmine.Body.D,
        hands={name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect'}},
        legs=gear.Eschite.Legs.D,
        feet="Rat. Sollerets +1",
        neck="Sanctity Necklace",
        waist="Casso Sash",
        left_ear="Dark Earring",
        right_ear="Friomisi Earring",
        left_ring="Shiva Ring +1",
        right_ring="Evanescence Ring",
        back="Chuparrosa Mantle"
    }

    ---- Drain/Aspir
    sets.midcast['Dark Magic']['Drain'] = set_combine(sets.midcast['Dark Magic'], {
        ammo="Pemphredo Tathlum",
        head={name="Fall. Burgeonet +3", augments={'Enhances "Dark Seal" effect',}},
        neck="Erra pendant",
        left_ear="Enchntr. Earring +1",
        right_ear="Digni. Earring"
    })
    sets.midcast['Dark Magic']['Aspir'] = sets.midcast['Drain']

    ---- Absorb
    sets.midcast['Dark Magic']['Absorb'] = set_combine(sets.midcast['Dark Magic'], {})

    ---- Dread Spikes
    sets.midcast['Dark Magic']['Dread Spikes'] = {
        head="Ratri Sallet +1",
        body="Heath. Cuirass +1",
        hands="Rat. Gadlings +1",
        legs="Ratri Cuisses +1",
        feet="Rat. Sollerets +1",
        neck="Dualism Collar +1",
        waist="Oneiros Belt",
        left_ear="Odnowa Earring +1",
        right_ear="Odnowa Earring",
        left_ring="Moonlight Ring",
        right_ring="Moonlight Ring",
        back="Moonlight Cape",
    }

    ---- Stun
    sets.midcast['Dark Magic']['Stun'] = {
        ammo="Hydrocera",
        head=gear.HQ.Carmine.Head.D,
        body=gear.HQ.Carmine.Body.D,
        hands="Fall. Fin. Gaunt. +3",
        legs="Fall. Flanchard +3",
        feet="Flam. Gambieras +2",
        neck="Abyssal Beads +2",
        waist="Eschan Stone",
        left_ear="Digni. Earring",
        right_ear="Enchntr. Earring +1",
        left_ring="Shiva Ring +1",
        right_ring="Evanescence Ring",
        back="Chuparrosa Mantle"
    }

    ---- Absorb TP
    sets.midcast['Dark Magic']['Absorb-TP'] = set_combine(sets.midcast['Dark Magic']['Absorbs'], {hands="Heathen's Gauntlets +1"})

    -- Elemental Magic
    sets.midcast['Elemental Magic'] = {
        ammo="Seeth. Bomblet +1",
        head=gear.HQ.Carmine.Head.D,
        body={name="Fall. Cuirass +3",
              augments={'Enhances "Blood Weapon" effect'}},
        hands=gear.HQ.Carmine.Hands.D,
        legs=gear.HQ.Carmine.Legs.B,
        feet=gear.HQ.Carmine.Feet.B,
        neck="Sanctity Necklace",
        waist="Eschan Stone",
        left_ear="Friomisi Earring",
        right_ear="Hecate's Earring",
        left_ring="Shiva Ring +1",
        right_ring="Shiva Ring +1",
        back={name="Ankou's Mantle",
              augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%'}}}

    ------------------------------------------------------------
    -- midcast.Pet
    ------------------------------------------------------------
    -- midcast.Pet.[SPECIFIC_SET].[state.CastingMode]
    -- midcast.Pet.[SPECIFIC_SET].[state.OffenseMode]

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
    --  |- job_customize_idle_set
    --  |- [CUSTOM_COMMON]

    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Sulevia's Mask +2",
        body="Sulevia's Plate. +2",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Sulev. Leggings +2",
        neck="Twilight Torque",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        left_ring="Moonlight Ring",
        right_ring="Defending Ring",
        back=gear.JSE.DRK.Back.STP,
    }

    ------------------------------------------------------------
    -- resting
    ------------------------------------------------------------
    -- resting.[state.RestingMode]

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
    -- customize_melee_set(idleset)
    
    -- 2H
    sets.engaged["2H"] = {
        ammo="Ginsen",
        head="Flam. Zucchetto +2",
        body="Flamma Korazin +2",
        hands="Flamma Manopolas +2",
        legs=gear.Odyssean.Legs.STP,
        feet="Flam. Gambieras +2",
        neck="Abyssal Beads +2",
        waist="Ioskeha Belt +1",
        left_ear="Brutal Earring",
        right_ear="Cessance Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Flamma Ring",
        back=gear.JSE.DRK.Back.STP
    }

    sets.engaged["2H"]["Acc-1250"] = set_combine(sets.engaged["2H"], {
    })

    sets.engaged["2H"]["Acc-1300"] = set_combine(sets.engaged["2H"], {
        left_ear="Telos Earring",
        body=gear.HQ.Emicho.Body.B,
    })

    sets.engaged["2H"]["Acc-1350"] = set_combine(sets.engaged["2H"], {
    })

    sets.engaged.WAR = set_combine(sets.engaged)

    sets.engaged.SAM = set_combine(sets.engaged, {
        back=gear.JSE.DRK.Back.DoubleAttack
    })

    -- Acc
    sets.engaged.Acc = {
        ammo="Seething Bomblet +1",
        head={name="Carmine Mask +1",
              augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4'}},
        body={name="Emicho Haubert +1",
              augments={'HP+65','DEX+12','Accuracy+20'}},
        hands={name="Emi. Gauntlets +1",
               augments={'HP+65','DEX+12','Accuracy+20'}},
        legs={name="Carmine Cuisses +1",
              augments={'Accuracy+12','DEX+12','MND+20'}},
        feet={name="Carmine Greaves +1",
              augments={'Accuracy+12','DEX+12','MND+20'}},
        neck="Abyssal Beads +2",
        waist="Kentarch Belt +1",
        left_ear="Brutal Earring",
        right_ear="Cessance Earring",
        left_ring="Chirich Ring +1",
        right_ring="Moonlight Ring",
        back={name="Ankou's Mantle",
              augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%'}}}

     -- HighAcc
     sets.engaged.HighAcc = {
        ammo="Seething Bomblet +1",
        head="Flam. Zucchetto +2",
        body={name="Emicho Haubert +1",
              augments={'HP+65','DEX+12','Accuracy+20'}},
        hands={name="Emi. Gauntlets +1",
               augments={'HP+65','DEX+12','Accuracy+20'}},
        legs={name="Carmine Cuisses +1",
              augments={'Accuracy+12','DEX+12','MND+20'}},
        feet="Flam. Gambieras +2",
        neck="Abyssal Beads +2",
        waist="Ioskeha Belt +1",
        left_ear="Digni. Earring",
        right_ear="Cessance Earring",
        left_ring="Chirich Ring +1",
        right_ring="Moonlight Ring",
        back={name="Ankou's Mantle",
              augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%'}}}

    -- DT
    sets.engaged.DT = {
        ammo="Staunch Tathlum +1",
        head="Sulevia's Mask +2",
        body="Sulevia's Plate. +2",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Sulev. Leggings +2",
        neck="Twilight Torque",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        left_ring="Moonlight Ring",
        right_ring="Defending Ring",
        back={name="Ankou's Mantle",
              augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%'}}}


    ------------------------------------------------------------
    -- defense
    ------------------------------------------------------------
    -- defense.[state.Subjob].[state.PhysicalDefenseMode].[classes.CustomDefenseGroups]...
    -- defense.[state.Subjob].[state.MagicalDefenseMode].[classes.CustomDefenseGroups]...
    -- 
    -- customize_defense_set(defenseset)

    ------------------------------------------------------------
    -- kiting
    ------------------------------------------------------------
    -- Kiting
    sets.Kiting = {}

    ------------------------------------------------------------
    -- running
    ------------------------------------------------------------
    -- running
    sets.running = {legs=gear.HQ.Carmine.Legs}

    ------------------------------------------------------------
    -- Weapon sets
    ------------------------------------------------------------
    -- Weapon sets to be toggled between via WeaponSetMode
    sets.weapons['Father Time'] = {
        main="Father Time",
        sub="Utu Grip",
    }
    
    sets.weapons.Apocolypse = {
        main="Apocalypse",
        sub="Utu Grip",
    }

    sets.weapons.Ragnarok = {
        main="Ragnarok",
        sub="Utu Grip",
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
