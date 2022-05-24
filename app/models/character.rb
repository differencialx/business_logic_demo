class Character < ApplicationRecord
  WARRIOR_STATS = {
    strength: 20,
    agility: 10,
    intelligence: 10,
    health: 200,
    stamina: 150,
    focus: 0,
    mana: 0
  }.freeze

  ARCHER_STATS = {
    strength: 10,
    agility: 20,
    intelligence: 10,
    health: 175,
    stamina: 0,
    focus: 40,
    mana: 0
  }.freeze

  WIZARD_STATS = {
    strength: 10,
    agility: 10,
    intelligence: 20,
    health: 150,
    stamina: 0,
    focus: 0,
    mana: 300
  }.freeze

  has_many :character_skills
  has_many :skills, through: :character_skills

  enum character_type: Const::CHARACTER_TYPES
end
