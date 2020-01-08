--------------------------------------------------------------------------------
-- Job specific setup
--------------------------------------------------------------------------------
function user_setup()
    -- Flags for Weapon Set Mode
    state.WeaponSetMode:options('Normal', 'Rostam.A', 'Rostam.B', 'Rostams', 'Fettering Blade', 'Naegling')
    state.WeaponSetMode:set('Rostam.B')

    state.RangedWeaponSetMode:options('Normal', 'Death Penalty', 'Anarchy')
    state.RangedWeaponSetMode:set('Death Penalty')

    state.AmmoSetMode:options("Living Bullet")
    state.AmmoSetMode:set('Living Bullet')
end

--------------------------------------------------------------------------------
-- Job specific binds
--------------------------------------------------------------------------------
function job_bind_on_load()
    -- ^ - Ctrl
    -- ! - Alt
    -- @ - Win
    -- # - Apps

    Binds:Bind("^s",   "gs c autoshoot")
    Binds:Bind("@r",   "gs c autoroll")
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
    --- phantom rolls
    sets.precast.JA.CorsairRoll = {
        main=gear.JSE.COR.Main.Rostam.C,
        sub="Nusku Shield",
        range=gear.JSE.COR.Range.Compensator.D,
        head="Lanun Tricorne +3",
        hands="Chasseur's Gants +1",
        legs=gear.DesulatorTassets,
        neck="Regal Necklace",
        left_ring="Luzaf's Ring",
        back=gear.JSE.COR.Back
    }

    ---- quick draw
    sets.precast.JA.CorsairShot = {
        ammo="Living Bullet",
        head="Laksamana's Hat +1",
        body="Lanun Frac +3",
        hands=gear.HQ.Carmine.Hands.D,
        legs=gear.Herculean.Legs.HybridWSD,
        feet="Lanun Bottes +3",
        neck="Comm. Charm +2",
        waist="Eschan Stone",
        left_ear="Friomisi Earring",
        right_ear="Hecate's Earring",
        left_ring="Dingir Ring",
        right_ring="Fenrir Ring +1",
        back=gear.JSE.COR.Back.HybridWSD,
    }

    sets.precast.JA.CorsairShot['Acc+'] = {
        ammo="Living Bullet",
        head="Mummu Bonnet +2",
        body="Mummu Jacket +2",
        hands="Mummu Wrists +2",
        legs="Mummu Kecks +2",
        feet="Mummu Gamash. +2",
        neck="Comm. Charm +2",
        waist="K. Kachina Belt +1",
        left_ear="Digni. Earring",
        right_ear="Enchntr. Earring +1",
        left_ring="Mummu Ring",
        right_ring="Stikini Ring +1",
        back=gear.JSE.COR.Back.HybridWSD,
    }

    -- precast.WS.[SPECIFIC_SET].[WS_MODE]
    ---- sword ws's
    sets.precast.WS['Savage Blade'] = {
        head="Lilitu Headpiece",
        body="Laksa. Frac +3",
        hands="Meg. Gloves +2",
        legs="Samnuha Tights",
        feet="Lanun Bottes +3",
        neck="Comm. Charm +2",
        waist="Prosilio Belt +1",
        left_ear="Ishvara Earring",
        right_ear=gear.Moonshade,
        left_ring="Rufescent Ring",
        right_ring="Epaminondas's Ring",
        back=gear.JSE.COR.Back.HybridWSD,
    }

    ---- dagger ws's
    sets.precast.WS.Evisceration = {
        head=gear.HQ.Adhemar.Head.A,
        body="Abnoba Kaftan",
        hands="Mummu wrists +2",
        legs="Samnuha Tights",
        feet="Mummu Gamashes +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Mache Earring +1",
        right_ear=gear.Moonshade,
        left_ring="Begrudging Ring",
        right_ring="Mummu Ring",
        back=gear.JSE.COR.Back.DoubleAttack
    }

    ---- marksmanship ws's
    sets.precast.WS['Leaden Salute'] = {
        ammo="Living Bullet",
        head="Pixie Hairpin +1",
        body="Lanun frac +3",
        hands=gear.HQ.Carmine.Hands.D,
        legs=gear.Herculean.Legs.HybridWSD,
        feet={name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect'}},
        neck="Comm. Charm +2",
        waist="Svelt. Gouriz +1",
        left_ear="Friomisi Earring",
        right_ear=gear.Moonshade,
        left_ring="Dingir Ring",
        right_ring="Archon Ring",
        back=gear.JSE.COR.Back.HybridWSD
    }

    sets.precast.WS['Wildfire'] = {
        ammo="Living Bullet",
        head=gear.Herculean.Head.HybridWSD,
        body="Lanun frac +3",
        hands=gear.HQ.Carmine.Hands.D,
        legs=gear.Herculean.Legs.HybridWSD,
        feet={name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect'}},
        neck="Comm. Charm +2",
        waist="Eschan stone",
        left_ear="Friomisi Earring",
        right_ear="Hecate's Earring",
        left_ring="Dingir Ring",
        right_ring="Epaminondas's Ring",
        back=gear.JSE.COR.Back.HybridWSD
    }

    sets.precast.WS['Last Stand'] = {
        head="Lanun Tricorne +3",
        body="Laksa. Frac +3",
        hands="Meg. Gloves +2",
        legs=gear.Herculean.Legs.HybridWSD,
        feet="Lanun Bottes +3",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear=gear.Moonshade,
        right_ear="Ishvara Earring",
        left_ring="Dingir Ring",
        right_ring="Epaminondas's Ring",
        back=gear.JSE.COR.Back.HybridWSD,
    }

    sets.precast.WS['Last Stand']['Acc+'] = set_combine(sets.precast.WS['Last Stand'], {
        waist="K. Kachina belt +1",
        left_ear="Telos Earring",
    })

    -- precast.RA.[SPECIFIC_SET].[RANGED_SET]
    sets.precast.RA = {
        body="Oshosi Vest +1",
        hands=gear.HQ.Carmine.Hands.D,
        legs="Osh. Trousers +1",
        feet="Meg. Jam. +1",
        neck="Comm. Charm +2",
        waist="Yemaya Belt",
    }

    sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
        body="Laksa. Frac +3"
    })
  
    -- precast.Item.[SPECIFIC_SET]

    ------------------------------------------------------------
    -- midcast
    ------------------------------------------------------------
    -- midcast.RA.[SPECIFIC_SET].[RANGED_SET]
    -- midcast.Item.[SPECIFIC_SET]
    -- midcast.[SPECIFIC_SET].[state.CastingMode]

    sets.midcast.RA = {
        head="Meghanada Visor +2",
        body="Oshosi Vest +1",
        hands=gear.HQ.Adhemar.Hands.C,
        legs=gear.HQ.Adhemar.Legs.C,
        feet=gear.HQ.Adhemar.Feet.D,
        neck="Iskur Gorget",
        waist="Yemaya Belt",
        left_ear="Telos Earring",
        right_ear="Enervating Earring",
        left_ring="Dingir Ring",
        left_ring="Ilabrat Ring",
    }

    sets.midcast.RA.TripleShot = set_combine(sets.midcast.RA, {
        head="Oshosi Mask +1",
        body="Oshosi Vest +1",
        hands="Lanun Gants +3",
        legs="Oshosi Trousers +1",
        feet="Osh. Leggings +1",
    })

    sets.midcast.RA['Acc+'] = set_combine(sets.midcast.RA, {
        body="Laksa. Frac +3",
        hands="Meg. Gloves +2",
        feet="Meg. Jam. +1",
        neck="Comm. Charm +2",
        waist="K. Kachina Belt +1",
    })

    sets.midcast.RA['Acc+'].TripleShot = set_combine(sets.midcast.RA['Acc+'], {
        head="Oshosi Mask +1",
        body="Oshosi Vest +1",
        hands="Lanun Gants +3",
        legs="Oshosi Trousers +1",
        feet="Osh. Leggings +1",
    })

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
    --  |- defense.[state.PhysicalDefenseMode].[classes.CustomDefenseGroups]...
    --  |  defense.[state.MagicalDefenseMode].[classes.CustomDefenseGroups]...
    --  |---|- customize_defense_set(defenseset)
    --  |- Kiting
    --
    -- customize_idle_set(idleset)
    --  |- 
    --  |- [CUSTOM_COMMON]

    sets.idle = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Sanctity Necklace",
        waist="Gishdubar Sash",
        left_ear="Odnowa Earring +1",
        right_ear="Odnowa Earring",
        left_ring=gear.Ring["Chirich Ring +1"].Left,
        right_ring="Defending Ring",
        back="Moonlight Cape",
    }

    ------------------------------------------------------------
    -- resting
    ------------------------------------------------------------
    -- resting.[state.RestingMode]

    ------------------------------------------------------------
    -- engaged
    ------------------------------------------------------------
    -- engaged.[state.CombatForm].[state.CombatSkill].[state.CombatWeapon].[state.CombatPosition].[state.OffenseMode].[state.HybridMode].[class.CustomMeleeGroups]...
    --
    -- state.CombatForm      - H2H | 1H | 2H | DW
    -- state.CombatyPosition - None | Front | Flank | Rear
    --
    -- merge:
    --  |- defense.[state.PhysicalDefenseMode].[classes.CustomDefenseGroups]...
    --  |  defense.[state.MagicalDefenseMode].[classes.CustomDefenseGroups]...
    --  |---|- customize_defense_set(defenseset)
    --  |- Kiting
    --
    -- customize_melee_set(idleset)

    sets.engaged['1H'] = {
        sub="Nusku Shield",
        head=gear.HQ.Adhemar.Head.A,
        body=gear.HQ.Adhemar.Body.A,
        hands=gear.HQ.Adhemar.Hands.A,
        legs="Samnuha Tights",
        feet=gear.Herculean.Feet.TripleAttack,
        neck="Iskur Gorget",
        waist="Windbuffet Belt +1",
        left_ear="Cessance Earring",
        right_ear="Brutal Earring",
        left_ring="Petrov Ring",
        right_ring="Epona's Ring",
        back=gear.JSE.COR.Back.DA
    }

    sets.engaged.DW = {
        head=gear.HQ.Adhemar.Head.A,
        body=gear.HQ.Adhemar.Body.A,
        hands=gear.HQ.Adhemar.Hands.A,
        legs="Samnuha Tights",
        feet=gear.Herculean.Feet.TripleAttack,
        neck="Iskur Gorget",
        waist="Windbuffet Belt +1",
        left_ear="Telos Earring",
        right_ear="Suppanomimi",
        left_ring="Petrov Ring",
        right_ring="Epona's Ring",
        back=gear.JSE.COR.Back.DA
    }
    sets.engaged.DW["11"] = set_combine(sets.engaged.DW, {})
    sets.engaged.DW["31"] = set_combine(sets.engaged.DW['11'], {
        waist="Reiki Yotai"
    })
    sets.engaged.DW["41"] = set_combine(sets.engaged.DW['31'], {
        hands="Floral Gauntlets",
        legs=gear.HQ.Carmine.Legs.D
    })
    sets.engaged.DW["48"] = set_combine(sets.engaged.DW['41'], {
    })
    
    sets.engaged.DW['Full'] = {
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Iskur Gorget",
        waist="Windbuffet Belt +1",
        left_ear="Telos Earring",
        right_ear="Suppanomimi",
        left_ring="Petrov Ring",
        right_ring="Epona's Ring",
        back=gear.JSE.COR.Back.DA
    }

    sets.engaged.DW['Acc+'] = {
        head=gear.HQ.Adhemar.Head.A,
        body=gear.HQ.Adhemar.Body.A,
        hands=gear.HQ.Adhemar.Hands.A,
        legs="Samnuha Tights",
        feet=gear.Herculean.Feet.TripleAttack,
        neck="Lissome Necklace",
        waist="Reiki Yotai",
        left_ear="Telos Earring",
        right_ear="Suppanomimi",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back=gear.JSE.COR.Back.HybridWSD,
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
    sets.running = {left_ring="Shneddick Ring"}

    ------------------------------------------------------------
    -- Wespon sets
    ------------------------------------------------------------
    -- Weapon sets to be toggled between via WeaponSetMode
    sets.weapons['Rostam.A'] = {
        -- in the base case try to equip dual wield.
        -- if we can we end up in DW, if not we end up in 1H
        main = gear.JSE.COR.Main.Rostam.A,
        sub = "Tauret",
        
        ['1H'] = {
            main = gear.JSE.COR.Main.Rostam.A,
            sub = "Nusku Shield",
        },
        
        ['DW'] = {
            main = gear.JSE.COR.Main.Rostam.A,
            sub = "Tauret",
        }
    }    
    
    sets.weapons['Rostam.B'] = {
        -- in the base case try to equip dual wield.
        -- if we can we end up in DW, if not we end up in 1H
        main = gear.JSE.COR.Main.Rostam.B,
        sub = "Tauret",
        
        ['1H'] = {
            main = gear.JSE.COR.Main.Rostam.B,
            sub = "Nusku Shield",
        },
        
        ['DW'] = {
            main = gear.JSE.COR.Main.Rostam.B,
            sub = "Tauret",
        }
    }

    sets.weapons['Rostams'] = {
        -- in the base case try to equip dual wield.
        -- if we can we end up in DW, if not we end up in 1H
        main = gear.JSE.COR.Main.Rostam.B,
        sub =  gear.JSE.COR.Main.Rostam.A,
        
        ['1H'] = {
            main = gear.JSE.COR.Main.Rostam.B,
            sub = "Nusku Shield",
        },
        
        ['DW'] = {
            main = gear.JSE.COR.Main.Rostam.B,
            sub =  gear.JSE.COR.Main.Rostam.A,
        }
    }

    sets.weapons['Fettering Blade'] = {
        main = 'Fettering Blade',
        sub = "Blurred Knife +1",

        ['1H'] = {
            main = 'Fettering Blade',
            sub = "Nusku Shield",
        },
        
        ['DW'] = {
            main = 'Fettering Blade',
            sub = "Blurred Knife +1",
        }
    }

    sets.weapons['Naegling'] = {
        main = 'Naegling',
        sub = "Blurred Knife +1",

        ['1H'] = {
            main = 'Naegling',
            sub = "Nusku Shield",
        },
        
        ['DW'] = {
            main = 'Naegling',
            sub = "Blurred Knife +1",
        }
    }

    ------------------------------------------------------------
    -- RangedWeapon sets
    ------------------------------------------------------------
    -- RangedWeapon sets to be toggled between via RangedWeaponSetMode
    sets.rangedweapons['Death Penalty'] = {range="Death Penalty"}
    sets.rangedweapons['Anarchy'] = {range="Anarchy +2"}

    ------------------------------------------------------------
    -- Ammo sets
    ------------------------------------------------------------
    sets.ammo["Living Bullet"] = {ammo="Living Bullet"}

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

----------------------------------------
-- job_get_dw_tier
----------------------------------------
-- Returns the DW tier to use when selecting a gearset.
function job_get_dw_tier(needed)
    if needed <= 11 then
        return "11"
    elseif needed <= 31 then
        return "31"
    elseif needed <= 41 then
        return "41"
    elseif needed <= 48 then
        return "48"
    end
end
