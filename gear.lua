--[[
Sets layout

sets.
  |-precast
  |   |-item
  |   |   |-[Item.Name]
  |   |-ja
  |   |   |-[JA.Name]
  |   |-ma
  |   |   |-spellset()
  |   |-pet
  |   |   |-pet_ability_set()
  |   |-ra
  |   |   |-rangedset()
  |   |-ws
  |   |   |-wsset()
  |-midcast
  |   |-item
  |   |   |-[Item.Name]
  |   |-ma
  |   |   |-spellset()
  |   |-pet
  |   |   |-pet_ability_set()
  |   |-ra
  |       |-rangedset()
  |-engaged
  |   |-[DefenseMode]
  |       |-pet
  |       |   |-|pet_status_set()
  |       |       |-meleeset()
  |       |-meleeset()
  |-idle
  |   |-[DefenseMode]
  |       |-[IdleMode]
  |           |-pet
  |           |   |-pet_status_set()
  |           |       |-weak
  |           |           |-CustomIdleGroups...
  |           |       |-town
  |           |           |-CustomIdleGroups...
  |           |       |-field
  |           |           |-CustomIdleGroups...
  |           |-weak
  |               |-CustomIdleGroups...
  |           |-town
  |               |-CustomIdleGroups...
  |           |-field
  |               |-CustomIdleGroups...
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

meleeset()
  |-[CombatForm]
      |-[CombatSkill]
          |-[CombatWeapon]
              |-[TargetAcc]
                  |-[MeleeHaste]
                      |-CusmtomMeleeGroups...

rangedset()
  |-[TargetRAcc]
      |-[RangedHaste]
          |-CustomRangedGroups...

petspellset()
  |-[PetMode]
      |-[PetSpellGroup]
          |-[Spell.Name]
              |-CustomPetSpellGroups...

spellset()
  |-[CastingMode]
      |-[SpellGroup]
          |-[Spell.Type]
              |-[Spell.Skill]
                  |-[Spell.Name]
                      |-CustomSpellGroups...

wsset()
  |-[WSMode]
      |-[WS.Name]
          |-CustomWSGroups...
]]--
