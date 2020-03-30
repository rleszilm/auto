--------------------------------------------------------------------------------
-- Skill Chains
--------------------------------------------------------------------------------
include("../libs/Modes")
res = require("resources")

------------------------------------------------------------
-- Module implementation
------------------------------------------------------------
local rangedattack = {}
function rangedattack:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    -- init state
    o.Mode = M(false, 'RA Mode')
    o.TargetMode = M{['description'] = 'RA Target', '<t>', '<stnpc>'}
    return o
end

function rangedattack:init()
    -- Ensure necessary addons are loaded
    send_command('lua load AutoRA')
end

function rangedattack:self_command(eventArgs, command)
    if command[1] == "toggle" then
        update_mode("RangedAttack.Mode", self.Mode, "toggle")
        if self.Mode.current == "on" then
            send_command("ara start")
        else
            send_command("ara stop")
        end
    elseif command[1] == "cycle" then
        update_mode("RangedAttack.TargetMode", self.TargetMode, "cycle")
    elseif command[1] == "cycleback" then
        update_mode("RangedAttack.TargetMode", self.TargetMode, "cycleback")
    elseif command[1] == "ra" then
        send_command("input /ra "..self.RangedTargetMode.current)
    end
end

------------------------------------------------------------
-- Auto hooks
------------------------------------------------------------

------------------------------------------------------------
-- Event handlers
------------------------------------------------------------

------------------------------------------------------------
-- Module setup
------------------------------------------------------------
state = state or {}
state.modules = state.modules or {}
state.modules.rangedattack = rangedattack:new()
