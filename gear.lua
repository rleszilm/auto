--[[
Sets layout

sets.
  |-precast
  |   |-item
  |   |   |-item()
  |   |-ja
  |   |   |-jobability()
  |   |-ma
  |   |   |-magic()
  |   |-pet
  |   |   |-pet_ability()
  |   |-ra
  |   |   |-ranged()
  |   |-ws
  |   |   |-weaponskill()
  |-midcast
  |   |-item
  |   |   |-item()
  |   |-ma
  |   |   |-magic()
  |   |-pet
  |   |   |-pet_ability()
  |   |-ra
  |       |-ranged()
  |-engaged
  |   |-defense()
  |       |-[pet_status()]
  |           |-melee()
  |-idle
  |   |-[pet_status()]
  |       |-idle()
  |-swaps
      |-Weather
      |   |-[Element]
      |-Day
      |   |-[Day]
      |-Time
      |   |-[Dawn]
      |   |-[Day]
      |   |-[Dusk]
      |   |-[Night]
      |-Running
      |-Treasurehunter
      |-Weapons
      |   |-[WeaponSetMode]
      |-Buff
          |-doom
          |-curse

defense()
  |-[DefenseMode]
      |-[DefenseModeMode]

idle()
  |-[IdleMode]
      |-pet()
      |   |-weak|town|field
      |       |-CustomIdleGroups...
      |-weak|town|field
          |-CustomIdleGroups...

melee()
  |-[CombatForm]
      |-[CombatSkill]
          |-[CombatWeapon]
              |-[TargetAccuracy]
                  |-[MeleeHaste]
                      |-CusmtomMeleeGroups...

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
