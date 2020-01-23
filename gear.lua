--[[
Sets layout

sets.
  |-precast
  |   |-item
  |   |   |-[item()]
  |   |-ja
  |   |   |-[jobability()]
  |   |-ma
  |   |   |-[magic()]
  |   |-pet
  |   |   |-[pet_ability()]
  |   |-ra
  |   |   |-[ranged()]
  |   |-ws
  |   |   |-[weaponskill()]
  |-midcast
  |   |-item
  |   |   |-[item()]
  |   |-ma
  |   |   |-[magic()]
  |   |-pet
  |   |   |-[pet_ability()]
  |   |-ra
  |       |-[ranged()]
  |-engaged
  |   |-[defense()]
  |       |-[pet_status()]
  |           |-[melee()]
  |-idle
  |   |-[defense()]
  |       |-[pet_status()]
  |           |-[idle()]
swaps.
  |-precast|midcast|engaged|idle
      |-weather
      |   |-[Element]
      |-day
      |   |-[Day]
      |-time
      |   |-dawn|day|dusk|night
      |-running
      |-treasurehunter
      |   |-[TreasureHunterMode]
      |-buff
      |   |-CustomBuffGroups...
      |-CustomSwaps...

weapons.
  |-melee
  |   |-[WeaponSetMode]
  |-ranged
  |   |-[RangedWeaponSetMode]
  |-ammo
  |   |-[AmmoSetMode]


defense()
    |-defense
        |-[DefenseMode]
            |-[DefenseModeMode]

engaged()
  |-[CombatForm]
      |-[CombatSkill]
          |-[CombatWeapon]
              |-[TargetAccuracy]
                  |-[MeleeHaste]
                      |-CusmtomMeleeGroups...

idle()
  |-[IdleMode]
      |-pet()
      |   |-weak|town|field
      |       |-CustomIdleGroups...
      |-weak|town|field
          |-CustomIdleGroups...

item()
  |-[Item.Name]
      |-CustomItemGroups

jobability()
  |-CustomJAGroups

magic()
  |-[CastingMode]
      |-[SpellGroup]
          |-[Spell.Type]
              |-[Spell.Skill]
                  |-[Spell.Name]
                      |-CustomMAGroups

ranged()
  |-[TargetRangedAccuracy]
      |-[RangedHaste]
          |-CustomRangedGroups...

weaponskill()
  |-[WSMode]
      |-[WS.Name]
          |-CustomWSGroups...

pet_ability()
  |-[Pet.Name]
      |-[PetAbilityMode]
          |-[PetSpellGroup]
              |-[Spell.Name]
                  |-CustomPetAbilityroups...

pet_status()
  |-[Pet.Name]
      |-engaged
      |   |-[PetTargetAcc]
      |       |-CustomPetEngagedGroups...
      |-idle
          |-[PetIdleMode]
              |-CustomPetIdleGroups...
]]--
