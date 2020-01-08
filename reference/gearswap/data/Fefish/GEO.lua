--------------------------------------------------------------------------------
-- Job specific setup
--------------------------------------------------------------------------------
function user_setup()
    -- Set any default Modes here
    state.WeaponSetMode:options("Normal")
    state.WeaponSetMode:set("Normal")
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
        legs="Geomancy Pants +2",
        feet="Merlinic Crackows",
        waist="Witful Belt",
    }
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        hands="Bagua Mitaines",
    })

    -- ja sets
    sets.precast.JA = {}
    sets.precast.JA['Bolster'] = {
        body="Bagua tunic",
    }
    sets.precast.JA['Full Circle'] = {
        head="Azimuth hood",
    }
    sets.precast.JA['Lasting Emanation'] = {}
    sets.precast.JA['Ecliptic Attrition'] = {}
    sets.precast.JA['Collimated Fervor'] = {}
    sets.precast.JA['Life Cycle'] = {
        body="Geomancy tunic +2",
    }
    sets.precast.JA['Blaze of Glory'] = {}
    sets.precast.JA['Dematerialize'] = {}
    sets.precast.JA['Entrust'] = {}
    sets.precast.JA['Mending Halation'] = {
        legs="Bagua pants",
    }
    sets.precast.JA['Radial Arcana'] = {
        feet="Bagua sandals",
    }
    sets.precast.JA['Theurgic Focus'] = {}
    sets.precast.JA['Concentric Pulse'] = {}
    sets.precast.JA['Widened Compass'] = {}

    -- ws sets
    sets.precast.WS = {}

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
    sets.midcast.Geomancy = {
        head="Azimuth Hood",
        body="Bagua Tunic",
        hands="Geo. Mitaines +2",
        legs="Bagua Pants",
        feet="Azimuth Gaiters",
        neck="Bagua Charm +2",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back=gear.JSE.GEO.Back,
    }

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
        body="Geomancy Tunic +2",
        hands="Geomancy Mitaines +3",
        feet="Azimuth Gaiters",
        neck="Loricate Torque +1",
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
        back=gear.JSE.GEO.Back.DT,
    }
    sets.idle.Pet = set_combine(sets.idle, {
        head="Azimuth Hood",
        feet="Bagua sandals",
    })
    sets.idle.Weak = sets.idle
    sets.idle.Town = sets.idle
    sets.idle.Field = sets.idle

    -- idle sets w/pet
    sets.idle.Weak.Pet = sets.idle.Pet
    sets.idle.Field.Pet = sets.idle.Pet

    -- idle sets w/Engaged pet
    sets.idle.Weak.Pet.Engaged = sets.idle.Weak.Pet
    sets.idle.Field.Pet.Engaged = sets.idle.Field.Pet

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
    sets.running = {feet="Geo. Sandals +2"}

    ------------------------------------------------------------
    -- Weapon sets
    ------------------------------------------------------------
    -- Weapon sets to be toggled between via WeaponSetMode
    sets.weapons = {}

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
