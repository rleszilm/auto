-------------------------------------------------------------------------------
-- Auto
-------------------------------------------------------------------------------
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

    --[[
    -- Gear modes
    [DefenseMode]
      |- []

    ]]--

    state.DefenseMode         = M{['description'] = 'Defense Mode', 'None', 'Physical', 'Magical'}
    state.PhysicalDefenseMode = M{['description'] = 'Physical Defense Mode', 'PDT'}
    state.MagicalDefenseMode  = M{['description'] = 'Magical Defense Mode', 'MDT'}

    state.CombatForm   = M{["description"] = "CombatForm", "Auto", "H2H", "1H", "2H", "DW"}
    state.CombatWeapon = M{["description"] = "CombatWeapon", ["string"]=""} 
    state.CombatFocus  = M{["description"] = "CombatFocus", "Offense", "Defense"}
    state.OffenseMode  = M{["description"] = "OffenseMode", "None", "1200 Acc", "1250 Acc", "1300+ Acc"}


end