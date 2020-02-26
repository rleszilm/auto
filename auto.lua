-------------------------------------------------------------------------------
-- Auto
-------------------------------------------------------------------------------
include("auto/commands")
include("auto/gear")
include("auto/gearswap")
include("auto/select_gear")
include("auto/combat_form")
include("auto/gearinfo")
include("auto/snapshot_bucket")
include("../libs/Modes")
include("../libs/Mote-Utility")

------------------------------------------------------------
-- init
------------------------------------------------------------
function init()
    ------------------------------------------------------------
    -- state
    ------------------------------------------------------------
    state = state or {}

    ------------------------------------------------------------
    -- config
    ------------------------------------------------------------
    state.config = {}
    state.config.DebugMode = M{false, "DebugMode"}

    ------------------------------------------------------------
    -- set modes
    ------------------------------------------------------------
    -- defense
    ----------------------------------------
    state.DefenseMode         = M{['description'] = 'Defense Mode', 'None', 'Physical', 'Magical', 'Hybrid'}
    state.PhysicalDefenseMode = M{['description'] = 'Physical Defense Mode', 'Default'}
    state.MagicalDefenseMode  = M{['description'] = 'Magical Defense Mode', 'Default'}
    state.HybridDefenseMode   = M{['description'] = 'Hybrid Defense Mode', 'Default'}

    ----------------------------------------
    -- engaged
    ----------------------------------------
    state.MeleeForm         = M{["description"] = "MeleeForm", "H2H", "1H", "2H", "DW"}
    state.MeleeFormOverride = M{["description"] = "MeleeFormOverride", "Auto", "H2H", "1H", "2H", "DW"}
    state.MeleeSkill        = M{["description"] = "MeleeSkill", ["string"]=""}
    state.MeleeWeapon       = M{["description"] = "MeleeWeapon", ["string"]=""} 
    state.TargetAccuracy    = M{["description"] = "TargetAccuracy", "Default"}
    state.CustomMeleeGroups = L{}

    ----------------------------------------
    -- idle
    ----------------------------------------
    state.IdleMode         = M{["description"] = "IdleMode", "Normal", "Refresh"}
    state.CustomIdleGroups = L{}

    ----------------------------------------
    -- item
    ----------------------------------------
    state.CustomItemGroups = L{}

    ----------------------------------------
    -- ja
    ----------------------------------------
    state.CustomJAGroups = L{}

    ----------------------------------------
    -- ma
    ----------------------------------------
    state.CastingMode    = M{["description"] = "CastingMode", "Normal", "Resist"}
    state.CustomMAGroups = L{}

    ----------------------------------------
    -- pet
    ----------------------------------------
    -- ability
    state.PetAbilityMode         = M{["description"] = "PetAbilityMode", "Normal"}
    state.CustomPetAbilityGroups = L{}
    
    -- status
    state.PetTargetAccuracy       = M{["description"] = "PetTargetAccuracy", "Normal"}
    state.CustomPetEngagedtGroups = L{}
    state.PetIdleMode             = M{["description"] = "PetIdleMode", "Normal"}
    state.CustomPetIdletGroups    = L{}

    ----------------------------------------
    -- ra
    ----------------------------------------
    state.RangedSkill          = M{["description"] = "RangedSkill", ["string"]=""}
    state.RangedWeapon         = M{["description"] = "RangedWeapon", ["string"]=""}
    state.RangedAmmo           = M{["description"] = "RangedAmmo", ["string"]=""}
    state.TargetRangedAccuracy = M{["description"] = "TargetRangedAccuracy", "Normal"}
    state.CustomRangedGroups   = L{}

    ----------------------------------------
    -- ws
    ----------------------------------------
    state.WeaponSkillMode = M{["description"] = "WeaponSkillMode", "Normal"}
    state.CustomWSGroups  = L{}
    
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
    sets.engaged.defense = {}
    sets.engaged.defense.Physical = {}
    sets.engaged.defense.Magical = {}
    sets.engaged.defense.Hybrid = {}
    
    ---- idle
    sets.idle = {}

    ---- weapons
    sets.weapons = {}
    sets.rangedweapons = {}
    sets.ammo = {}

    ---- swaps
    sets.swaps = {}

    -- load optional logic files
    optional_include({"gear/"..player.name.."/logic.lua"})
    optional_include({"gear/"..player.name.."/"..player.main_job.."_logic.lua"})

    -- load gear
    optional_include({"gear/"..player.name.."/gear.lua"})
    if init_gear then
        gear = init_gear(gear)
    end

    -- load sets
    optional_include({"gear/"..player.name.."/"..player.main_job..".lua"})
    if init_gear_sets then
        sets = init_gear_sets(sets)
    else
        windower.add_to_chat(12, "init_gear_sets has not been defined")
    end

    -- init extras
    for _, m in pairs(state.modules) do
        if m.init then
            m:init()
        end
    end
end
