--------------------------------------------------------------------------------
-- JOB
--------------------------------------------------------------------------------
-- Sets
------------------------------------------------------------
function init_gear_sets(sets)
    ------------------------------------------------------------
    -- precast
    ------------------------------------------------------------
    -- item - [item.Name].CustomItemGroups
    ----------------------------------------

    ----------------------------------------
    -- ja - [SpellGroup].[spell.Name].[SpecificMode].CustomJAGroups
    ----------------------------------------
    sets.precast.ja['Astral Flow'] = {}
    sets.precast.ja['Elemental Siphon'] = {}
    sets.precast.ja['Mana Cede'] = {}
    sets.precast.ja['Astral Conduit'] = {}
    sets.precast.ja['Apogee'] = {}

    ----------------------------------------
    -- ma - [CastingMode].[SpellGroup].[spell.Type].[spell.Skill].[spell.Name][SpecificMode].CustomMAGroups
    ----------------------------------------
    sets.precast.ma = { -- FC +57~59
        sub="Clerisy strap +1",    -- FC + 3
        ammo="Impatiens",
        head="Amalric coif +1",    -- FC +11
        ear2="Loquacious earring", -- FC + 2
        body="Inyanga Jubbah +2",  -- FC +14
        ring2="Prolix ring",       -- FC + 2
        back=gear.AmbuCapes.SMN.FastCast, -- FC +10
        waist="Witful belt",       -- FC + 3
        legs="Psycloth lappas",    -- FC + 7
        feet="Regal pumps +1",     -- FC + 4~6
    }

    ----------------------------------------
    -- pet - [PetAbilityMode].[pet.Name].[SpellGroup].[spell.Name].[SpecificMode].CustomPetAbilityGroups
    ----------------------------------------
    sets.precast.pet.BloodPactRage = {
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        body=gear.Apogee.HQ.Body,
        hands="Baayami Cuffs +1",
        legs="Baayami Slops +1",
        feet="Baaya. Sabots +1",
        neck="Melic Torque",
        left_ear="Smn. Earring",
        right_ear="Andoaa Earring",
        left_ring="Evoker's Ring",
        right_ring="Stikini Ring +1"
    }

    sets.precast.pet.BloodPactWard = sets.precast.pet.BloodPactRage

    ----------------------------------------
    -- ra - [player.sub_job].[RangedSkill].[RangedWeapon].[RangedAmmo].[TargetRangedAccuracy].[SnapshotBucket].CustomRangedGroups
    ----------------------------------------

    ----------------------------------------
    -- ws - [WSMode].[spell.Name].[SpecificMode].CustomWSGroups
    ----------------------------------------

    ------------------------------------------------------------
    -- midcast
    ------------------------------------------------------------
    -- item - [item.Name].CustomItemGroups
    ----------------------------------------

    ----------------------------------------
    -- ma - [CastingMode].[SpellGroup].[spell.Type].[spell.Skill].[spell.Name][SpecificMode].CustomMAGroups
    ----------------------------------------
    sets.midcast.Cure = { -- TODO: Fix
        head=gear.Vanya.Head,
        ear1="Mendicant's earring",
        ear2="Loquacious earring",
        hands="Telchine gloves",
        ring1="Sirona's ring",
        ring2="Prolix ring",
        waist="Witful belt",
        feet=gear.Vanya.Feet
    }

    ----------------------------------------
    -- pet - [PetAbilityMode].[pet.Name].[SpellGroup].[spell.Name].[SpecificMode].CustomPetAbilityGroups
    ----------------------------------------
    sets.midcast.pet.BloodPactRage = {
        main=gear.Keraunos,
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head=gear.Apogee.HQ.Head.B,
        body="Con. Doublet +3",
        hands=gear.Merlinic.Hands.BloodPactDmg,
        legs="Enticer's Pants",
        feet="Convo. Pigaches +3",
        neck="Smn. Collar +2",
        waist="Regal Belt",
        left_ear="Gelos Earring",
        right_ear="Lugalbanda Earring",
        left_ring=gear.Ring['Varar ring +1'].left,
        right_ring=gear.Ring['Varar ring +1'].right,
        back=gear.AmbuCapes.SMN.BloodPactRagePhysical
    }

    sets.midcast.pet.BloodPactRage.Hybrid = {
        main=gear.Keraunos,
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head=gear.Apogee.HQ.Head.A,
        body="Con. Doublet +3",
        hands=gear.Merlinic.Hands.BloodPactDmg,
        legs="Enticer's Pants",
        feet=gear.Apogee.HQ.Feet.A,
        neck="Smn. Collar +2",
        waist="Regal Belt",
        left_ear="Gelos Earring",
        right_ear="Lugalbanda Earring",
        left_ring=gear.Ring['Varar ring +1'].left,
        right_ring=gear.Ring['Varar ring +1'].right,
        back=gear.AmbuCapes.SMN.BloodPactRagePhysical
    }

    sets.midcast.pet.BloodPactRage.Magical = {
        main=gear.Espiritus,
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head=gear.Apogee.HQ.Head.A,
        body="Con. Doublet +3",
        hands=gear.Merlinic.BloodPactDmg,
        legs=gear.Apogee.HQ.Legs.A,
        feet=gear.Apogee.HQ.Feet.A,
        neck="Smn. Collar +2",
        waist="Regal Belt",
        left_ear="Gelos Earring",
        right_ear="Lugalbanda Earring",
        left_ring=gear.Ring['Varar ring +1'].left,
        right_ring=gear.Ring['Varar ring +1'].right,
        back=gear.AmbuCapes.SMN.BloodPactRageMagical
    }

    sets.midcast.pet.BloodPactWard.Buff = {
        main=gear.Espiritus, -- smn skill +00 000
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
        back=gear.AmbuCapes.SMN
    }

    sets.midcast.pet.BloodPactWard.Debuff = {
        main=gear.Espiritus,
        sub="Vox Grip",
        ammo="Sancus Sachet +1",
        head="Baayami Hat +1",
        body="Baayami Robe +1",
        hands=gear.Apogee.HQ.Hands.D,
        legs="Tali'ah Sera. +2",
        feet="Baaya. Sabots +1",
        neck="Smn. Collar +2",
        waist="Regal Belt",
        left_ear="Lugalbanda Earring",
        right_ear="Andoaa Earring",
        left_ring="Evoker's Ring",
        right_ring="Stikini Ring +1",
        back=gear.AmbuCapes.SMN.FC
    }

    ----------------------------------------
    -- ra - [player.sub_job].[RangedSkill].[RangedWeapon].[RangedAmmo].[TargetRangedAccuracy].[SnapshotBucket].CustomRangedGroups
    ----------------------------------------
    
    ------------------------------------------------------------
    -- engaged - [defense].[pet_status].[melee]
    ------------------------------------------------------------
    -- defense - defense.[DefenseMode].[DefenseModeMode]
    -- pet_status - [pet.Name]
    --                |-engaged
    --                |   |-[PetTargetAccuracy].CustomPetEngagedGroups
    --                |-idle
    --                    |-[PetIdleMode].CustomPetIdleGroups  
    -- melee - [player.sub_job].[MeleeForm].[MeleeSkill].[MeleeWeapon].[TargetAccuracy].[DualWieldBucket].CustomMeleeGroups

    ------------------------------------------------------------
    -- idle - [defense].[pet_status].[idle]
    ------------------------------------------------------------
    -- defense - defense.[DefenseMode].[DefenseModeMode]
    -- pet_status - [pet.Name]
    --                |-engaged
    --                |   |-[PetTargetAccuracy].CustomPetEngagedGroups
    --                |-idle
    --                    |-[PetIdleMode].CustomPetIdleGroups  
    -- idle - [IdleMode].[weak|town|field].CustomIdleGroups 

    ------------------------------------------------------------
    -- weapons - [WeaponSetMode]
    ------------------------------------------------------------

    ------------------------------------------------------------
    -- rangedweapons - [RangedWeaponSetMode]
    ------------------------------------------------------------

    ------------------------------------------------------------
    -- ammo - [AmmoSetMode]
    ------------------------------------------------------------

    ------------------------------------------------------------
    -- swaps
    ------------------------------------------------------------
    -- day_weather - [spell.Element]
    ----------------------------------------

    ----------------------------------------
    -- running
    ----------------------------------------
    
    return sets
end