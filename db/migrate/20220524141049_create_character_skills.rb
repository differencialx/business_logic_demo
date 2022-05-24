class CreateCharacterSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :character_skills do |t|
      t.references :character, foreign_key: true
      t.references :skill, foreign_key: true
      t.timestamps
    end
  end
end
