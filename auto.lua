-------------------------------------------------------------------------------
-- Auto
-------------------------------------------------------------------------------
include("auto/action")
include("auto/core")
include("auto/commands")
include("auto/gear")
include("auto/gearswap")
include("auto/select_gear")
include("../libs/Modes")
include("../libs/Mote-Utility")

------------------------------------------------------------
-- init
------------------------------------------------------------
function init()
    -- var for tracking state values
    state = state or {}

    -- config
    state.config = {}
    state.config.DebugMode = M{false, "DebugMode"}

    -- set modes
    ---- defense
    state.DefenseMode         = M{['description'] = 'Defense Mode', 'None', 'Physical', 'Magical', 'Hybrid'}
    state.PhysicalDefenseMode = M{['description'] = 'Physical Defense Mode', 'PDT'}
    state.MagicalDefenseMode  = M{['description'] = 'Magical Defense Mode', 'MDT'}
    state.HybridDefenseMode   = M{['description'] = 'Hybrid Defense Mode', 'Hybrid'}

    ---- idle
    state.IdleMode         = M{["description"] = "IdleMode", "Normal", "Refresh"}
    state.CustomIdleGroups = L{}

    ---- engaged
    state.CombatForm        = M{["description"] = "CombatForm", "Auto", "H2H", "1H", "2H", "DW"}
    state.CombatSkill       = M{["description"] = "CombatSkill", ["string"]=""}
    state.CombatWeapon      = M{["description"] = "CombatWeapon", ["string"]=""} 
    state.TargetAccuracy    = M{["description"] = "TargetAccuracy", "Normal", ""}
    state.CustomMeleeGroups = L{}
    
    ---- item
    state.CustomItemGroups   = L{}

    ---- ja
    state.CustomJAGroups     = L{}

    ---- ma
    state.CastingMode    = M{["description"] = "CastingMode", "Normal", "Resist"}
    state.CustomMAGroups = L{}

    ---- ra
    state.TargetRangedAccuracy = M{["description"] = "TargetRangedAccuracy", "Normal"}
    state.CustomRangedGroups   = L{}

    ---- ws
    state.WeaponSkillMode = M{["description"] = "WeaponSkillMode", "Normal"}
    state.CustomWSGroups  = L{}

    ---- pet_ability
    state.PetAbilityMode         = M{["description"] = "PetAbilityMode", "Normal"}
    state.CustomPetAbilityGroups = L{}
    
    ---- pet_status
    state.PetTargetAccuracy       = M{["description"] = "PetTargetAccuracy", "Normal"}
    state.CustomPetEngagedtGroups = L{}
    state.PetIdleMode             = M{["description"] = "PetIdleMode", "Normal"}
    state.CustomPetIdletGroups    = L{}
    
    -- swap modes
    state.WeaponSetMode       = M{["description"] = "WeaponSetMode", "None"}
    state.RangedWeaponSetMode = M{["description"] = "RangedWeaponSetMode", "None"}
    state.AmmoSetMode         = M{["description"] = "AmmoSetMode", "None"}
    state.TreasureHunterMode  = M{["description"] = "TreasureHunterMode", "None", "1-Hit", "Full"}

    -- Misc
    state.setPath = L{}
    state.setSwaps = L{}

    -- sets
    sets = sets or {}
    
    ---- precast
    sets.precast = {}
    sets.precast.item = {}
    sets.precast.ja = {}
    sets.precast.ma = {}
    sets.precast.pet = {}
    sets.precast.ra = {}
    sets.precast.ws = {}
    
    ---- midcast
    sets.midcast = {}
    sets.midcast.item = {}
    sets.midcast.ma = {}
    sets.midcast.pet = {}
    sets.midcast.ra = {}

    ---- engaged
    sets.engaged = {}
    
    ---- idle
    sets.idle = {}

    -- 
    optional_include({"gear/"..player.name.."/gear.lua"})
    if init_gear then
        gear = init_gear(gear)
    end

    optional_include({"gear/"..player.name.."/"..player.main_job..".lua"})
end


