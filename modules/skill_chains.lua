--------------------------------------------------------------------------------
-- Skill Chains
--------------------------------------------------------------------------------
include("../libs/Modes")
res = require("resources")

------------------------------------------------------------
-- Module implementation
------------------------------------------------------------
local skillchains = {}
function skillchains:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    -- init state
    o.Mode = M{['description'] = 'SkillChain', 'None'}
    o.TargetMode = M{['description'] = 'SkillChain Target', '<t>', '<stnpc>'}
    o.SkillChains = {}
    o.NextSkill = 1
    
    return o
end

function skillchains:init()
end

function skillchains:chains(keys, chains)
    self.SkillChains = chains
    self.Mode:options(unpack(keys))
    self.Mode:set(keys[1])
end

function skillchains:ws()
    local sc = self.SkillChains[self.Mode.current]

    local ws
    if type(sc) == "table" then
        ws = sc[self.NextSkill]
        if #sc == self.NextSkill then
            self.NextSkill = 1
        else
            self.NextSkill = self.NextSkill + 1
        end
        windower.add_to_chat(16, "Using: <"..ws.."> Next: <"..sc[self.NextSkill]..">")
    else
        ws = sc
    end

    if ws then
        send_command("input /ws "..ws.." "..self.TargetMode.current)
    end
end

function skillchains:self_command(eventArgs, command)
    if command[1] == "cycle" then
        if command[2] == "chain" then
            update_mode("SkillChains.Mode", self.Mode, "cycle")
        elseif command[2] == "target" then
            update_mode("SkillChains.TargetMode", self.TargetMode, "cycle")
        end
    elseif command[1] == "cycleback" then
        if command[2] == "chain" then
            update_mode("SkillChains.Mode", self.Mode, "cycleback")
        elseif command[2] == "target" then
            update_mode("SkillChains.TargetMode", self.TargetMode, "cycleback")
        end
    elseif command[1] == "ws" then
        self:ws()
    end
end

------------------------------------------------------------
-- Auto hooks
------------------------------------------------------------
function sc_set_chains(keys, chains)
    state.modules.skillchains:chains(keys, chains)
end

------------------------------------------------------------
-- Event handlers
------------------------------------------------------------

------------------------------------------------------------
-- Module setup
------------------------------------------------------------
state = state or {}
state.modules = state.modules or {}
state.modules.skillchains = skillchains:new()
