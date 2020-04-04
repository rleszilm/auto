--------------------------------------------------------------------------------
-- Inventory
--------------------------------------------------------------------------------
packets = require("packets")

------------------------------------------------------------
-- Module implementation
------------------------------------------------------------
local inventory = {}
function inventory:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
   
    return o
end

function inventory:init()
end

function inventory:is_loaded()
    return self.loaded
end

function inventory:update(id, seq)
    if (self.nextSequence and seq == self.nextSequence) and self.zoneSearch then
        self.loaded = true
        self_command("inventory_loaded")
    end

    if id == 0x00B then -- Last packet of an old zone
        self.zoneSearch = false
        self.loaded = false
    elseif id == 0x00A then -- First packet of a new zone, redundant because someone could theoretically load findAll between the two
        self.zoneSearch = false
        self.loaded = false
    elseif id == 0x01D and not self.zoneSearch then
    -- This packet indicates that the temporary item structure should be copied over to
    -- the real item structure, accessed with get_items(). Thus we wait one packet and
    -- then trigger an update.
        self.zoneSearch = true
        self.nextSequence = (seq+22)%0x10000 -- 128 packets is about 1 minute. 22 packets is about 10 seconds.
    elseif (id == 0x1E or id == 0x1F or id == 0x20) and self.zoneSearch then
    -- Inventory Finished packets aren't sent for trades and such, so this is more
    -- of a catch-all approach. There is a subtantial delay to avoid spam writing.
    -- The idea is that if you're getting a stream of incoming item packets (like you're gear swapping in an intense fight),
    -- then it will keep putting off triggering the update until you're not.
        self.nextSequence = (seq+22)%0x10000
    end
end

------------------------------------------------------------
-- Gearswap hooks
------------------------------------------------------------

------------------------------------------------------------
-- Auto hooks
------------------------------------------------------------
function inv_loaded()
    return state.modules.inventory:is_loaded()
end

------------------------------------------------------------
-- Event handlers
------------------------------------------------------------
function on_chunk(id, data, modified, injected, blocked)
    local seq = data:unpack('H',3)
    state.modules.inventory:update(id, seq)
end

------------------------------------------------------------
-- Module setup
------------------------------------------------------------
state = state or {}
state.modules = state.modules or {}
state.modules.inventory = inventory:new()

-- setup event handlers
windower.raw_register_event('incoming chunk', on_chunk)
