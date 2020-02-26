--------------------------------------------------------------------------------
-- Snapshot Bucket
--------------------------------------------------------------------------------
res = require("resources")

------------------------------------------------------------
-- Module implementation
------------------------------------------------------------
local snapshot = {}
function snapshot:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    -- init state
    o.flurry = 0

    return o
end

function snapshot:init()
end

function snapshot:set_flurry(tier)
    if self.flurry ~= tier then
        windower.add_to_chat(16, "Setting Snapshot Bucket -> Flurry-"..tier)
        self.flurry = tier
    end
end

function snapshot:get_bucket(s)
    return "Flurry-"..self.flurry
end

------------------------------------------------------------
-- Auto hooks
------------------------------------------------------------
function snapshot_bucket()
    return state.modules.snapshot:get_bucket()
end

------------------------------------------------------------
-- Event handlers
------------------------------------------------------------
function on_gain_flurry(action)
    local self = player.id
    for _, target in ipairs(action.targets) do
        if self == target.id then
            if action.category == 4 then -- finish spell casting
                local param = action.param
                if param == 845 then -- Flurry
                    state.modules.snapshot:set_flurry(1)
                elseif param == 846 then -- Flurry 2
                    state.modules.snapshot:set_flurry(2)
                end
            end
        end
    end
end

function on_lose_flurry(buff_id)
    if buff_id == 265 or buff_id == 581 then
        state.modules.snapshot:set_flurry(0)
    end
end

------------------------------------------------------------
-- Module setup
------------------------------------------------------------
state = state or {}
state.modules = state.modules or {}
state.modules.snapshot = snapshot:new()

-- setup event handlers
windower.register_event('action', on_gain_flurry)
windower.register_event('lose buff', on_lose_flurry)
    