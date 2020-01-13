--[[
Sets layout

sets.
  |-precast
  |   |-Item
  |   |   |-[Item.Name]
  |   |-MA
  |   |   |-[CastingMode]
  |   |       |-[SpellGroup]
  |   |       |-[Spell.Type]
  |   |       |   |-[Spell.Skill]
  |   |       |       |-[Spell.Name]
  |   |-JA
  |   |   |-[JA.Name]
  |   |-RA
  |   |   |-[RangedMode]
  |   |       |-[RangedHaste]|
  |   |-WS
  |   |   |-[WSMode]
  |   |   |   |-[WS.Name]
  |-midcast
  |   |-MA
  |   |   |-Pet
  |   |   |   |-[PetName]
  |   |   |       |-[CastingMode]
  |   |   |           |-[SpellGroup]
  |   |   |           |-[Spell.Type]
  |   |   |               |-[Spell.Skill]
  |   |   |                   |-[Spell.Name]
  |   |   |-[CastingMode]
  |   |       |-[SpellGroup]
  |   |       |-[Spell.Type]
  |   |           |-[Spell.Skill]
  |   |               |-[Spell.Name]
  |   |-RA
  |       |-[RangedMode]
  |           |-[RangedHaste]|
  |-engaged
  |   |-[DefenseMode]
  |       |-Pet
  |       |   |-[PetName]
  |       |       |-[Engaged]
  |       |       |   |-[CombatForm]
  |       |       |       |-[CombatSkill]
  |       |       |           |-[CombatWeapon]
  |       |       |               |-[TargetAcc]
  |       |       |                   |-[HybridMode]
  |       |       |-[Idle]
  |       |           |-[CombatForm]
  |       |               |-[CombatSkill]
  |       |                   |-[CombatWeapon]
  |       |                       |-[TargetAcc]
  |       |                           |-[HybridMode]
  |       |-[CombatForm]
  |           |-[CombatSkill]
  |               |-[CombatWeapon]
  |                   |-[TargetAcc]
  |                       |-[HybridMode]
  |-idle
  |   |-[DefenseMode]
  |       |-Pet
  |       |   |-[PetName]
  |       |       |-[Engaged]
  |       |       |-[Idle]
  |       |-Weak
  |       |-Town
  |       |-Field
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
]]--