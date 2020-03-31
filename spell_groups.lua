--------------------------------------------------------------------------------
-- Spell Groups
--------------------------------------------------------------------------------
include("../libs/Mote-Mappings")

--------------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------------
function get_spell_group(spell)
    local group
    
    for _, fun in pairs({job_get_spell_group, user_get_spell_group, auto_get_spell_group}) do
        if fun then
            local g = fun(spell)
            if g then
                return g
            end
        end
    end
end

function auto_get_spell_group(spell)
    if spell then
        if spell_maps[spell.en] then
            return spell_maps[spell.en]
        elseif spell_maps[spell.type] and spell_maps[spell.type][spell.en] then
            return spell_maps[spell.type][spell.en]
        elseif spell.type == "CorsairRoll" then
            return spell.type
        end
    end
end

------------------------------------------------------------
-- Blue Magic
------------------------------------------------------------
spell_maps['Blue Magic'] = {}

----------------------------------------
-- Physical
----------------------------------------
spell_maps['Blue Magic'].BilgeStorm = 'Physical'

----------------------------------------
-- Physical.Accuracy
----------------------------------------
spell_maps['Blue Magic']['Heavy Strike'] = {'Physical', 'Accuracy'}

----------------------------------------
-- Physical.STR
----------------------------------------
spell_maps['Blue Magic']['Battle Dance'] = {'Physical', 'STR'}
spell_maps['Blue Magic']['Bloodrake'] = {'Physical', 'STR'}
spell_maps['Blue Magic']['Death Scissors'] = {'Physical', 'STR'}
spell_maps['Blue Magic']['Dimensional Death'] = {'Physical', 'STR'}
spell_maps['Blue Magic']['Empty Thrash'] = {'Physical', 'STR'}
spell_maps['Blue Magic']['Quadrastrike'] = {'Physical', 'STR'}
spell_maps['Blue Magic']['Sinker Drill'] = {'Physical', 'STR'}
spell_maps['Blue Magic']['Spinal Cleave'] = {'Physical', 'STR'}
spell_maps['Blue Magic']['Uppercut'] = {'Physical', 'STR'}
spell_maps['Blue Magic']['Vertical Cleave'] = {'Physical', 'STR'}

----------------------------------------
-- Physical.DEX
----------------------------------------
spell_maps['Blue Magic']['Amorphic Spikes'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Asuran Claws'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Barbed Crescent'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Claw Cyclone'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Disseverment'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Foot Kick'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Frenetic Rip'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Goblin Rush'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Hysteric Barrage'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Paralyzing Triad'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Seedspray'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Sickle Slash'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Smite of Rage'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Terror Touch'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Thrashing Assault'] = {'Physical', 'DEX'}
spell_maps['Blue Magic']['Vanity Dive'] = {'Physical', 'DEX'}

----------------------------------------
-- Physical.VIT
----------------------------------------
spell_maps['Blue Magic']['Body Slam'] = {'Physical', 'VIT'}
spell_maps['Blue Magic']['Cannonball'] = {'Physical', 'VIT'}
spell_maps['Blue Magic']['Delta Thrust'] = {'Physical', 'VIT'}
spell_maps['Blue Magic']['Glutinous Dart'] = {'Physical', 'VIT'}
spell_maps['Blue Magic']['Grans Slam'] = {'Physical', 'VIT'}
spell_maps['Blue Magic']['Power Attack'] = {'Physical', 'VIT'}
spell_maps['Blue Magic']['Quad. Continuum'] = {'Physical', 'VIT'}
spell_maps['Blue Magic']['Sprout Smack'] = {'Physical', 'VIT'}
spell_maps['Blue Magic']['Sub-zero Smash'] = {'Physical', 'VIT'}

----------------------------------------
-- Physical.AGI
----------------------------------------
spell_maps['Blue Magic']['Benthic Typhoon'] = {'Physical', 'AGI'}
spell_maps['Blue Magic']['Feather Storm'] = {'Physical', 'AGI'}
spell_maps['Blue Magic']['Helldive'] = {'Physical', 'AGI'}
spell_maps['Blue Magic']['Hydro Shot'] = {'Physical', 'AGI'}
spell_maps['Blue Magic']['Jet Stream'] = {'Physical', 'AGI'}
spell_maps['Blue Magic']['Pinecone Bomb'] = {'Physical', 'AGI'}
spell_maps['Blue Magic']['Spiral Spin'] = {'Physical', 'AGI'}
spell_maps['Blue Magic']['Wild Oats'] = {'Physical', 'AGI'}

----------------------------------------
-- Physical.INT
----------------------------------------
spell_maps['Blue Magic']['Mandibular Bite'] = {'Physical', 'INT'}
spell_maps['Blue Magic']['Queasyshroom'] = {'Physical', 'INT'}

----------------------------------------
-- Physical.MND
----------------------------------------
spell_maps['Blue Magic']['Ram Charge'] = {'Physical', 'MND'}
spell_maps['Blue Magic']['Screwdriver'] = {'Physical', 'MND'}
spell_maps['Blue Magic']['Tourbillion'] = {'Physical', 'MND'}

----------------------------------------
-- Physical.CHR
----------------------------------------
spell_maps['Blue Magic']['Bludgeon'] = {'Physical', 'CHR'}

----------------------------------------
-- Physical.HP
----------------------------------------
spell_maps['Blue Magic']['Final Sting'] = {'Physical', 'HP'}

----------------------------------------
-- Magical
----------------------------------------
spell_maps['Blue Magic']['Blastbomb'] = 'Magical'
spell_maps['Blue Magic']['Blazing Bound'] = 'Magical'
spell_maps['Blue Magic']['Bomb Toss'] = 'Magical'
spell_maps['Blue Magic']['Cursed Sphere'] = 'Magical'
spell_maps['Blue Magic']['Dark Orb'] = 'Magical'
spell_maps['Blue Magic']['Death Ray'] = 'Magical'
spell_maps['Blue Magic']['Diffusion Ray'] = 'Magical'
spell_maps['Blue Magic']['Droning Whirlwind'] = 'Magical'
spell_maps['Blue Magic']['Embalming Earth'] = 'Magical'
spell_maps['Blue Magic']['Firespit'] = 'Magical'
spell_maps['Blue Magic']['Foul Waters'] = 'Magical'
spell_maps['Blue Magic']['Ice Break'] = 'Magical'
spell_maps['Blue Magic']['Leafstorm'] = 'Magical'
spell_maps['Blue Magic']['Maelstrom'] = 'Magical'
spell_maps['Blue Magic']['Rail Cannon'] = 'Magical'
spell_maps['Blue Magic']['Regurgitation'] = 'Magical'
spell_maps['Blue Magic']['Rending Deluge'] = 'Magical'
spell_maps['Blue Magic']['Retinal Glare'] = 'Magical'
spell_maps['Blue Magic']['Subduction'] = 'Magical'
spell_maps['Blue Magic']['Tem. Upheaval'] = 'Magical'
spell_maps['Blue Magic']['Water Bomb'] = 'Magical'
spell_maps['Blue Magic']['Spectral Floe'] = 'Magical'
spell_maps['Blue Magic']['Entomb'] = 'Magical'

----------------------------------------
-- Magical.Dark
----------------------------------------
spell_maps['Blue Magic']['Tenebral Crush'] = {'Magical', 'Dark'}

----------------------------------------
-- Magical.DEX
----------------------------------------
spell_maps['Blue Magic']['Charged Whisker'] = {'Magical', 'DEX'}
spell_maps['Blue Magic']['Gates of Hades'] = {'Magical', 'DEX'}

----------------------------------------
-- Magical.VIT
----------------------------------------
spell_maps['Blue Magic']['Thermal Pulse'] = {'Magical', 'VIT'}

----------------------------------------
-- Magical.MND
----------------------------------------
spell_maps['Blue Magic']['Acrid Stream'] = {'Magical', 'MND'}
spell_maps['Blue Magic']['Evryone. Grudge'] = {'Magical', 'MND'}
spell_maps['Blue Magic']['Magic Hammer'] = {'Magical', 'MND'}
spell_maps['Blue Magic']['Mind Blast'] = {'Magical', 'MND'}

----------------------------------------
-- Magical.CHR
----------------------------------------
spell_maps['Blue Magic']['Eyes on Me'] = {'Magical', 'CHR'}
spell_maps['Blue Magic']['Mysterious Light'] = {'Magical', 'CHR'}

----------------------------------------
-- Magical.Breath
----------------------------------------
spell_maps['Blue Magic']['Bad Breath'] = {'Magical', 'Breath'}
spell_maps['Blue Magic']['Flying Hip Press'] = {'Magical', 'Breath'}
spell_maps['Blue Magic']['Frost Breath'] = {'Magical', 'Breath'}
spell_maps['Blue Magic']['Heat Breath'] = {'Magical', 'Breath'}
spell_maps['Blue Magic']['Hecatomb Wave'] = {'Magical', 'Breath'}
spell_maps['Blue Magic']['Magnetite Cloud'] = {'Magical', 'Breath'}
spell_maps['Blue Magic']['Poison Breath'] = {'Magical', 'Breath'}
spell_maps['Blue Magic']['Radiant Breath'] = {'Magical', 'Breath'}
spell_maps['Blue Magic']['Self-Destruct'] = {'Magical', 'Breath'}
spell_maps['Blue Magic']['Thunder Breath'] = {'Magical', 'Breath'}
spell_maps['Blue Magic']['Vapor Spray'] = {'Magical', 'Breath'}
spell_maps['Blue Magic']['Wind Breath'] = {'Magical', 'Breath'}

----------------------------------------
-- Stun
----------------------------------------
spell_maps['Blue Magic']['Blitzstrahl'] = 'Stun'
spell_maps['Blue Magic']['Frypan'] = 'Stun'
spell_maps['Blue Magic']['Head Butt'] = 'Stun'
spell_maps['Blue Magic']['Sudden Lunge'] = 'Stun'
spell_maps['Blue Magic']['Tail Slap'] = 'Stun'
spell_maps['Blue Magic']['Temporal Shift'] = 'Stun'
spell_maps['Blue Magic']['Thunderbolt'] = 'Stun'
spell_maps['Blue Magic']['Whirl of Rage'] = 'Stun'

----------------------------------------
-- Cure
----------------------------------------
spell_maps['Blue Magic']['Healing Breeze'] = 'Cure'
spell_maps['Blue Magic']['Magic Fruit'] = 'Cure'
spell_maps['Blue Magic']['Plenilune Embrace'] = 'Cure'
spell_maps['Blue Magic']['Pollen'] = 'Cure'
spell_maps['Blue Magic']['Restoral'] = 'Cure'
spell_maps['Blue Magic']['White Wind'] = 'Cure'
spell_maps['Blue Magic']['Wild Carrot'] = 'Cure'

----------------------------------------
-- Buff
----------------------------------------
spell_maps['Blue Magic']['Amplification'] = 'Buff'
spell_maps['Blue Magic']['Animating Wail'] = 'Buff'
spell_maps['Blue Magic']['Battery Charge'] = 'Buff'
spell_maps['Blue Magic']['Carcharian Verve'] = 'Buff'
spell_maps['Blue Magic']['Cocoon'] = 'Buff'
spell_maps['Blue Magic']['Erratic Flutter'] = 'Buff'
spell_maps['Blue Magic']['Exuviation'] = 'Buff'
spell_maps['Blue Magic']['Fantod'] = 'Buff'
spell_maps['Blue Magic']['Feather Barrier'] = 'Buff'
spell_maps['Blue Magic']['Harden Shell'] = 'Buff'
spell_maps['Blue Magic']['Memento Mori'] = 'Buff'
spell_maps['Blue Magic']['Nat. Meditation'] = 'Buff'
spell_maps['Blue Magic']['Occulation'] = 'Buff'
spell_maps['Blue Magic']['Orcish Counterstance'] = 'Buff'
spell_maps['Blue Magic']['Refueling'] = 'Buff'
spell_maps['Blue Magic']['Regeneration'] = 'Buff'
spell_maps['Blue Magic']['Saline Coat'] = 'Buff'
spell_maps['Blue Magic']['Triumphant Roar'] = 'Buff'
spell_maps['Blue Magic']['Warm-Up'] = 'Buff'
spell_maps['Blue Magic']['Winds of Promyvion'] = 'Buff'
spell_maps['Blue Magic']['Zephyr Mantle'] = 'Buff'

----------------------------------------
-- Buff.Skill
----------------------------------------
spell_maps['Blue Magic']['Barrier Tusk'] = {'Buff', 'Skill'}
spell_maps['Blue Magic']['Diamondhide'] = {'Buff', 'Skill'}
spell_maps['Blue Magic']['Magic Barrier'] = {'Buff', 'Skill'}
spell_maps['Blue Magic']['Metallic Body'] = {'Buff', 'Skill'}
spell_maps['Blue Magic']['Plasma Charge'] = {'Buff', 'Skill'}
spell_maps['Blue Magic']['Pyric Bulwark'] = {'Buff', 'Skill'}
spell_maps['Blue Magic']['Reactor Cool'] = {'Buff', 'Skill'}

----------------------------------------
-- Debuff
----------------------------------------
spell_maps['Blue Magic']['1000 Needles'] = 'Debuff'
spell_maps['Blue Magic']['Absolute Terror'] = 'Debuff'
spell_maps['Blue Magic']['Actinic Burst'] = 'Debuff'
spell_maps['Blue Magic']['Auroral Drape'] = 'Debuff'
spell_maps['Blue Magic']['Awful Eye'] = 'Debuff'
spell_maps['Blue Magic']['Blank Gaze'] = 'Debuff'
spell_maps['Blue Magic']['Blistering Roar'] = 'Debuff'
spell_maps['Blue Magic']['Blood Drain'] = 'Debuff'
spell_maps['Blue Magic']['Blood Saber'] = 'Debuff'
spell_maps['Blue Magic']['Chaotic Eye'] = 'Debuff'
spell_maps['Blue Magic']['Cimicine Discharge'] = 'Debuff'
spell_maps['Blue Magic']['Cold Wave'] = 'Debuff'
spell_maps['Blue Magic']['Corrosive Ooze'] = 'Debuff'
spell_maps['Blue Magic']['Demoralizing Roar'] = 'Debuff'
spell_maps['Blue Magic']['Digest'] = 'Debuff'
spell_maps['Blue Magic']['Dream Flower'] = 'Debuff'
spell_maps['Blue Magic']['Enervation'] = 'Debuff'
spell_maps['Blue Magic']['Feather Tickle'] = 'Debuff'
spell_maps['Blue Magic']['Filamented Hold'] = 'Debuff'
spell_maps['Blue Magic']['Frightful Roar'] = 'Debuff'
spell_maps['Blue Magic']['Geist Wall'] = 'Debuff'
spell_maps['Blue Magic']['Hecatomb Wave'] = 'Debuff'
spell_maps['Blue Magic']['Infrasonics'] = 'Debuff'
spell_maps['Blue Magic']['Jettatura'] = 'Debuff'
spell_maps['Blue Magic']['Light of Penance'] = 'Debuff'
spell_maps['Blue Magic']['Lowing'] = 'Debuff'
spell_maps['Blue Magic']['Mind Blast'] = 'Debuff'
spell_maps['Blue Magic']['Mortal Ray'] = 'Debuff'
spell_maps['Blue Magic']['MP Drainkiss'] = 'Debuff'
spell_maps['Blue Magic']['Osmosis'] = 'Debuff'
spell_maps['Blue Magic']['Reaving Wind'] = 'Debuff'
spell_maps['Blue Magic']['Sandspin'] = 'Debuff'
spell_maps['Blue Magic']['Sandspray'] = 'Debuff'
spell_maps['Blue Magic']['Sheep Song'] = 'Debuff'
spell_maps['Blue Magic']['Soporific'] = 'Debuff'
spell_maps['Blue Magic']['Sound Blast'] = 'Debuff'
spell_maps['Blue Magic']['Stinking Gas'] = 'Debuff'
spell_maps['Blue Magic']['Venom Shell'] = 'Debuff'
spell_maps['Blue Magic']['Voracious Trunk'] = 'Debuff'
spell_maps['Blue Magic']['Yawn'] = 'Debuff'

------------------------------------------------------------
-- Blood Pacts
------------------------------------------------------------
-- Rage.Physical
----------------------------------------
spell_maps['BloodPactRage'] = {}
spell_maps['BloodPactRage']['Punch'] = 'Physical'
spell_maps['BloodPactRage']['Rock Throw'] = 'Physical'
spell_maps['BloodPactRage']['Barracuda Dive'] = 'Physical'
spell_maps['BloodPactRage']['Claw'] = 'Physical'
spell_maps['BloodPactRage']['Welt'] = 'Physical'
spell_maps['BloodPactRage']['Axe Kick'] = 'Physical'
spell_maps['BloodPactRage']['Shock Strike'] = 'Physical'
spell_maps['BloodPactRage']['Camisado'] = 'Physical'
spell_maps['BloodPactRage']['Regal Scrath'] = 'Physical'
spell_maps['BloodPactRage']['Poison Nails'] = 'Physical'
spell_maps['BloodPactRage']['Moonlit Charge'] = 'Physical'
spell_maps['BloodPactRage']['Crescent Fang'] = 'Physical'
spell_maps['BloodPactRage']['Rock Buster'] = 'Physical'
spell_maps['BloodPactRage']['Roundhouse'] = 'Physical'
spell_maps['BloodPactRage']['Tail Whip'] = 'Physical'
spell_maps['BloodPactRage']['Double Punch'] = 'Physical'
spell_maps['BloodPactRage']['Megalith Throw'] = 'Physical'
spell_maps['BloodPactRage']['Double Slap'] = 'Physical'
spell_maps['BloodPactRage']['Eclipse Bite'] = 'Physical'
spell_maps['BloodPactRage']['Mountain Buster'] = 'Physical'
spell_maps['BloodPactRage']['Spinning Dive'] = 'Physical'
spell_maps['BloodPactRage']['Predator Claws'] = 'Physical'
spell_maps['BloodPactRage']['Rush'] = 'Physical'
spell_maps['BloodPactRage']['Chaotic Strike'] = 'Physical'
spell_maps['BloodPactRage']['Volt Strike'] = 'Physical'
spell_maps['BloodPactRage']['Hysteric Assault'] = 'Physical'
spell_maps['BloodPactRage']['Crag Throw'] = 'Physical'
spell_maps['BloodPactRage']['Blindside'] = 'Physical'
spell_maps['BloodPactRage']['Regal Gash'] = 'Physical'

----------------------------------------
-- Rage.Magical
----------------------------------------
spell_maps['BloodPactRage']['Inferno'] = 'Magical'
spell_maps['BloodPactRage']['Earthen Fury'] = 'Magical'
spell_maps['BloodPactRage']['Tidal Wave'] = 'Magical'
spell_maps['BloodPactRage']['Aerial Blast'] = 'Magical'
spell_maps['BloodPactRage']['Clarsach Call'] = 'Magical'
spell_maps['BloodPactRage']['Diamond Dust'] = 'Magical'
spell_maps['BloodPactRage']['Judgement Bolt'] = 'Magical'
spell_maps['BloodPactRage']['Searing Light'] = 'Magical'
spell_maps['BloodPactRage']['Howling Moon'] = 'Magical'
spell_maps['BloodPactRage']['Ruinous Omen'] = 'Magical'
spell_maps['BloodPactRage']['Fire II'] = 'Magical'
spell_maps['BloodPactRage']['Stone II'] = 'Magical'
spell_maps['BloodPactRage']['Water II'] = 'Magical'
spell_maps['BloodPactRage']['Aero II'] = 'Magical'
spell_maps['BloodPactRage']['Blizzard II'] = 'Magical'
spell_maps['BloodPactRage']['Thunder II'] = 'Magical'
spell_maps['BloodPactRage']['Thunderspark'] = 'Magical'
spell_maps['BloodPactRage']['Meteorite'] = 'Magical'
spell_maps['BloodPactRage']['Fire IV'] = 'Magical'
spell_maps['BloodPactRage']['Stone IV'] = 'Magical'
spell_maps['BloodPactRage']['Water IV'] = 'Magical'
spell_maps['BloodPactRage']['Aero IV'] = 'Magical'
spell_maps['BloodPactRage']['Blizzard IV'] = 'Magical'
spell_maps['BloodPactRage']['Thunder IV'] = 'Magical'
spell_maps['BloodPactRage']['Sonic Buffet'] = 'Magical'
spell_maps['BloodPactRage']['Nether Blast'] = 'Magical'
spell_maps['BloodPactRage']['Zantetsuken'] = 'Magical'
spell_maps['BloodPactRage']['Meteor Strike'] = 'Magical'
spell_maps['BloodPactRage']['Geocrush'] = 'Magical'
spell_maps['BloodPactRage']['Grand Fall'] = 'Magical'
spell_maps['BloodPactRage']['Wind Blade'] = 'Magical'
spell_maps['BloodPactRage']['Tornado II'] = 'Magical'
spell_maps['BloodPactRage']['Heavenly Strike'] = 'Magical'
spell_maps['BloodPactRage']['Thunderstorm'] = 'Magical'
spell_maps['BloodPactRage']['Level ? Holy'] = 'Magical'
spell_maps['BloodPactRage']['Holy Mist'] = 'Magical'
spell_maps['BloodPactRage']['Lunar Bay'] = 'Magical'
spell_maps['BloodPactRage']['Night Terror'] = 'Magical'
spell_maps['BloodPactRage']['Conflag Strike'] = 'Magical'
spell_maps['BloodPactRage']['Impact'] = 'Magical'

----------------------------------------
-- Rage.Hybrid
----------------------------------------
spell_maps['BloodPactRage']['Burning Strike'] = 'Hybrid'
spell_maps['BloodPactRage']['Flaming Crush'] = 'Hybrid'

----------------------------------------
-- Ward.Buff
----------------------------------------
spell_maps['BloodPactWard'] = {}
spell_maps['BloodPactWard']["Altana's Favor"] = 'Buff'
spell_maps['BloodPactWard']["Healing Ruby"] = 'Buff'
spell_maps['BloodPactWard']["Raise II"] = 'Buff'
spell_maps['BloodPactWard']["Somnolence"] = 'Buff'
spell_maps['BloodPactWard']["Shining Ruby"] = 'Buff'
spell_maps['BloodPactWard']["Aerial Armor"] = 'Buff'
spell_maps['BloodPactWard']["Frost Armor"] = 'Buff'
spell_maps['BloodPactWard']["Reraise II"] = 'Buff'
spell_maps['BloodPactWard']["Rolling Thunder"] = 'Buff'
spell_maps['BloodPactWard']["Katabatic Blades"] = 'Buff'
spell_maps['BloodPactWard']["Whispering Winds"] = 'Buff'
spell_maps['BloodPactWard']["Crimson Howl"] = 'Buff'
spell_maps['BloodPactWard']["Lightning Armor"] = 'Buff'
spell_maps['BloodPactWard']["Chinook"] = 'Buff'
spell_maps['BloodPactWard']["Ecliptic Growl"] = 'Buff'
spell_maps['BloodPactWard']["Glittering Ruby"] = 'Buff'
spell_maps['BloodPactWard']["Earthen Ward"] = 'Buff'
spell_maps['BloodPactWard']["Spring Water"] = 'Buff'
spell_maps['BloodPactWard']["Hastega"] = 'Buff'
spell_maps['BloodPactWard']["Noctoshield"] = 'Buff'
spell_maps['BloodPactWard']["Ecliptic Howl"] = 'Buff'
spell_maps['BloodPactWard']["Dream Shroud"] = 'Buff'
spell_maps['BloodPactWard']["Healing Ruby II"] = 'Buff'
spell_maps['BloodPactWard']["Perfect Defense"] = 'Buff'
spell_maps['BloodPactWard']["Fleet Wind"] = 'Buff'
spell_maps['BloodPactWard']["Inferno Howl"] = 'Buff'
spell_maps['BloodPactWard']["Wind's Blessing"] = 'Buff'
spell_maps['BloodPactWard']["Soothing Ruby"] = 'Buff'
spell_maps['BloodPactWard']["Heavensward Howl"] = 'Buff'
spell_maps['BloodPactWard']["Pacifying Ruby"] = 'Buff'
spell_maps['BloodPactWard']["Hastega II"] = 'Buff'
spell_maps['BloodPactWard']["Soothing Current"] = 'Buff'
spell_maps['BloodPactWard']["Crystal Blessing"] = 'Buff'

----------------------------------------
-- Ward.Debuff
----------------------------------------
spell_maps['BloodPactWard']["Lunatic Voice"] = 'Debuff'
spell_maps['BloodPactWard']["Lunar Cry"] = 'Debuff'
spell_maps['BloodPactWard']["Mewing Lullaby"] = 'Debuff'
spell_maps['BloodPactWard']["Nightmare"] = 'Debuff'
spell_maps['BloodPactWard']["Lunar Roar"] = 'Debuff'
spell_maps['BloodPactWard']["Slowga"] = 'Debuff'
spell_maps['BloodPactWard']["Ultimate Terror"] = 'Debuff'
spell_maps['BloodPactWard']["Sleepga"] = 'Debuff'
spell_maps['BloodPactWard']["Bitter Elegy"] = 'Debuff'
spell_maps['BloodPactWard']["Eerie Eye"] = 'Debuff'
spell_maps['BloodPactWard']["Deconstruction"] = 'Debuff'
spell_maps['BloodPactWard']["Chronoshift"] = 'Debuff'
spell_maps['BloodPactWard']["Tidal Roar"] = 'Debuff'
spell_maps['BloodPactWard']["Diamond Storm"] = 'Debuff'
spell_maps['BloodPactWard']["Shock Squall"] = 'Debuff'
spell_maps['BloodPactWard']["Pavor Nocturnus"] = 'Debuff'

------------------------------------------------------------
-- Dark Magic
------------------------------------------------------------
-- Bio
----------------------------------------
spell_maps['Dark Magic'] = {}
spell_maps['Dark Magic']['Bio'] = 'Bio'
spell_maps['Dark Magic']['Bio II'] = 'Bio'
spell_maps['Dark Magic']['Bio III'] = 'Bio'

------------------------------------------------------------
-- Enhancing Magic
------------------------------------------------------------
-- Skill
----------------------------------------
spell_maps['Enhancing Magic'] = {}
spell_maps['Enhancing Magic']['Aquaveil'] = 'Skill'
spell_maps['Enhancing Magic']['Enfire'] = 'Skill'
spell_maps['Enhancing Magic']['Enblizzard'] = 'Skill'
spell_maps['Enhancing Magic']['Enaero'] = 'Skill'
spell_maps['Enhancing Magic']['Enstone'] = 'Skill'
spell_maps['Enhancing Magic']['Enthunder'] = 'Skill'
spell_maps['Enhancing Magic']['Enwater'] = 'Skill'
spell_maps['Enhancing Magic']['Enlight'] = 'Skill'
spell_maps['Enhancing Magic']['Endark'] = 'Skill'
spell_maps['Enhancing Magic']['Enfire II'] = 'Skill'
spell_maps['Enhancing Magic']['Enblizzard II'] = 'Skill'
spell_maps['Enhancing Magic']['Enaero II'] = 'Skill'
spell_maps['Enhancing Magic']['Enstone II'] = 'Skill'
spell_maps['Enhancing Magic']['Enthunder II'] = 'Skill'
spell_maps['Enhancing Magic']['Enwater II'] = 'Skill'
spell_maps['Enhancing Magic']['Enlight II'] = 'Skill'
spell_maps['Enhancing Magic']['Endark II'] = 'Skill'
spell_maps['Enhancing Magic']['Temper'] = 'Skill'
spell_maps['Enhancing Magic']['Temper II'] = 'Skill'

----------------------------------------
-- Duration
----------------------------------------
spell_maps['Enhancing Magic']['Baramnesia'] = 'Duration'
spell_maps['Enhancing Magic']['Barvirus'] = 'Duration'
spell_maps['Enhancing Magic']['Barparalyze'] = 'Duration'
spell_maps['Enhancing Magic']['Barsilence'] = 'Duration'
spell_maps['Enhancing Magic']['Barpetrify'] = 'Duration'
spell_maps['Enhancing Magic']['Barpoison'] = 'Duration'
spell_maps['Enhancing Magic']['Barblind'] = 'Duration'
spell_maps['Enhancing Magic']['Barsleep'] = 'Duration'
spell_maps['Enhancing Magic']['Baramnesra'] = 'Duration'
spell_maps['Enhancing Magic']['Barvira'] = 'Duration'
spell_maps['Enhancing Magic']['Barparalyzra'] = 'Duration'
spell_maps['Enhancing Magic']['Barsilencera'] = 'Duration'
spell_maps['Enhancing Magic']['Barpetra'] = 'Duration'
spell_maps['Enhancing Magic']['Barpoisonra'] = 'Duration'
spell_maps['Enhancing Magic']['Barblindra'] = 'Duration'
spell_maps['Enhancing Magic']['Barsleepra'] = 'Duration'
spell_maps['Enhancing Magic']['Deodorize'] = 'Duration'
spell_maps['Enhancing Magic']['Invisible'] = 'Duration'
spell_maps['Enhancing Magic']['Sneak'] = 'Duration'
spell_maps['Enhancing Magic']['Phalanx'] = 'Duration'
spell_maps['Enhancing Magic']['Phalanx II'] = 'Duration'

----------------------------------------
-- Gain
----------------------------------------
spell_maps['Enhancing Magic']['Gain-STR'] = 'Gain'
spell_maps['Enhancing Magic']['Gain-DEX'] = 'Gain'
spell_maps['Enhancing Magic']['Gain-VIT'] = 'Gain'
spell_maps['Enhancing Magic']['Gain-AGI'] = 'Gain'
spell_maps['Enhancing Magic']['Gain-INT'] = 'Gain'
spell_maps['Enhancing Magic']['Gain-MND'] = 'Gain'
spell_maps['Enhancing Magic']['Gain-CHR'] = 'Gain'

------------------------------------------------------------
-- Enfeebling Magic
------------------------------------------------------------
-- Accuracy
----------------------------------------
spell_maps['Enfeebling Magic'] = {}
spell_maps['Enfeebling Magic']['Bind'] = 'Accuracy'
spell_maps['Enfeebling Magic']['Blind II'] = 'Accuracy'
spell_maps['Enfeebling Magic']['Break'] = 'Accuracy'
spell_maps['Enfeebling Magic']['Breakga'] = 'Accuracy'
spell_maps['Enfeebling Magic']['Dispel'] = 'Accuracy'
spell_maps['Enfeebling Magic']['Gravity'] = 'Accuracy'
spell_maps['Enfeebling Magic']['Gravity II'] = 'Accuracy'
spell_maps['Enfeebling Magic']['Sleep'] = 'Accuracy'
spell_maps['Enfeebling Magic']['Sleep II'] = 'Accuracy'
spell_maps['Enfeebling Magic']['Sleepga'] = 'Accuracy'
spell_maps['Enfeebling Magic']['Sleepga II'] = 'Accuracy'
spell_maps['Enfeebling Magic']['Silence'] = 'Accuracy'

----------------------------------------
-- Potency.INT
----------------------------------------
spell_maps['Enfeebling Magic']['Blind'] = {'Potency', 'INT'}
spell_maps['Enfeebling Magic']['Poison'] = {'Potency', 'INT'}
spell_maps['Enfeebling Magic']['Poison II'] = {'Potency', 'INT'}
spell_maps['Enfeebling Magic']['Poisonga'] = {'Potency', 'INT'}

----------------------------------------
-- Potency.MND
----------------------------------------
spell_maps['Enfeebling Magic']['Addle'] = {'Potency', 'MND'}
spell_maps['Enfeebling Magic']['Addle II'] = {'Potency', 'MND'}
spell_maps['Enfeebling Magic']['Distract'] = {'Potency', 'MND'}
spell_maps['Enfeebling Magic']['Distract II'] = {'Potency', 'MND'}
spell_maps['Enfeebling Magic']['Distract III'] = {'Potency', 'MND'}
spell_maps['Enfeebling Magic']['Frazzle'] = {'Potency', 'MND'}
spell_maps['Enfeebling Magic']['Frazzle II'] = {'Potency', 'MND'}
spell_maps['Enfeebling Magic']['Frazzle III'] = {'Potency', 'MND'}
spell_maps['Enfeebling Magic']['Paralyze'] = {'Potency', 'MND'}
spell_maps['Enfeebling Magic']['Paralyze II'] = {'Potency', 'MND'}
spell_maps['Enfeebling Magic']['Slow'] = {'Potency', 'MND'}
spell_maps['Enfeebling Magic']['Slow II'] = {'Potency', 'MND'}
