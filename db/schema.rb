# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_24_141049) do
  create_table "character_skills", force: :cascade do |t|
    t.integer "character_id"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_skills_on_character_id"
    t.index ["skill_id"], name: "index_character_skills_on_skill_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.integer "strength"
    t.integer "agility"
    t.integer "intelligence"
    t.integer "health"
    t.integer "stamina"
    t.integer "focus"
    t.integer "mana"
    t.string "bonus"
    t.integer "character_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_characters_on_name", unique: true
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.integer "damage"
    t.integer "character_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "character_skills", "characters"
  add_foreign_key "character_skills", "skills"
end
