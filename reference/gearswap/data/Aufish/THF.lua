--------------------------------------------------------------------------------
-- Job specific setup
--------------------------------------------------------------------------------
function user_setup()
    -- add job specific modules
    modules.CombatPos = require("aucore/lib/combat_pos")() -- updates state.CombatPos

    -- Set buffs to track
    state.Buff['Sneak Attack'] = false
    state.Buff['Trick Attack'] = false
    
    -- Set any default Modes here
    state.HybridMode:options("None","Half-DT", "Full-DT", "Lilith")
    state.HybridMode:set("None")

    -- Set any default Modes here
    state.WeaponSetMode:options("None", "Aeneas")
    state.WeaponSetMode:set("Aeneas")
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
        ammo="Sapience Orb",
        body=gear.Taeon.Body.FC,
        hands={name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2'}},
        left_ear="Loquac. Earring",
        right_ear="Enchntr. Earring +1",
        right_ring="Prolix Ring"
    }

    ----------------------------------------
    -- precast.JA
    ---------------------------------------- 
    sets.precast.JA['Perfect Dodge'] = {hands="Plun. Armlets +3"}

    ---- Steal
    sets.precast.JA['Steal'] = {
        neck="Pentalagus Charm",
        feet="Pill. Poulaines +1"
    }
    
    ---- Sneak Attack
    sets.precast.JA['Sneak Attack'] = {}
    
    ---- Flee
    sets.precast.JA['Flee'] = {feet="Pill. Poulaines +1"}
    
    ---- Trick Attack
    sets.precast.JA['Trick Attack'] = {}
    
    ---- Mug
    sets.precast.JA['Mug'] = {head="Plun. Bonnet +3"}
    
    ---- Hide
    sets.precast.JA['Hide'] = {body="Pillager's Vest +3"}
    
    ---- Accomplice
    sets.precast.JA['Accomplice'] = {}
    
    ---- Collaborator
    sets.precast.JA['Collaborator'] = {}
    
    ---- Aura Steal
    sets.precast.JA['Aura Steal'] = {
        head="Plun. Bonnet +3"}
    
    ---- Assassin's Charge
    sets.precast.JA['Assassin\'s Charge'] = {feet="Plun. Poulaines +3"}
    
    ---- Feint
    sets.precast.JA['Feint'] = {legs="Plun. Culottes +3"}
    
    ---- Despoil
    sets.precast.JA['Despoil'] = {feet="Skulk. Poulaines +1"}
    
    ---- Conspirator
    sets.precast.JA['Conspirator'] = {}
    
    ---- Bully
    sets.precast.JA['Bully'] = {}
    
    ---- Larceny
    sets.precast.JA['Larceny'] = {}

    ----------------------------------------
    -- precast.WS
    ---------------------------------------- 
    -- Evisceration
    sets.precast.WS["Evisceration"] = {
        ammo="Yetshila +1",
        head=gear.HQ.Adhemar.Head.A,
        body={name="Plunderer's Vest +3",
              augments={'Enhances "Ambush" effect'}},
        hands=gear.HQ.Adhemar.Hands.A,
        legs="Pill. Culottes +3",
        feet=gear.HQ.Adhemar.Feet.B,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Sherida Earring",
        right_ear=gear.Moonshade,
        left_ring="Begrudging Ring",
        right_ring="Mummu Ring",
        back=gear.JSE.THF.Back.CritRate
    }
    sets.precast.WS["Evisceration"]["CappedAtt"] = {
        ammo="Yetshila +1",
        head=gear.HQ.Adhemar.Head.A,
        body={name="Plunderer's Vest +3",
              augments={'Enhances "Ambush" effect'}},
        hands=gear.HQ.Adhemar.Hands.A,
        legs="Pill. Culottes +3",
        feet=gear.HQ.Lustratio.Feet.D,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Sherida Earring",
        right_ear=gear.Moonshade,
        left_ring="Begrudging Ring",
        right_ring="Mummu Ring",
        back=gear.JSE.THF.Back.CritRate
    }
    
    -- Mandalic Stab
    sets.precast.WS["Mandalic Stab"] = {
        ammo="Seething Bomblet +1",
        head="Plun. Bonnet +3",
        body="Plunderer's Vest +3",
        hands="Meg. Gloves +2",
        legs="Plunderer's Culottes +3",
        feet="Plunderer's poulaines +3",
        neck="Asn. Gorget +2",
        waist="Grunfeld Rope",
        left_ear="Sherida Earring",
        right_ear=gear.Moonshade,
        left_ring="Ilabrat ring",
        right_ring="Epaminondas's Ring",
        back=gear.JSE.THF.Back.WSD
    }
    sets.precast.WS["Mandalic Stab"]["CappedAtt"] = {
        ammo="Jukukik Feather",
        head="Pill. Bonnet +3",
        body=gear.Herculean.Body.HybridWSD,
        hands="Meg. Gloves +2",
        legs="Plunderer's Culottes +3",
        feet=gear.HQ.Lustratio.Feet.D,
        neck="Asn. Gorget +2",
        waist="Artful belt +1",
        left_ear="Sherida Earring",
        right_ear=gear.Moonshade,
        left_ring="Ilabrat ring",
        right_ring="Epaminondas's Ring",
        back=gear.JSE.THF.Back.WSD
    }
    sets.precast.WS["Mandalic Stab"]['SA'] = {
        ammo="Yetshila +1",
        head="Pill. Bonnet +3",
        body="Plunderer's Vest +3",
        hands="Meg. Gloves +2",
        legs="Plunderer's Culottes +3",
        feet=gear.HQ.Lustratio.Feet.D,
        neck="Asn. Gorget +2",
        waist="Grunfeld Rope",
        left_ear="Sherida Earring",
        right_ear=gear.Moonshade,
        left_ring="Ilabrat ring",
        right_ring="Epaminondas's Ring",
        back=gear.JSE.THF.Back.WSD
    }
    sets.precast.WS["Mandalic Stab"]['SA']['CappedAtt'] = {
        ammo="Yetshila +1",
        head="Pill. Bonnet +3",
        body="Plunderer's Vest +3",
        hands="Meg. Gloves +2",
        legs=gear.HQ.Lustratio.Legs.B,
        feet=gear.HQ.Lustratio.Feet.D,
        neck="Asn. Gorget +2",
        waist="Artful belt +1",
        left_ear="Sherida Earring",
        right_ear=gear.Moonshade,
        left_ring="Ilabrat ring",
        right_ring="Epaminondas's Ring",
        back=gear.JSE.THF.Back.WSD
    }
    
    -- Rudra's Storm
    sets.precast.WS["Rudra's Storm"] = sets.precast.WS["Mandalic Stab"]
    sets.precast.WS.rudra = sets.precast.WS["Rudra's Storm"] 
    
    -- Exenterator
    sets.precast.WS["Exenterator"] =  {
        ammo="Seething Bomblet +1",
        head={name="Plun. Bonnet +3",
              augments={'Enhances "Aura Steal" effect',}},
        body={name="Plunderer's Vest +3",
              augments={'Enhances "Ambush" effect',}},
        hands="Mummu Wrists +2",
        legs="Meg. Chausses +2",
        feet={name="Plun. Poulaines +3",
              augments={'Enhances "Assassin\'s Charge" effect'}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Sherida Earring",
        right_ear="Brutal Earring",
        left_ring="Ilabrat Ring",
        right_ring="Mummu Ring",
        back=gear.JSE.THF.Back.WSD
    }
    
    -- Aeolian Edge
    sets.precast.WS["Aeolian Edge"] = {
        ammo="Seething Bomblet +1",
        head=gear.Herculean.Head.HybridWSD,
        body="Pillager's Vest +3",
        hands=gear.Herculean.Hands.HybridWSD,
        legs=gear.Herculean.Legs.HybridWSD,
        feet=gear.Herculean.Feet.HybridWSD,
        neck="Sanctity Necklace",
        waist="Eschan Stone",
        left_ear=gear.Moonshade,
        right_ear="Friomisi Earring",
        left_ring="Shiva Ring +1",
        right_ring="Epaminondas's Ring",
        back=gear.JSE.THF.Back.WSD
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
        body="Ashera Harness",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Sanctity Necklace",
        waist="Gishdubar Sash",
        left_ear="Odnowa Earring +1",
        right_ear="Odnowa Earring",
        left_ring="Moonlight Ring",
        right_ring="Defending Ring",
        back=gear.JSE.THF.Back.STP
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
        head=gear.HQ.Adhemar.Head.A,
        neck="Asn. Gorget +2",
        left_ear="Sherida Earring",
        right_ear="Dedition Earring",
        body="Pillager's Vest +3",
        hands=gear.HQ.Adhemar.Hands.A,
        left_ring="Gere Ring",
        right_ring="Hetairoi Ring",
        back=gear.JSE.THF.Back.STP,
        waist="Reiki Yotai",
        legs="Samnuha Tights",
        feet="Plunderer's poulaines +3"
    }

    ---- offense modes
    sets.engaged['DW']['Acc+'] = {
        ammo="Yamarang",
        head=gear.HQ.Adhemar.Head.A,
        body="Pillager's Vest +3",
        hands=gear.HQ.Adhemar.Hands.A,
        legs={name="Samnuha Tights",
              augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3'}},
        feet={name="Plun. Poulaines +3",
              augments={'Enhances "Assassin\'s Charge" effect'}},
        neck="Asn. Gorget +2",
        waist="Reiki Yotai",
        left_ear="Sherida Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back=gear.JSE.THF.Back.STP
    }

    ---- hybrid modes
    sets.engaged['DW']['Half-DT'] = {
        ammo="Staunch Tathlum +1",
        head=gear.HQ.Adhemar.Head.A,
        neck="Twilight Torque",
        left_ear="Sherida Earring",
        right_ear="Dedition Earring",
        body=gear.HQ.Adhemar.Body.A,
        hands=gear.HQ.Adhemar.Hands.A,
        left_ring="Moonlight Ring",
        right_ring="Defending Ring",
        back=gear.JSE.THF.Back.STP,
        waist="Windbuffet Belt +1",
        legs="Meg. Chausses +2",
        feet={name="Plun. Poulaines +3",
              augments={'Enhances "Assassin\'s Charge" effect'}}
    }

    sets.engaged['DW']['Full-DT'] = {
        ammo="Staunch Tathlum +1",
        head=gear.HQ.Adhemar.Head.A,
        neck="Twilight Torque",
        left_ear="Sherida Earring",
        right_ear="Dedition Earring",
        body="Ashera Harness",
        hands="Meg. Gloves +2",
        left_ring="Moonlight Ring",
        right_ring="Defending Ring",
        back=gear.JSE.THF.Back.STP,
        waist="Flume Belt +1",
        legs="Meg. Chausses +2",
        feet={name="Plun. Poulaines +3",
              augments={'Enhances "Assassin\'s Charge" effect'}}}

    sets.engaged['DW']['Lilith'] = {
        ammo="Staunch Tathlum +1",
        head=gear.HQ.Adhemar.Head.A,
        neck="Twilight Torque",
        left_ear="Sherida Earring",
        right_ear="Dedition Earring",
        body="Ashera Harness",
        hands="Malignance Gloves",
        left_ring="Moonlight Ring",
        right_ring="Defending Ring",
        back=gear.JSE.THF.Back.STP,
        waist="Flume Belt +1",
        legs="Malignance tights",
        feet="Malignance boots"
    }

    ------------------------------------------------------------
    -- defense
    ------------------------------------------------------------
    -- defense.[state.Subjob].[state.PhysicalDefenseMode].[classes.CustomDefenseGroups]...
    -- defense.[state.Subjob].[state.MagicalDefenseMode].[classes.CustomDefenseGroups]...
    -- 
    -- customize_defense_set(defenseset)
    
    -- physical defense sets
    sets.defense.PLow = {
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
    sets.weapons = {}

    sets.weapons.Aeneas = {
        main="Aeneas",
        sub="Twashtar"
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
    
    -- add SA if active
    if state.Buff["Sneak Attack"] then
        classes.CustomMeleeGroups:append('SA')
    end
    
    -- add TA if active
    if state.Buff["Trick Attack"] then
        classes.CustomMeleeGroups:append('TA')
    end
end