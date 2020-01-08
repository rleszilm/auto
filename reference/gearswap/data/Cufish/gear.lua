--------------------------------------------------------------------------------
-- Player gear setup
--------------------------------------------------------------------------------
-- Add etnries to the gear map here for gear that should be used in multiple job sets.
function init_gear()
    ------------------------------------------------------------
    -- Quested Augmentable items
    ------------------------------------------------------------

    ------------------------------------------------------------
    -- JSE Gear
    ------------------------------------------------------------
    -- WHM
    gear.QuellerRod = {name="Queller Rod"}
    gear.QuellerRod.D = {name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%'}}

    gear.JSE.WHM.Back = {name="Alaunus's Cape"}
    gear.JSE.WHM.Back.DT = {name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}
    gear.JSE.WHM.Back.FC = gear.JSE.WHM.Back.DT
    
    ------------------------------------------------------------
    -- Reisenjima Gear
    ------------------------------------------------------------
    -- Weapons
    ----------------------------------------

    ----------------------------------------
    -- Chironic
    ----------------------------------------
    gear.Chironic.Hands.Refresh = {name="Chironic Gloves", augments={'"Fast Cast"+5','"Blood Pact" ability delay -1','"Refresh"+1','Accuracy+1 Attack+1',}}
    gear.Chironic.Legs.Refresh = {name="Chironic Hose", augments={'"Subtle Blow"+10','Pet: "Store TP"+10','"Refresh"+2'}}

    ------------------------------------------------------------
    -- Alluvion Skirmish Gear
    ------------------------------------------------------------
    -- Weapons
    ----------------------------------------

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
end