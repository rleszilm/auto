-------------------------------------------------------------------------------
-- Auto
-------------------------------------------------------------------------------
include("auto/core.lua")
include("auto/commands.lua")
include("auto/gearswap.lua")
include("auto/select_gear.lua")
include("auto/apply_swaps.lua")

------------------------------------------------------------
-- init
------------------------------------------------------------
function init()
    -- var for tracking state values
    state = state or {}

    -- config
    state.config = {}
    state.config.DebugMode = M{false, "DebugMode"}

    -- defense
    state.DefenseMode         = M{['description'] = 'Defense Mode', 'None', 'Physical', 'Magical', 'Hybrid'}
    state.PhysicalDefenseMode = M{['description'] = 'Physical Defense Mode', 'PDT'}
    state.MagicalDefenseMode  = M{['description'] = 'Magical Defense Mode', 'MDT'}
    state.HybridDefenseMode   = M{['description'] = 'Hybrid Defense Mode', 'Hybrid'}

    -- idle
    state.IdleMode         = M{["description"] = "IdleMode", "Normal", "Refresh"}
    state.CustomIdleGroups = L{}

    -- melee
    state.CombatForm        = M{["description"] = "CombatForm", "Auto", "H2H", "1H", "2H", "DW"}
    state.CombatSkill       = M{["description"] = "CombatSkill", ["string"]=""}
    state.CombatWeapon      = M{["description"] = "CombatWeapon", ["string"]=""} 
    state.TargetAccuracy    = M{["description"] = "TargetAccuracy", "Normal", ""}
    state.CustomMeleeGroups = L{}
    
    -- item
    state.CustomItemGroups   = L{}

    -- ja
    state.CustomJAGroups     = L{}

    -- ma
    state.CastingMode    = M{["description"] = "CastingMode", "Normal", "Resist"}
    state.CustomMAGroups = L{}

    -- ra
    state.TargetRangedAccuracy = M{["description"] = "TargetRangedAccuracy", "Normal"}
    state.CustomRangedGroups   = L{}

    -- ws
    state.WeaponSkillMode = M{["description"] = "WeaponSkillMode", "Normal"}
    state.CustomWSGroups  = L{}

    -- pet_ability
    state.PetAbilityMode         = M{["description"] = "PetAbilityMode", "Normal"}
    state.CustomPetAbilityGroups = L{}
    -- pet_status
    state.PetTargetAccuracy       = M{["description"] = "PetTargetAccuracy", "Normal"}
    state.CustomPetEngagedtGroups = L{}
    state.PetIdleMode             = M{["description"] = "PetIdleMode", "Normal"}
    state.CustomPetIdletGroups    = L{}
    
    state.setPath = L{}
end


