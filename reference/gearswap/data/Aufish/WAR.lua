--------------------------------------------------------------------------------
-- Job specific setup
--------------------------------------------------------------------------------
function user_setup()
    -- Set any default Modes here
    state.WeaponSetMode:options("None", "Dolichenus", "Reikiono", "Labraunda", "Ragnarok")
    state.WeaponSetMode:set("Labraunda")
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
    sets.precast.WS = {}

    ---- Sword
    ---- G.Sword
    sets.precast.WS['Resolution'] = {
        ammo="Seeth. Bomblet +1",
        head={ name="Argosy Celata +1", augments={'DEX+12','Accuracy+20','"Dbl.Atk."+3',}},
        body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
        hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
        legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
        feet={ name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Telos Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Petrov Ring",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10','Damage taken-5%',}},
    }

    ---- Axe
    sets.precast.WS.Decimation = {
        ammo="Seeth. Bomblet +1",
    head={ name="Argosy Celata +1", augments={'DEX+12','Accuracy+20','"Dbl.Atk."+3',}},
    body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
    hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
    legs={ name="Agoge Cuisses +3", augments={'Enhances "Warrior\'s Charge" effect',}},
    feet="Pumm. Calligae +3",
    neck="War. Beads +2",
    waist="Fotia Belt",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10','Damage taken-5%',}},
    }

    ---- G.Axe
    sets.precast.WS['Full Break'] = {
        ammo="Knobkierrie",
        head="Agoge Mask +3",
        body="Sulevia's Plate. +2",
        hands="Sulev. Gauntlets +2",
        legs="Sulev. Cuisses +2",
        feet="Sulev. Leggings +2",
        neck="War. Beads +2",
        waist="Prosilio Belt +1",
        left_ear="Odnowa Earring +1",
        right_ear="Ishvara Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Epaminondas's Ring",
        back={name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10','Damage taken-5%'}},
    }

    sets.precast.WS['Fell Cleave'] = {
        ammo="Knobkierrie",
        head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
        body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
        hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
        legs={ name="Argosy Breeches +1", augments={'STR+12','DEX+12','Attack+20',}},
        feet="Sulev. Leggings +2",
        neck="Fotia Gorget",
        waist="Prosilio Belt +1",
        left_ear="Odnowa Earring +1",
        right_ear="Ishvara Earring",
        left_ring="Regal Ring",
        right_ring="Epaminondas's Ring",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10','Damage taken-5%',}},
    }
    
    sets.precast.WS['Ukko\'s Fury'] = sets.precast.WS['Fell Cleave']
    
    sets.precast.WS['Upheaval'] = {
        ammo="Knobkierrie",
        head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
        body="Sulevia's Plate. +2",
        hands="Sulev. Gauntlets +2",
        legs={ name="Agoge Cuisses +3", augments={'Enhances "Warrior\'s Charge" effect',}},
        feet="Sulev. Leggings +2",
        neck="War. Beads +2",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Regal Ring",
        right_ring="Epaminondas's Ring",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10','Damage taken-5%',}},
    }

    ---- Polearm

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
    
    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Arke zuchetto +1",
        body="Arke corazza +1",
        hands="Arke manopolas +1",
        legs="Arke cosciales +1",
        feet="Arke gambieras +1",
        neck="War. Beads +2",
        waist="Gishdubar Sash",
        left_ear="Odnowa Earring +1",
        right_ear="Odnowa Earring",
        left_ring="Moonlight Ring",
        right_ring="Moonlight Ring",
        back="Moonlight Cape",
    }

    -- idle sets
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

    sets.engaged = {
        ammo="Ginsen",
        head="Flam. Zucchetto +2",
        body="Agoge Lorica +3",
        hands="Flamma Manopolas +2",
        legs="Agoge cuisses +3",
        feet="Pumm. Calligae +3",
        neck="War. Beads +2",
        waist="Ioskeha Belt +1",
        left_ear="Brutal Earring",
        right_ear="Cessance Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Flamma Ring",
        back=gear.JSE.WAR.Back.DoubleAttack
    }

    -- h2h sets
    sets.engaged['H2H'] = {}

    -- 1 handed sets
    sets.engaged['1H'] = {}

    -- 2 handed sets
    sets.engaged['2H'] = {
        ammo="Ginsen",
        head="Flam. Zucchetto +2",
        body="Agoge Lorica +3",
        hands="Flamma Manopolas +2",
        legs="Agoge cuisses +3",
        feet="Pumm. Calligae +3",
        neck="War. Beads +2",
        waist="Ioskeha Belt +1",
        left_ear="Brutal Earring",
        right_ear="Cessance Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Flamma Ring",
        back=gear.JSE.WAR.Back.DoubleAttack
    }

    -- dual wield
    sets.engaged['DW'] = {
        ammo="Ginsen",
        head="Flam. Zucchetto +2",
        body="Emicho Haubert +1",
        hands="Emi. Gauntlets +1",
        legs="Agoge cuisses +3",
        feet="Pumm. Calligae +3",
        neck="War. Beads +2",
        waist="Ioskeha Belt +1",
        left_ear="Suppanomimi",
        right_ear="Brutal Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Petrov Ring",
        back=gear.JSE.WAR.Back.DoubleAttack
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
        left_ring = "Shneddick Ring",
    }

    ------------------------------------------------------------
    -- Weapon sets
    ------------------------------------------------------------
    -- Weapon sets to be toggled between via WeaponSetMode
    sets.weapons = {}

    sets.weapons.Dolichenus = {
        main="Dolichenus",
        sub="Barbarity +1"
    }

    sets.weapons.Reikiono = {
        main="Reikiono",
        sub="Utu Grip",
    }

    sets.weapons.Labraunda = {
        main="Labraunda",
        sub="Utu Grip",
    }

    sets.weapons.Ragnarok = {
        main="Ragnarok",
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
