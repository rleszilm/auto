--------------------------------------------------------------------------------
-- Macros
--------------------------------------------------------------------------------
packets = require("packets")
res = require("resources")

------------------------------------------------------------
-- Module implementation
------------------------------------------------------------
local macros = {}
function macros:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    -- init state
    self.locked = true
    self.macros = {}
    
    return o
end

function macros:init()
end

function macros:set_macros(macros)
    self.macros = macros
end

function macros:refresh()
    self.locked = false
    self:equip()
end

function macros:equip()
    local steps = {
        player.main_job,
        player.sub_job,
        pet.name or "No-Pet",
        state.MeleeForm.current, 
        state.MeleeSkill.current,
        state.MeleeWeapon.current,
        state.RangedSkill.current,
        state.RangedWeapon.current
    }

    local ptr = self.macros
    local set = ptr.set
    local book = ptr.book
    local style = ptr.style
    for _, step in ipairs(steps) do
        if ptr[step] then
            ptr = ptr[step]
        end

        if ptr.set then
            set = ptr.set
        end

        if ptr.book then
            book = ptr.book
        end

        if ptr.style then
            style = ptr.style
        end
    end

    local command
    if set and book then
        command = '@input /macro book '..book..';wait .1;input /macro set '..set
    elseif set then
        command = '@input /macro set '..set
    elseif book then
        command = '@input /macro book '..book
    end

    if not self.locked and style and self._style ~= style then
        self.locked = true
        self._style = style
        if command then
            command = command..';wait.1;input /lockstyle '..style
        else
            command = '@input /lockstyle '..style
        end
    end

    send_command(command)
end

------------------------------------------------------------
-- Gearswap hooks
------------------------------------------------------------
function macros:pet_change(pet, gain)
    self:equip()
end

------------------------------------------------------------
-- Auto hooks
------------------------------------------------------------
function set_macros(macros)
    state.modules.macros:set_macros(macros)
end

------------------------------------------------------------
-- Event handlers
------------------------------------------------------------
function on_chunk(id, data, modified, injected, blocked)
    if injected then
        return
    elseif id == 0x50 then -- equip gear
        state.modules.macros:equip()
    elseif id == 0x67 then -- character sync
        state.modules.macros:refresh()
    end
end

------------------------------------------------------------
-- Module setup
------------------------------------------------------------
state = state or {}
state.modules = state.modules or {}
state.modules.macros = macros:new()

-- setup event handlers
windower.raw_register_event('incoming chunk', on_chunk)
