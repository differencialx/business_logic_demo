class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.integer :strength
      t.integer :agility
      t.integer :intelligence
      t.integer :health
      t.integer :stamina
      t.integer :focus
      t.integer :mana
      t.string :bonus
      t.integer :character_type, null: false
      t.timestamps

      t.index :name, unique: true
    end
  end
end
