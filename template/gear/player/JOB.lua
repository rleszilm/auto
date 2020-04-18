--------------------------------------------------------------------------------
-- JOB
--------------------------------------------------------------------------------
-- Sets
------------------------------------------------------------
function init_gear_sets(sets)
    ------------------------------------------------------------
    -- precast
    ------------------------------------------------------------
    -- item - [item.Name].[StatusEffects].CustomItemGroups
    ----------------------------------------

    ----------------------------------------
    -- ja - [SpellGroups].[spell.Name].[SpecificMode].[StatusEffects].CustomJAGroups
    ----------------------------------------

    ----------------------------------------
    -- ma - [CastingMode].[spell.Type].[spell.Skill].[SpellGroups].[spell.Name].[SpecificMode].[StatusEffects].CustomMAGroups
    ----------------------------------------

    ----------------------------------------
    -- pet - [PetAbilityMode].[pet.Name].[SpellGroups].[spell.Name].[SpecificMode].[StatusEffects].CustomPetAbilityGroups
    ----------------------------------------

    ----------------------------------------
    -- ra - [player.sub_job].[RangedSkill].[RangedWeapon].[RangedAmmo].[TargetRangedAccuracy].[SnapshotBucket].[StatusEffects].CustomRangedGroups
    ----------------------------------------

    ----------------------------------------
    -- ws - [WSMode].[spell.Name].[SpecificMode].[StatusEffects].CustomWSGroups
    ----------------------------------------

    ------------------------------------------------------------
    -- midcast
    ------------------------------------------------------------
    -- item - [item.Name].CustomItemGroups
    ----------------------------------------

    ----------------------------------------
    -- ma - [CastingMode].[spell.Type].[spell.Skill].[SpellGroups].[spell.Name].[SpecificMode].[StatusEffects].CustomMAGroups
    ----------------------------------------

    ----------------------------------------
    -- pet - [PetAbilityMode].[pet.Name].[SpellGroups].[spell.Name].[SpecificMode].[StatusEffects].CustomPetAbilityGroups
    ----------------------------------------

    ----------------------------------------
    -- ra - [player.sub_job].[RangedSkill].[RangedWeapon].[RangedAmmo].[TargetRangedAccuracy].[SnapshotBucket].[StatusEffects].CustomRangedGroups
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
    -- melee - [player.sub_job].[MeleeForm].[MeleeSkill].[MeleeWeapon].[OffhandWeapon].[TargetAccuracy].[DualWieldBucket].[StatusEffects].CustomMeleeGroups

    ------------------------------------------------------------
    -- idle - [defense].[pet_status].[idle]
    ------------------------------------------------------------
    -- defense - defense.[DefenseMode].[DefenseModeMode]
    -- pet_status - [pet.Name]
    --                |-engaged
    --                |   |-[PetTargetAccuracy].CustomPetEngagedGroups
    --                |-idle
    --                    |-[PetIdleMode].CustomPetIdleGroups  
    -- idle - [IdleMode].[weak|town|field].[StatusEffects].CustomIdleGroups 

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