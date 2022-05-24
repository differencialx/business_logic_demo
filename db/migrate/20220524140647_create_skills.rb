class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :damage
      t.integer :character_type, null: false
      t.timestamps
    end
  end
end
