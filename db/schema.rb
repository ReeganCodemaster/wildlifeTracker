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

ActiveRecord::Schema[7.0].define(version: 2022_04_06_101106) do
  create_table "animals", force: :cascade do |t|
    t.string "animal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.text "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sightings", force: :cascade do |t|
    t.integer "animal_id", null: false
    t.datetime "date"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "region_id", null: false
    t.index ["animal_id"], name: "index_sightings_on_animal_id"
    t.index ["region_id"], name: "index_sightings_on_region_id"
  end

  add_foreign_key "sightings", "animals"
  add_foreign_key "sightings", "regions"
end
