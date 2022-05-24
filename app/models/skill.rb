class Skill < ApplicationRecord
  has_many :character_skills
  has_many :characters, through: :character_skills

  enum character_type: Const::CHARACTER_TYPES
end
