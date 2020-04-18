--------------------------------------------------------------------------------
-- Combat Form
--------------------------------------------------------------------------------
packets = require("packets")
res = require("resources")

local handToHand = S{"(N/A)", "Hand-to-Hand"}
local oneHanded  = S{"Dagger", "Sword", "Axe", "Katana", "Club"}
local twoHanded  = S{"Great Sword", "Scythe", "Polearm", "Great Katana", "Staff"}

------------------------------------------------------------
-- Module implementation
------------------------------------------------------------
local combatform = {}
function combatform:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    -- init state
    o.mainSkill = 0
    o.subSkill = 0

    return o
end

function combatform:init()
    local inv = windower.ffxi.get_items().equipment
    for _, s in pairs({"main", "sub", "range", "ammo"}) do
        local p = {}
        p['Inventory Bag'] = inv[s.."_bag"]
        p['Inventory Index'] = inv[s]
        self['equip_'..s](self, p)
    end
end

function combatform:equip_main(p)
    local i = windower.ffxi.get_items(p['Inventory Bag'], p['Inventory Index'])
    local item = res.items[i.id]

    if item and item.skill then
        self.mainSkill = res.skills[item.skill].en
        self:set_form()
        self:set("MeleeSkill", self.mainSkill)
        self:set("MeleeWeapon", item.en)
    else
        self.mainSkill = res.skills[1].en
        self:set_form()
        self:set("MeleeSkill", self.mainSkill)
        self:set("MeleeWeapon", "None")
    end 
end

function combatform:equip_sub(p)
    local i = windower.ffxi.get_items(p['Inventory Bag'], p['Inventory Index'])
    local item = res.items[i.id]

    if item and item.skill then
        self.subSkill = res.skills[item.skill].en
        self:set("OffhandWeapon", item.en)
    else
        self.subSkill = res.skills[0].en
        self:set("OffhandWeapon", "None")
    end

    self:set_form()
end

function combatform:equip_range(p)
    local i = windower.ffxi.get_items(p['Inventory Bag'], p['Inventory Index'])
    local item = res.items[i.id]

    if item and item.skill then
        self.ranged = item
        self:set("RangedSkill", res.skills[item.skill].en)
        self:set("RangedWeapon", item.en)
    else
        self.ranged = nil
        self:set("RangedSkill", res.skills[0].en)
        self:set("RangedWeapon", "None")
    end
end

function combatform:equip_ammo(p)
    local i = windower.ffxi.get_items(p['Inventory Bag'], p['Inventory Index'])
    local item = res.items[i.id]

    if item and item.skill and item.skill == 27 then
        -- 27 is throwing, the ammo is the weapon
        self:set("RangedSkill", res.skills[item.skill].en)
        self:set("RangedWeapon", item.en)
        self:set("RangedAmmo", "None")
    elseif item and item.skill and item.skill == 0 then
        -- 0 is no skill, items such as fire bomblets
        self:set("RangedSkill", res.skills[0].en)
        self:set("RangedWeapon", "None")
        self:set("RangedAmmo", "None")
    elseif item and item.skill then
        self:set("RangedSkill", res.skills[item.skill].en)
        self:set("RangedAmmo", item.en)
    else
        -- if no skill the item is gil
        if state.modules.combatform.ranged then
            self:set("RangedAmmo", "None")
        else
            self:set("RangedSkill", res.skills[0].en)
            self:set("RangedWeapon", "None")
            self:set("RangedAmmo", "None")
        end
    end
end

function combatform:set_form()
    if oneHanded:contains(self.mainSkill) and oneHanded:contains(self.subSkill) then
        self:set("MeleeForm", "DW")
    elseif oneHanded:contains(self.mainSkill) then
        self:set("MeleeForm", "1H")
    elseif twoHanded:contains(self.mainSkill) then
        self:set("MeleeForm", "2H")
    elseif handToHand:contains(self.mainSkill) then
        self:set("MeleeForm", "H2H")
    end
end

function combatform:set(attr, value)
    if state[attr].current == value then
        return
    end

    windower.add_to_chat(16, "Setting "..attr.." -> "..value)
    state[attr]:set(value)
    handle_action("refresh")
end

------------------------------------------------------------
-- Event handlers
------------------------------------------------------------
function on_equip(id, data, modified, injected, blocked)
    if injected or id ~= 0x50 then
        return
    end

    local p = packets.parse("incoming", data)
    if p['Equipment Slot'] >= 4 then
        return
    end

    if p['Equipment Slot'] == 0 then
        state.modules.combatform:equip_main(p)
    elseif p['Equipment Slot'] == 1 then
        state.modules.combatform:equip_sub(p)
    elseif p['Equipment Slot'] == 2 then
        state.modules.combatform:equip_range(p)
    elseif p['Equipment Slot'] == 3 then
        state.modules.combatform:equip_ammo(p)
    end
end

------------------------------------------------------------
-- Module setup
------------------------------------------------------------
state = state or {}
state.modules = state.modules or {}
state.modules.combatform = combatform:new()

-- setup event handlers
windower.raw_register_event('incoming chunk', on_equip)
