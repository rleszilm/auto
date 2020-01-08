--------------------------------------------------------------------------------
-- Player gear setup
--------------------------------------------------------------------------------
-- Add etnries to the gear map here for gear that should be used in multiple job sets.
function init_gear()
    ------------------------------------------------------------
    -- Duplicate items that may fail to swap when using both.
    ------------------------------------------------------------
    local rings = {"Stikini Ring +1", "Moonlight Ring", "Chirich Ring +1", "Varar Ring +1", "Shiva Ring +1", "Fenrir Ring +1"}
    local earrings = {"Mache Earring +1"}

    gear = initDuplicates(gear, rings, "Ring", 3, 2)
    gear = initDuplicates(gear, earrings, "Earring", 2, 3)
    
    ------------------------------------------------------------
    -- Quested Augmentable items
    ------------------------------------------------------------
    gear.DesulatorTassets = {name="Desultor Tassets", augments={'"Phantom Roll" ability delay -5','Phys. dmg. taken -4%'}}
    gear.Moonshade = {name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250'}}
    
    ------------------------------------------------------------
    -- JSE Gear
    ------------------------------------------------------------
    -- WAR
    gear.JSE.WAR.Back = {name="Cichol's Mantle"}
    gear.JSE.WAR.Back.DoubleAttack = {name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10','Damage taken-5%'}}

    -- MNK
    gear.JSE.MNK.Back = {name="Segomo's Mantle"}
    gear.JSE.MNK.Back.DoubleAttack = {name="Segomo's Mantle", augments={'"Dbl.Atk."+3','Damage taken-5%'}}

    -- RDM
    gear.JSE.RDM.Back = {name="Sucellos's Cape"}
    gear.JSE.RDM.Back.DW = {name="Sucellos's Cape", augments={'DEX+5','Accuracy+20 Attack+20','"Dual Wield"+10'}}
    gear.JSE.RDM.Back.MAB = {name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10'}}
    gear.JSE.RDM.Back.MAcc = {name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10'}}
    gear.JSE.RDM.Back.MAccMND = gear.JSE.RDM.Back.MAcc
    -- THF
    gear.JSE.THF.Back.CritRate = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
    gear.JSE.THF.Back.STP = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%'}}
    gear.JSE.THF.Back.WSD = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%'}}

    -- DRK
    gear.JSE.DRK.Back.DoubleAttack  = {name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%'}}
    gear.JSE.DRK.Back.STP = {name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%'}}
    gear.JSE.DRK.Back.WSD = {name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%'}}
    
    -- SMN
    gear.JSE.SMN.Main.Keraunos = {name="Keraunos", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','Pet: "Dbl.Atk."+4 Pet: Crit.hit rate +4','Blood Pact Dmg.+9'}}
    gear.JSE.SMN.Main.Gridarvor = {name="Gridarvor", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15'}}
    gear.JSE.SMN.Main.Espiritus = {name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%'}}
    gear.JSE.SMN.Back.PetRegen = {name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Phys. dmg. taken-10%'}}
    gear.JSE.SMN.Back.FC = {name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: Mag. Acc.+10','"Fast Cast"+10'}}
    
    -- BLU
    gear.JSE.BLU.Back = {name="Rosmerta's Cape"}
    gear.JSE.BLU.Back.CritRate = {name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10'}}
    gear.JSE.BLU.Back.MDmg = {name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Haste+10'}}
    gear.JSE.BLU.Back.STP = {name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10'}}

    -- COR
    gear.JSE.COR.Main.Rostam = {name="Rostam"}
    gear.JSE.COR.Main.Rostam.A = {name="Rostam", bag="Wardrobe"}
    gear.JSE.COR.Main.Rostam.B = {name="Rostam", bag="Wardrobe 2"}
    gear.JSE.COR.Main.Rostam.C = {name="Rostam", bag="Wardrobe 3"}
    gear.JSE.COR.Range.Compensator = {name="Compensator"}
    gear.JSE.COR.Range.Compensator.D = {name="Compensator", augments={'DMG:+15','Rng.Atk.+15','"Mag.Atk.Bns."+15'}}
    gear.JSE.COR.Back = {name="Camulus's Mantle"}
    gear.JSE.COR.Back.DoubleAttack = {name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Damage taken-5%'}}
    gear.JSE.COR.Back.HybridWSD = {name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%'}}

    -- RUN
    gear.JSE.RUN.Back = {name="Ogma's cape"}
    gear.JSE.RUN.Back.Enmity = {name="Ogma's cape", augments={'Enmity+10','Phys. dmg. taken-10%'}}

    ------------------------------------------------------------
    -- Reisenjima Gear
    ------------------------------------------------------------
    -- Weapons
    ----------------------------------------
    gear.Colada = {name="Colada"}
    gear.Colada.STP = {name="Colada", augments={'"Store TP"+4','DEX+5','Accuracy+18','Attack+5','DMG:+17'}}
    
    ----------------------------------------
    -- Chironic
    ----------------------------------------
    gear.Chironic.Legs.MAcc = {name="Chironic Hose", augments={'Mag. Acc.+22','AGI+7','INT+9 MND+9 CHR+9','Accuracy+14 Attack+14','Mag. Acc.+11 "Mag.Atk.Bns."+11'}}
    gear.Chironic.Legs.Refresh = gear.Chironic.Legs.MAcc

    ----------------------------------------
    -- Herculean
    ----------------------------------------
    -- CritDmg
    gear.Herculean.Body.CritDmg = {name="Herculean Vest", augments={'Attack+6','Crit. hit damage +4%','DEX+6','Accuracy+13'}}
    
    -- Hybrid WSD
    gear.Herculean.Head.HybridWSD = {name="Herculean Helm", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','Weapon skill damage +2%','INT+6','Mag. Acc.+14','"Mag.Atk.Bns."+13'}}
    gear.Herculean.Body.HybridWSD = {name="Herculean Vest", augments={'"Mag.Atk.Bns."+22','Weapon skill damage +3%','INT+7','Mag. Acc.+15'}}
    gear.Herculean.Legs.HybridWSD = {name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +3%','MND+4',}}
    gear.Herculean.Feet.HybridWSD = {name="Herculean Boots", augments={'"Mag.Atk.Bns."+19','Weapon skill damage +3%','DEX+9','Mag. Acc.+10'}}
    
    -- Triple Attack
    gear.Herculean.Feet.TripleAttack = {name="Herculean Boots", augments={'Accuracy+17 Attack+17','"Triple Atk."+3','STR+10','Attack+3'}}
    
    ----------------------------------------
    -- Merlinic
    ----------------------------------------
    gear.Merlinic.Hands.BloodPactDmg = {name="Merlinic Dastanas",augments={'Pet: Mag. Acc.+1','Blood Pact Dmg.+10','Pet: STR+3','Pet: "Mag.Atk.Bns."+10'}}

    ----------------------------------------
    -- Odyssean
    ----------------------------------------
    gear.Odyssean.Body.FC  = {name="Odyss. Chestplate", augments={'"Fast Cast"+6','CHR+4','Accuracy+4'}}
    gear.Odyssean.Legs.STP = {name="Odyssean Cuisses", augments={'Accuracy+30','"Store TP"+5','DEX+13'}}

    ----------------------------------------
    -- Valorous
    ----------------------------------------
    
    gear.Valorous.Head.WSD = {name="Valorous Mask", augments={'Pet: DEX+10','AGI+2','Weapon skill damage +8%','Accuracy+18 Attack+18','Mag. Acc.+4 "Mag.Atk.Bns."+4'}}
    gear.Valorous.Head.HybridWSD = {name="Valorous Mask", augments={'"Dbl.Atk."+2','AGI+4','Weapon skill damage +3%','Mag. Acc.+19 "Mag.Atk.Bns."+19'}}
    gear.Valorous.Hands.WSD = {name="Valorous Mitts", augments={'Mag. Acc.+19','Weapon skill damage +4%','STR+14'}}
    gear.Valorous.Legs.DoubleAttack = {name="Valor. Hose", augments={'"Dbl.Atk."+5','Accuracy+12'}}

    ------------------------------------------------------------
    -- Alluvion Skirmish Gear
    ------------------------------------------------------------
    -- Taeon
    ----------------------------------------
    -- Fast cast
    gear.Taeon.Body.FC = {name="Taeon Tabard", augments={'"Fast Cast"+5'}}
    gear.Taeon.Legs.FC = {name="Taeon Tights", augments={'"Fast Cast"+5','Phalanx +3'}}

    -- Phalanx
    gear.Taeon.Body.Phalanx = {name="Taeon Tabard", augments={'Spell interruption rate down -10%','Phalanx +3'}}
    gear.Taeon.Hands.Phalanx = {name="Taeon Gloves", augments={'Phalanx +3'}}
    gear.Taeon.Legs.Phalanx = gear.Taeon.Legs.FC
    gear.Taeon.Feet.Phalanx = {name="Taeon Boots", augments={'Phalanx +2'}}

    -- SIR
    gear.Taeon.Head.SIR = {name="Taeon Chapeau", augments={'Spell interruption rate down -8%'}}
    gear.Taeon.Body.SIR = gear.Taeon.Body.Phalanx

    -- TripleAttack
    gear.Taeon.Head.TripleAttack = {name="Taeon Chapeau", augments={'Accuracy+24','"Triple Atk."+2','DEX+10'}}
    gear.Taeon.Hands.TripleAttack = {name="Taeon Gloves", augments={'Accuracy+17 Attack+17','"Triple Atk."+2','STR+7 DEX+7'}}
    gear.Taeon.Legs.TripleAttack = {name="Taeon Tights", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','STR+6 DEX+6'}}

    ------------------------------------------------------------
    -- Skirmish Gear
    ------------------------------------------------------------
    -- Telchine
    ----------------------------------------
    gear.Telchine = {
        Head={},
        Body={},
        Hands={name="Telchine Gloves"},
        Legs={},
        Feet={}
    }
    
    -- CurePotency
    gear.Telchine.Hands.CurePotency = {name="Telchine Gloves", augments={'"Cure" potency +7%','INT+7 MND+7'}}

    ------------------------------------------------------------
    -- Weapons
    ------------------------------------------------------------
    gear.Colada = {name="Colada"}
    gear.Colada.STP = {name="Colada", augments={'"Store TP"+4','DEX+5','Accuracy+18','Attack+5','DMG:+17'}}

    gear.Nibiru = {}
    gear.Nibiru.Club = {name="Nibiru Cudgel"}
    gear.Nibiru.Club.B = {name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15'}}
end

function initDuplicates(gear, items, slot, lbag, rbag)
    for _, item in pairs(items) do
        if not gear[slot] then
            gear[slot] = {}
        end

        gear[slot][item] = {
            name=item,
            Left={
                name=item,
                bag=lbag
            },
            Right={
                name=item,
                bag=lbag
            }
        }
    end

    return gear
end