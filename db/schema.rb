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

ActiveRecord::Schema[7.0].define(version: 2022_10_16_112112) do
  create_table "jewelers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "wealth", default: "0.0", null: false
  end

  create_table "jewels", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "jeweler_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "material_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.decimal "base_cost"
    t.integer "jewel_id"
    t.integer "material_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stone_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stones", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "jewel_id"
    t.integer "stone_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
