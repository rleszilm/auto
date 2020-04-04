--------------------------------------------------------------------------------
-- Binds
--------------------------------------------------------------------------------

------------------------------------------------------------
-- Module implementation
------------------------------------------------------------
local binds = {}
function binds:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    -- init state
    o.binds = {}

    return o
end

function binds:init()
end

function binds:bind(key, command)
    send_command("bind "..key.." "..command)
    self.binds[key] = command
end

function binds:release(key)
    if key and self.binds[key] then        
        send_command("unbind "..k)
        self.binds[k] = nil
    elseif key == nil then
        for k in pairs(self.binds) do
            send_command("unbind "..k)
        end
        self.binds = {}
    end 
end

------------------------------------------------------------
-- Module setup
------------------------------------------------------------
state = state or {}
state.modules = state.modules or {}
state.modules.binds = binds:new()
state.binds = state.modules.binds
