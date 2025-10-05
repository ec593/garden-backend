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

ActiveRecord::Schema[8.0].define(version: 2025_09_30_225125) do
  create_table "beds", force: :cascade do |t|
    t.string "name"
    t.date "start"
    t.date "end"
    t.integer "x"
    t.integer "y"
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plantings", force: :cascade do |t|
    t.integer "square_id"
    t.integer "seed_packet_id"
    t.integer "num_sites"
    t.integer "seeds_per_site"
    t.date "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seed_packet_id"], name: "index_plantings_on_seed_packet_id"
    t.index ["square_id"], name: "index_plantings_on_square_id"
  end

  create_table "seed_packets", force: :cascade do |t|
    t.string "seed_type"
    t.string "name"
    t.string "company"
    t.integer "year"
    t.text "notes"
    t.boolean "isEmpty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "squares", force: :cascade do |t|
    t.integer "bed_id"
    t.integer "x"
    t.integer "y"
    t.date "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bed_id"], name: "index_squares_on_bed_id"
  end

  add_foreign_key "plantings", "seed_packets"
  add_foreign_key "plantings", "squares"
  add_foreign_key "squares", "beds"
end
