--------------------------------------------------------------------------------
-- Job specific setup
--------------------------------------------------------------------------------
function user_setup()
    -- Set any default Modes here

    state.WeaponSetMode:options("None", "Melee", "Cleave")
    state.WeaponSetMode:set("Melee")
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
        ammo="Sapience orb",
        head=gear.HQ.Carmine.Head.D,
        body=gear.Taeon.Body.FC,
        hands="Leyline Gloves",
        legs=gear.Psycloth.Legs.D,
        feet=gear.HQ.Carmine.Feet,
        waist="Witful belt",
        left_ring="Prolix Ring",
        left_ear="Enchanter Earring +1",
        right_ear="Loquacious Earring"
    }

    -- ja sets
    sets.precast.JA = {}

    -- Azure Lore
    sets.precast.JA['Azure Lore'] = {hands="Assimilator's Bazubands +1"}

    -- ws sets
    sets.precast.WS = {}

    sets.precast.WS['Chant du Cygne'] = {
        ammo="Jukukik Feather",
        head=gear.HQ.Adhemar.Head.A,
        body=gear.Herculean.Body.CritDmg,
        hands=gear.HQ.Adhemar.Hands.A,
        legs="Samnuha Tights",
        feet=gear.Herculean.Feet.TripleAttack,
        neck="Mirage Stole +2",
        waist="Fotia Belt",
        left_ear="Mache Earring +1",
        right_ear="Mache Earring +1",
        left_ring="Epona's Ring",
        right_ring="Begrudging Ring",
        back=gear.JSE.BLU.Back.CritRate
    }

    sets.precast.WS['Requiscat'] = {
        ammo="Quartz Tathlum +1",
        head="Jhakri Coronal +2",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +2",
        feet="Jhakri Pigaches +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear=gear.Moonshade,
        right_ear="Brutal Earring",
        left_ring="Epona's Ring",
        right_ring="Rufescent Ring"
    }

    -- ra sets
    sets.precast.RA = {}

    -- item sets
    sets.precast.Item = {}

    ------------------------------------------------------------
    -- midcast
    ------------------------------------------------------------
    -- midcast.[SPECIFIC_SET].[state.CastingMode]
    -- midcast.RA.[SPECIFIC_SET].[RANGED_SET]
    -- midcast.Item.[SPECIFIC_SET]
    
    -- magic sets
    sets.midcast['Blue Magic'] = {}
    sets.midcast['Blue Magic'].Magical = {
        ammo="Pemphredo Tathlum",
        head="Jhakri Coronal +2",
        body=gear.HQ.Amalric.Body.A,
        hands=gear.HQ.Amalric.Hands.D,
        legs=gear.HQ.Amalric.Legs.A,
        feet=gear.HQ.Amalric.Feet.D,
        neck="Mirage Stole +2",
        waist="Orpheus's Sash",
        left_ring="Shiva Ring +1",
        right_ring="Shiva Ring +1",
        left_ear="Friomisi Earring",
        right_ear="Regal Earring",
        back=gear.JSE.BLU.Back.MDmg
    }

    sets.midcast['Blue Magic'].Magical.Dark = set_combine(sets.midcast['Blue Magic'].Magical, {
        head="Pixie hairpin +1",
        left_ring="Archon Ring",
    })

    sets.midcast['Blue Magic'].Magical.Acc = {
    }

    sets.midcast['Blue Magic'].Healing = {
        ammo="Quartz Tathlum +1",
        head=gear.HQ.Carmine.Head,
        hands=gear.Telchine.CurePotency,
        legs=gear.HQ.Carmine.Legs.B,
        feet=gear.HQ.Carmine.Feet.B,
        waist="Gishdubar Sash",
        left_ear="Mendi. Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Solemnity Cape",
    }

    sets.midcast['Battery Charge'] = {
        head="Amalric Coif +1",
        waist="Gishdubar Sash"
    }

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
        head="Malignance chapeau",
        body="Jhakri Robe +2",
        hands="Malignance gloves",
        legs="Malignance tights",
        feet="Malignance boots",
        neck="Twilight Torque",
        waist="Flume Belt +1",
        left_ear="Etiolation Earring",
        right_ear="Infused Earring",
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
        back=gear.JSE.BLU.Back.STP
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
    sets.engaged['H2H'] = {
        ammo="Ginsen",
        head=gear.HQ.Adhemar.Head.A,
        body=gear.HQ.Adhemar.Body.A,
        hands=gear.HQ.Adhemar.Hands.A,
        legs="Samnuha Tights",
        feet=gear.Herculean.Feet.TripleAttack,
        neck="Mirage Stole +2",
        waist="Windbuffet Belt +1",
        left_ear="Suppanomimi",
        right_ear="Dedition Earring",
        left_ring="Epona's Ring",
        right_ring="Hetairoi Ring",
        back=gear.JSE.BLU.Back.STP
    }

    -- 1 handed sets
    sets.engaged['1H'] = {}

    -- 2 handed sets
    sets.engaged['2H'] = {}

    -- dual wield
    sets.engaged['DW'] = {
        ammo="Ginsen",
        head=gear.HQ.Adhemar.Head.A,
        body=gear.HQ.Adhemar.Body.A,
        hands=gear.HQ.Adhemar.Hands.A,
        legs="Samnuha Tights",
        feet=gear.Herculean.Feet.TripleAttack,
        neck="Mirage Stole +2",
        waist="Windbuffet Belt +1",
        left_ear="Suppanomimi",
        right_ear="Dedition Earring",
        left_ring="Epona's Ring",
        right_ring="Hetairoi Ring",
        back=gear.JSE.BLU.Back.STP
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
    sets.running = {legs=gear.HQ.Carmine.Legs}

    ------------------------------------------------------------
    -- Wespon sets
    ------------------------------------------------------------
    -- Weapon sets to be toggled between via WeaponSetMode
    sets.weapons.Melee = {
        DW={
            main="Naegling",
            sub=gear.Colada.STP
        }
    }

    sets.weapons.Cleave = {
        DW={
            main=gear.Nibiru.Club.B,
            sub=gear.Nibiru.Club.B
        }
    }

    -- 1H more should never happen. If it does it's because of spells
    -- being reset. have 1h the same as dw to force switch
    sets.weapons['1H'] = sets.weapons['DW']

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
