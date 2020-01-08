--------------------------------------------------------------------------------
-- Player gear setup
--------------------------------------------------------------------------------
-- Add etnries to the gear map here for gear that should be used in multiple job sets.
function init_gear()
    ------------------------------------------------------------
    -- ELEMENTAL_GEAR
    ------------------------------------------------------------
    -- defaults for elemental gear swaps as provided by mote
    -- gear.ElementalGorget.name - Fotia Gorget    | gear.default_weaponskill_neck  | ""
    gear.default_weaponskill_neck = ""
    -- gear.ElementalBelt.name   - Fotia Belt      | gear.default.weaponskill_waist | ""
    gear.default.weaponskill_waist = ""
    -- gear.ElementalObi.name    - Hachirin-no-obi | gear.default.obi_waist         | ""
    gear.default.obi_waist = ""
    -- gear.ElementalCape.name   - if Obi: Twilight Cape else: gear.default.obi_back
    gear.default.obi_back = ""
    -- gear.ElementalRing.name   - if Obi and Not Divine|Dark|Healing|Impact: Zodiac Ring else: gear.default.obi_ring
    gear.default.obi_ring = ""
    -- gear.FastcastStaff.name   - elemental staff | gear.default.fastcast_staff    | ""
    gear.default.fastcast_staff = ""
    -- gear.FastcastStaff.name   - elemental staff | gear.default.recast_staff      | ""
    gear.default.recast_staff = ""

    
    ------------------------------------------------------------
    -- JSE Gear
    ------------------------------------------------------------
    -- GEO
    gear.JSE.GEO.Back = {name="Nantosuelta's Cape"}
    gear.JSE.GEO.Back.DT = {name="Nantosuelta's Cape", augments={'Damage taken-4%'}}
end