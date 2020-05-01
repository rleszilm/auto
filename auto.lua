-------------------------------------------------------------------------------
-- Auto
-------------------------------------------------------------------------------
include("auto/commands")
include("auto/gear")
include("auto/gearswap")
include("auto/receiving")
include("auto/select_gear")
include("auto/spell_groups")

-- modules
include("auto/modules/binds")
include("auto/modules/combat_form")
include("auto/modules/gearinfo")
include("auto/modules/inventory_loaded")
include("auto/modules/macros")
include("auto/modules/ranged_attack")
include("auto/modules/skill_chains")
include("auto/modules/snapshot_bucket")

-- mote code
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

    -- buffs to find sets for
    state.buffs = L{}
    state.buffactiveCustom = {}
    
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
    state.MeleeFormOverride = M{["description"] = "MeleeFormOverride", "None", "H2H", "1H", "2H", "DW"}
    state.MeleeSkill        = M{["description"] = "MeleeSkill", ["string"]=""}
    state.MeleeWeapon       = M{["description"] = "MeleeWeapon", ["string"]=""}
    state.OffhandWeapon     = M{["description"] = "OffhandWeapon", ["string"]=""}
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
    state.PetTargetAccuracy      = M{["description"] = "PetTargetAccuracy", "Normal"}
    state.CustomPetEngagedGroups = L{}
    state.PetIdleMode            = M{["description"] = "PetIdleMode", "Normal"}
    state.CustomPetIdleGroups    = L{}

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
    state.WeaponSetMode       = M{["description"] = "WeaponSetMode", "Manual"}
    state.RangedWeaponSetMode = M{["description"] = "RangedWeaponSetMode", "Manual"}
    state.AmmoSetMode         = M{["description"] = "AmmoSetMode", "Manual"}
    state.TreasureHunterMode  = M{["description"] = "TreasureHunterMode", "None", "1-Hit", "Full"}

    -- swap functions
    state.swaps = {}

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

    -- receiving
    sets.receiving = {}
    sets.receiving.ma = {}

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

    ----------------------------------------
    -- load player files
    ----------------------------------------
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
        init_gear_sets(sets)
    else
        windower.add_to_chat(12, "init_gear_sets has not been defined")
    end

    ----------------------------------------
    -- setup
    ----------------------------------------
    -- auto setup
    if auto_setup then
        state = auto_setup(state)
    end

    -- user setup
    if user_setup then
        state = user_setup(state)
    end

    -- job setup
    if job_setup then
        state = job_setup(state)
    end

    ----------------------------------------
    -- binds
    ----------------------------------------
    if auto_binds then
        auto_binds(state)
    end

    if user_binds then
        user_binds(state)
    end

    if job_binds then
        job_binds(state)
    end

    ----------------------------------------
    -- init modules
    ----------------------------------------
    for _, m in pairs(state.modules) do
        if m.init then
            m:init()
        end
    end
end

function auto_binds(state)
    -- set binds
    -- ^ - Ctrl
    -- ! - Alt
    -- @ - Win
    -- # - Apps
    -- ~ - Shift

    -- weapon toggles
    state.binds:bind("f9", "gs c cycle WeaponSetMode")
    state.binds:bind("~f9", "gs c cycleback WeaponSetMode")
    state.binds:bind("^f9", "gs c cycle RangedWeaponSetMode")
    state.binds:bind("~^f9", "gs c cycleback RangedWeaponSetMode")
    state.binds:bind("!f9", "gs c cycle AmmoSetMode")
    state.binds:bind("~!f9", "gs c cycleback AmmoSetMode")
    state.binds:bind("@f9", "gs c cycle MeleeFormOverride")
    state.binds:bind("~@f9", "gs c cycleback MeleeFormOverride")

    -- armor toggles
    state.binds:bind("f10", "gs c cycle DefenseMode")
    state.binds:bind("~f10", "gs c cycleback DefenseMode")
    state.binds:bind("^f10", "gs c cycle PhysicalDefenseMode")
    state.binds:bind("~^f10", "gs c cycleback PhysicalDefenseMode")
    state.binds:bind("!f10", "gs c cycle MagicalDefenseMode")
    state.binds:bind("~!f10", "gs c cycleback MagicalDefenseMode")
    state.binds:bind("@f10", "gs c cycle HybridDefenseMode")
    state.binds:bind("~@f10", "gs c cycleback HybridDefenseMode")

    -- engaged forms
    state.binds:bind("f11", "gs c cycle TargetAccuracy")
    state.binds:bind("~f11", "gs c cycleback TargetAccuracy")
    state.binds:bind("^f11", "gs c cycle TargetRangedAccuracy")
    state.binds:bind("~^f11", "gs c cycleback TargetRangedAccuracy")

end

function update_mode(...)
    local args = {...}

    local label
    local mode
    local method

    if #args == 2 then
        label = args[1]
        method = args[2]

        local tokens = args[1]:split(".")

        mode = state
        for _, k in pairs(tokens) do
            mode = mode[k]
            if mode == nil then
                return
            end
        end
    elseif #args == 3 then
        label = args[1]
        mode = args[2]
        method = args[3]
    end

    if mode and mode[method] then
        local old = mode.current
        mode[method](mode)
        if old ~= mode.current then
            windower.add_to_chat(14, label..": "..old.." -> "..mode.current)
        end
    else
        windower.add_to_chat(11, "Bad call to update_mode")
        table.print(args)
        return
    end
end