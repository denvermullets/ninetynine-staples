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

ActiveRecord::Schema.define(version: 2022_01_02_185716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "boxsets", force: :cascade do |t|
    t.string "code"
    t.integer "mcm_id"
    t.string "name"
    t.string "mcm_name"
    t.date "release_date"
    t.integer "base_set_size"
    t.integer "total_set_size"
    t.string "set_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "card_prices", force: :cascade do |t|
    t.bigint "magic_card_id"
    t.string "mtg_uuid"
    t.jsonb "price_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["magic_card_id"], name: "index_card_prices_on_magic_card_id"
  end

  create_table "card_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string "keyword"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "magic_card_artists", force: :cascade do |t|
    t.bigint "magic_card_id"
    t.bigint "artist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_magic_card_artists_on_artist_id"
    t.index ["magic_card_id"], name: "index_magic_card_artists_on_magic_card_id"
  end

  create_table "magic_card_color_idents", force: :cascade do |t|
    t.bigint "magic_card_id"
    t.bigint "color_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["color_id"], name: "index_magic_card_color_idents_on_color_id"
    t.index ["magic_card_id"], name: "index_magic_card_color_idents_on_magic_card_id"
  end

  create_table "magic_card_colors", force: :cascade do |t|
    t.bigint "magic_card_id"
    t.bigint "color_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["color_id"], name: "index_magic_card_colors_on_color_id"
    t.index ["magic_card_id"], name: "index_magic_card_colors_on_magic_card_id"
  end

  create_table "magic_card_keywords", force: :cascade do |t|
    t.bigint "magic_card_id"
    t.bigint "keyword_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["keyword_id"], name: "index_magic_card_keywords_on_keyword_id"
    t.index ["magic_card_id"], name: "index_magic_card_keywords_on_magic_card_id"
  end

  create_table "magic_card_rulings", force: :cascade do |t|
    t.bigint "magic_card_id"
    t.bigint "ruling_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["magic_card_id"], name: "index_magic_card_rulings_on_magic_card_id"
    t.index ["ruling_id"], name: "index_magic_card_rulings_on_ruling_id"
  end

  create_table "magic_card_sub_types", force: :cascade do |t|
    t.bigint "magic_card_id"
    t.bigint "sub_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["magic_card_id"], name: "index_magic_card_sub_types_on_magic_card_id"
    t.index ["sub_type_id"], name: "index_magic_card_sub_types_on_sub_type_id"
  end

  create_table "magic_card_super_types", force: :cascade do |t|
    t.bigint "magic_card_id"
    t.bigint "super_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["magic_card_id"], name: "index_magic_card_super_types_on_magic_card_id"
    t.index ["super_type_id"], name: "index_magic_card_super_types_on_super_type_id"
  end

  create_table "magic_card_types", force: :cascade do |t|
    t.bigint "magic_card_id"
    t.bigint "card_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_type_id"], name: "index_magic_card_types_on_card_type_id"
    t.index ["magic_card_id"], name: "index_magic_card_types_on_magic_card_id"
  end

  create_table "magic_cards", force: :cascade do |t|
    t.bigint "boxset_id"
    t.string "name"
    t.string "text"
    t.string "original_text"
    t.string "power"
    t.string "toughness"
    t.string "rarity"
    t.string "card_type"
    t.string "original_type"
    t.integer "edhrec_rank"
    t.boolean "has_foil"
    t.boolean "has_non_foil"
    t.string "border_color"
    t.decimal "converted_mana_cost", precision: 10, scale: 2
    t.string "flavor_text"
    t.string "frame_version"
    t.boolean "is_reprint"
    t.string "card_number"
    t.jsonb "identifiers"
    t.string "card_uuid"
    t.string "image_large"
    t.string "image_medium"
    t.string "image_small"
    t.decimal "mana_value", precision: 10, scale: 2
    t.string "mana_cost"
    t.string "face_name"
    t.string "card_side"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boxset_id"], name: "index_magic_cards_on_boxset_id"
  end

  create_table "printings", force: :cascade do |t|
    t.bigint "magic_card_id"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["magic_card_id"], name: "index_printings_on_magic_card_id"
  end

  create_table "rulings", force: :cascade do |t|
    t.date "ruling_date"
    t.string "ruling"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sub_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "super_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
