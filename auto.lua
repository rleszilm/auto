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

    state.DefenseMode         = M{['description'] = 'Defense Mode', 'None', 'Physical', 'Magical', 'Hybrid'}
    state.PhysicalDefenseMode = M{['description'] = 'Physical Defense Mode', 'PDT'}
    state.MagicalDefenseMode  = M{['description'] = 'Magical Defense Mode', 'MDT'}
    state.HybridDefenseMode   = M{['description'] = 'Hybrid Defense Mode', 'Hybrid'}

    state.IdleMode = M{["description"] = "CastingMode", "Normal"}

    state.CombatForm   = M{["description"] = "CombatForm", "Auto", "H2H", "1H", "2H", "DW"}
    state.CombatSkill  = M{["description"] = "CombatSkill", ["string"]=""}
    state.CombatWeapon = M{["description"] = "CombatWeapon", ["string"]=""} 
    
    state.CastingMode     = M{["description"] = "CastingMode", "Normal", "Resist"}
    state.PetMode         = M{["description"] = "PetMode", "Normal", "Resist"}
    state.WeaponSkillMode = M{["description"] = "WeaponSkillMode", "Normal"}

    state.TargetAccuracy       = M{["description"] = "TargetAccuracy", "Normal"}
    state.TargetRangedAccuracy = M{["description"] = "TargetRangedAccuracy", "Normal"}

    state.CustomIdleGroups   = L{}
    state.CustomItemGroups   = L{}
    state.CustomJAGroups     = L{}
    state.CustomMAGroups     = L{}
    state.CustomMeleeGroups  = L{}
    state.CustomPetGroups    = L{}
    state.CustomRangedGroups = L{}
    state.CustomWSGroups     = L{}


    state.OffenseMode  = M{["description"] = "OffenseMode", "None", "1200 Acc", "1250 Acc", "1300+ Acc"}

    state.setPath = L{}
end


