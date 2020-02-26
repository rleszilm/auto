--------------------------------------------------------------------------------
-- JOB
--------------------------------------------------------------------------------
-- Setup
------------------------------------------------------------
function job_setup()
end

------------------------------------------------------------
-- Sets
------------------------------------------------------------
function init_gear_sets(sets)
    ------------------------------------------------------------
    -- precast
    ------------------------------------------------------------
    -- item - [item.Name].CustomItemGroups
    ----------------------------------------
    ----------------------------------------
    -- ja - [spell.Name].CustomJAGroups
    ----------------------------------------
    ----------------------------------------
    -- ma - [CastingMode].[SpellGroup].[spell.Type].[spell.Skill].[spell.Name].CustomMAGroups
    ----------------------------------------
    ----------------------------------------
    -- pet - [pet.Nmae].[PetAbilityMode].[SpellGroup].[spell.Name].CustomPetAbilityGroups
    ----------------------------------------
    ----------------------------------------
    -- ra - [player.sub_job].[RangedSkill].[RangedWeapon].[RangedAmmo].[TargetRangedAccuracy].[SnapshotBucket].CustomRangedGroups
    ----------------------------------------
    ----------------------------------------
    -- ws - [WSMode].[spell.Name].CustomWSGroups
    ----------------------------------------

    ------------------------------------------------------------
    -- midcast
    ------------------------------------------------------------
    -- item - [item.Name].CustomItemGroups
    ----------------------------------------
    ----------------------------------------
    -- ma - [CastingMode].[SpellGroup].[spell.Type].[spell.Skill].[spell.Name].CustomMAGroups
    ----------------------------------------
    ----------------------------------------
    -- pet - [pet.Nmae].[PetAbilityMode].[SpellGroup].[spell.Name].CustomPetAbilityGroups
    ----------------------------------------
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
    -- melee - [player.sub_job].[MeleeForm].[MeleeSkill].[MeleeWeapon].[TargetAccuracy].[MeleeHasteBucket].CustomMeleeGroups

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
    -- running
    ----------------------------------------
    ----------------------------------------
    -- treasure hunter
    ----------------------------------------
    return sets
end