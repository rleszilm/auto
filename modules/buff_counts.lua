--------------------------------------------------------------------------------
-- Buff Counts
--------------------------------------------------------------------------------

------------------------------------------------------------
-- Module implementation
------------------------------------------------------------
local buffcounts = {}
function buffcounts:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    -- init state
    o.songs = S{
        "Requim", "Lullaby", "Elegy", "Paeon", "Ballad",
        "Minne", "Minuet", "Madrigal", "Prelude", "Mambo",
        "Aubade", "Pastoral", "Hum", "Fantasia", "Operetta",
        "Capriccio", "Serenade", "Round", "Gavotte", "Fugue",
        "Rhapsody", "Aria", "March", "Etude", "Carol",
        "Threnody", "Hymnus", "Mazurka", "Sirvente", "Dirge",
        "Scherzo", "Nocturne"
    }

    o.enspellCount = 0
    o.songCount = 0
    o.rollCount = 0

    return o
end

function buffcounts:init()
    for buff, _ in pairs(buffactive) do
        self:buff_change({}, buff, true, {})
    end
end

------------------------------------------------------------
-- Gearswap hooks
------------------------------------------------------------
function buffcounts:buff_change(eventArgs, name, gain, buff_details)
    delta = (gain and 1) or -1
    if self.songs:contains(name) then
        self.songCount = self.songCount + delta
        if self.songCount < 0 then
            self.songCount = 0
        end
    elseif string.sub(name, -4) == "Roll" then
        self.rollCount = self.rollCount + delta
        if self.rollCount < 0 then
            self.rollCount = 0
        end
    end
end

function buffcounts:status_change(eventArgs, new, old)
    if new == "Dead" or new == "Engaged dead" then
        self.songCount = 0
        self.rollCount = 0
    end
end

------------------------------------------------------------
-- Auto hooks
------------------------------------------------------------
function buff_counts()
    local t = {}

    if state.modules.buffcounts.songCount > 0 then
        t[#t+1] = "Songs-"..state.modules.buffcounts.songCount
    end

    if state.modules.buffcounts.rollCount > 0 then
        t[#t+1] = "Rolls-"..state.modules.buffcounts.rollCount
    end
    return t
end

------------------------------------------------------------
-- Module setup
------------------------------------------------------------
state = state or {}
state.modules = state.modules or {}
state.modules.buffcounts = buffcounts:new()
