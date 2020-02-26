--------------------------------------------------------------------------------
-- Gear Info
--------------------------------------------------------------------------------

------------------------------------------------------------
-- Module implementation
------------------------------------------------------------
local gearinfo = {}
function gearinfo:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    -- init state
    o.dw_needed = 0
    o.total_haste = 0
    o.running = false

    return o
end

function gearinfo:init()
end

function gearinfo:self_command(eventArgs, command)
    if self:set('dw_needed', command[2]) then
        eventArgs.handled = true
        eventArgs.equip = true
    end

    if self:set('total_haste', command[3]) then
        eventArgs.handled = true
        eventArgs.equip = true
    end

    if self:set('running', command[4] == 'true') then
        eventArgs.handled = true
        eventArgs.equip = true
    end
end

function gearinfo:set(attr, value)
    if self[attr] ~= value then
        windower.add_to_chat(16, "Setting "..attr.." -> "..tostring(value))
        self[attr] = value
        return true
    end
    return false
end

------------------------------------------------------------
-- Auto hooks
------------------------------------------------------------
function haste_bucket()
    if job_haste_bucket then
        return "DW-"..job_haste_bucket(state.modules.gearinfo.dw_needed)
    end

    if user_haste_bucket then
        return "DW-"..user_haste_bucket(state.modules.gearinfo.dw_needed)
    end

    if auto_haste_bucket then
        return "DW-"..auto_haste_bucket(state.modules.gearinfo.dw_needed)
    end
end

function auto_haste_bucket(dw_needed)
    if dw_needed == "false" then
        return "0"
    end
    
    dw_needed = tonumber(dw_needed)
    if not dw_needed then
        return "0"
    elseif dw_needed <= 7 then
        return "7"
    elseif dw_needed <= 11 then
        return "11"
    elseif dw_needed <= 31 then
        return "31"
    elseif dw_needed <= 41 then
        return "41"
    elseif dw_needed <= 48 then
        return "48"
    else
        return "ALot"
    end
end

function swap_running()
    return state.modules.gearinfo.running
end

------------------------------------------------------------
-- Module setup
------------------------------------------------------------
state = state or {}
state.modules = state.modules or {}
state.modules.gearinfo = gearinfo:new()
