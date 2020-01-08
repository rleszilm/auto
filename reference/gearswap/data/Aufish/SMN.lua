--------------------------------------------------------------------------------
-- Job specific setup
--------------------------------------------------------------------------------
function user_setup()
    -- Set any default Modes here
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
    sets.precast.FC = { -- FC +57~59
        sub="Clerisy strap +1",    -- FC + 3
        ammo="Impatiens",
        head="Amalric coif +1",    -- FC +11
        ear2="Loquacious earring", -- FC + 2
        body="Inyanga Jubbah +2",  -- FC +14
        ring2="Prolix ring",       -- FC + 2
        back=gear.JSE.SMN.Back.FC, -- FC +10
        waist="Witful belt",       -- FC + 3
        legs="Psycloth lappas",    -- FC + 7
        feet="Regal pumps +1",     -- FC + 4~6
    }

    -- ja sets
    sets.precast.JA = {}
    sets.precast.JA['Astral Flow'] = {}
    sets.precast.JA['Elemental Siphon'] = {
        main="Espiritus",
        sub="Vox grip",
        ammo="Esper stone +1",
        neck="Melic torque",
        ring1="Evoker's ring"
    }
    sets.precast.JA['Apogee'] = {}
    sets.precast.JA['Mana Cede'] = {}
    sets.precast.JA['Astral Conduit'] = {}

    -- ws sets
    sets.precast.WS = {}

    -- ra sets
    sets.precast.RA = {}

    -- item sets
    sets.precast.Item = {}

    -- bloodpact sets
    sets.precast.BloodPactWard = {    -- BP I - 23 BPII - 8
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        body=gear.HQ.Apogee.Body,
        hands="Baayami Cuffs +1",
        legs="Baayami Slops +1",
        feet="Baaya. Sabots +1",
        neck="Melic Torque",
        left_ear="Smn. Earring",
        right_ear="Andoaa Earring",
        left_ring="Evoker's Ring",
        right_ring="Stikini Ring +1"
    }

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

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
    sets.midcast.Cure = {
        head=gear.Vanya.Head,
        ear1="Mendicant's earring",
        ear2="Loquacious earring",
        hands="Telchine gloves",
        ring1="Sirona's ring",
        ring2="Prolix ring",
        waist="Witful belt",
        feet=gear.Vanya.Feet
    }
    sets.midcast.StoneSkin = {}
    sets.midcast['Elemental Magic'] = {}
    sets.midcast['Elemental Magic'].Resistant = {}
    sets.midcast['Dark Magic'] = {}
    sets.midcast['Dark Magic'].Resistant = {}

    ------------------------------------------------------------
    -- midcast.Pet
    ------------------------------------------------------------
    -- midcast.Pet.[SPECIFIC_SET].[state.CastingMode]
    -- midcast.Pet.[SPECIFIC_SET].[state.OffenseMode]

    -- pet midcast sets
    sets.midcast.Pet = {}
    sets.midcast.Pet.BloodPactRage = {
        main=gear.JSE.SMN.Main.Keraunos,
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head=gear.HQ.Apogee.Head.B,
        body="Con. Doublet +3",
        hands=gear.Merlinic.Hands.BloodPactDmg,
        legs="Enticer's Pants",
        feet="Convo. Pigaches +3",
        neck="Smn. Collar +2",
        waist="Regal Belt",
        left_ear="Gelos Earring",
        right_ear="Lugalbanda Earring",
        left_ring="Varar Ring +1",
        right_ring="Varar Ring +1",
        back=gear.JSE.SMN.Back.PetRegen
    }
    sets.midcast.Pet.BloodPactRage.Hybrid = {
        main=gear.JSE.SMN.Main.Keraunos,
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head=gear.HQ.Apogee.Head.A,
        body="Con. Doublet +3",
        hands=gear.Merlinic.Hands.BloodPactDmg,
        legs="Enticer's Pants",
        feet=gear.HQ.Apogee.Feet.A,
        neck="Smn. Collar +2",
        waist="Regal Belt",
        left_ear="Gelos Earring",
        right_ear="Lugalbanda Earring",
        left_ring="Varar Ring +1",
        right_ring="Varar Ring +1",
        back=gear.JSE.SMN.Back.PetRegen
    }
    sets.midcast.Pet.BloodPactRage.Magical = {
        main=gear.JSE.SMN.Main.Espiritus,
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head=gear.HQ.Apogee.Head.A,
        body="Con. Doublet +3",
        hands=gear.Merlinic.BloodPactDmg,
        legs=gear.HQ.Apogee.Legs.A,
        feet=gear.HQ.Apogee.Feet.A,
        neck="Smn. Collar +2",
        waist="Regal Belt",
        left_ear="Gelos Earring",
        right_ear="Lugalbanda Earring",
        left_ring="Varar Ring +1",
        right_ring="Varar Ring +1",
        back=gear.JSE.SMN.Back.FC
    }
    
    sets.midcast.Pet.BloodPactWard = {}
    sets.midcast.Pet.BloodPactWard.Buff = {
        main=gear.JSE.SMN.Main.Espiritus, -- smn skill +00 000
        sub="Vox Grip",                   -- smn skill +03 003
        ammo="Sancus Sachet +1",          -- smn skill +00 003
        head="Baayami Hat +1",            -- smn skill +31 034
        body="Baayami Robe +1",           -- smn skill +37 071
        hands="Baayami Cuffs +1",         -- smn skill +03 003
        legs="Baayami Slops +1",
        feet="Baaya. Sabots +1",
        neck="Melic Torque",
        waist="Regal Belt",
        left_ear="Smn. Earring",
        right_ear="Andoaa Earring",
        left_ring="Evoker's Ring",
        right_ring="Stikini Ring +1",
        back=gear.JSE.SMN.Back.FC
    }
    sets.midcast.Pet.BloodPactWard.Debuff = {
        main=gear.JSE.SMN.Main.Espiritus,
        sub="Vox Grip",
        ammo="Sancus Sachet +1",
        head="Baayami Hat +1",
        body="Baayami Robe +1",
        hands=gear.HQ.Apogee.Hands.D,
        legs="Tali'ah Sera. +2",
        feet="Baaya. Sabots +1",
        neck="Smn. Collar +2",
        waist="Regal Belt",
        left_ear="Lugalbanda Earring",
        right_ear="Andoaa Earring",
        left_ring="Evoker's Ring",
        right_ring="Stikini Ring +1",
        back=gear.JSE.SMN.Back.FC
    }
    
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
        main="Malignance Pole",
        sub="Oneiros Grip",
        ammo="Staunch tathlum +1",
        head="Beckoner's Horn +1",
        body=gear.HQ.Apogee.Body.A,
        hands="Baayami cuffs +1",
        legs="Assid. Pants +1",
        feet=gear.HQ.Apogee.Feet.A,
        neck="Summoner's collar +2",
        waist="Regal Belt",
        left_ear="Genmei Earring",
        right_ear="Etiolation Earring",
        left_ring="Stikini Ring +1",
        right_ring="Defending ring",
        back="Moonlight cape",
    }

    sets.idle.Weak = sets.idle
    sets.idle.Town = sets.idle
    sets.idle.Field = sets.idle

    -- idle sets w/pet
    sets.idle.Field.Pet = set_combine(sets.idle, {
        main=gear.JSE.SMN.Main.Gridarvor,
        sub="Oneiros Grip",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        body=gear.HQ.Apogee.Body.A,
        hands="Baayami cuffs +1",
        legs="Assid. Pants +1",
        feet=gear.HQ.Apogee.Feet.A,
        neck="Caller's Pendant",
        waist="Regal Belt",
        left_ear="Evans Earring",
        right_ear="Loquac. Earring",
        left_ring="Evoker's Ring",
        right_ring="Stikini Ring +1",
        back=gear.JSE.SMN.Back.PetRegen,
    })
    sets.idle.Town.Pet = sets.idle.Field.Pet
    sets.idle.Weak.Pet = sets.idle.Field.Pet

    -- idle sets w/Engaged pet
    sets.idle.Field.Pet.Engaged = sets.idle.Field.Pet
    sets.idle.Town.Pet.Engaged = sets.idle.Field.Pet.Engaged
    sets.idle.Weak.Pet.Engaged = sets.idle.Field.Pet.Engaged

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
    sets.running = {left_ring="Shneddick Ring"}

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

--------------------------------------------------------------------------------
-- Custom logic handling
--------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if state.Buff['Astral Conduit'] and pet_midaction() then
        eventArgs.handled = true
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if state.Buff['Astral Conduit'] and pet_midaction() then
        eventArgs.handled = true
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_pet_aftercast(spell, action, spellMap, eventArgs)
    --if not spell.interrupted and spell.type == 'BloodPactWard' and spellMap ~= 'DebuffBloodPactWard' then
    --    wards.flag = true
    --    wards.spell = spell.english
    --    send_command('wait 4; gs c reset_ward_flag')
    --end
end