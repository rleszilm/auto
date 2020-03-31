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
    -- ja - [SpellGroups].[spell.Name].[SpecificMode].CustomJAGroups
    ----------------------------------------

    ----------------------------------------
    -- ma - [CastingMode].[spell.Type].[spell.Skill].[SpellGroups].[spell.Name][SpecificMode].CustomMAGroups
    ----------------------------------------

    ----------------------------------------
    -- pet - [PetAbilityMode].[pet.Name].[SpellGroups].[spell.Name].[SpecificMode].CustomPetAbilityGroups
    ----------------------------------------

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
    -- ma - [CastingMode].[spell.Type].[spell.Skill].[SpellGroups].[spell.Name][SpecificMode].CustomMAGroups
    ----------------------------------------

    ----------------------------------------
    -- pet - [PetAbilityMode].[pet.Name].[SpellGroups].[spell.Name].[SpecificMode].CustomPetAbilityGroups
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