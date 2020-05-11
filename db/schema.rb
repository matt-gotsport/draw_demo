# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_13_092019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "draw_definitions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "output_group_size"
    t.integer "output_group_count"
    t.string "output_group_name"
  end

  create_table "draw_output_group_definitions", force: :cascade do |t|
    t.bigint "draw_definition_id", null: false
    t.string "name"
    t.integer "size"
    t.integer "sequence"
    t.index ["draw_definition_id"], name: "index_draw_output_group_definitions_on_draw_definition_id"
  end

  create_table "draw_output_groups", force: :cascade do |t|
    t.bigint "draw_id", null: false
    t.bigint "group_id", null: false
    t.integer "size"
    t.bigint "draw_output_group_definition_id", null: false
    t.index ["draw_id"], name: "index_draw_output_groups_on_draw_id"
    t.index ["draw_output_group_definition_id"], name: "index_draw_output_groups_on_draw_output_group_definition_id"
    t.index ["group_id"], name: "index_draw_output_groups_on_group_id"
  end

  create_table "draw_rule_varieties", force: :cascade do |t|
    t.string "description"
    t.string "variety"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "draw_rules", force: :cascade do |t|
    t.bigint "draw_definition_id", null: false
    t.bigint "draw_rule_variety_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "group_name"
    t.integer "quantity"
    t.index ["draw_definition_id"], name: "index_draw_rules_on_draw_definition_id"
    t.index ["draw_rule_variety_id"], name: "index_draw_rules_on_draw_rule_variety_id"
  end

  create_table "draw_stage_definitions", force: :cascade do |t|
    t.bigint "draw_definition_id", null: false
    t.string "name"
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["draw_definition_id"], name: "index_draw_stage_definitions_on_draw_definition_id"
    t.index ["group_id"], name: "index_draw_stage_definitions_on_group_id"
  end

  create_table "draw_stage_sequences", force: :cascade do |t|
    t.bigint "draw_definition_id", null: false
    t.bigint "draw_stage_definition_id", null: false
    t.integer "sequence"
    t.index ["draw_definition_id"], name: "index_draw_stage_sequences_on_draw_definition_id"
    t.index ["draw_stage_definition_id"], name: "index_draw_stage_sequences_on_draw_stage_definition_id"
  end

  create_table "draw_stages", force: :cascade do |t|
    t.bigint "draw_stage_definition_id", null: false
    t.bigint "draw_step_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["draw_stage_definition_id"], name: "index_draw_stages_on_draw_stage_definition_id"
    t.index ["draw_step_id"], name: "index_draw_stages_on_draw_step_id"
    t.index ["group_id"], name: "index_draw_stages_on_group_id"
  end

  create_table "draw_step_sequences", force: :cascade do |t|
    t.bigint "draw_stage_definition_id", null: false
    t.bigint "draw_step_id", null: false
    t.integer "sequence"
    t.index ["draw_stage_definition_id"], name: "index_draw_step_sequences_on_draw_stage_definition_id"
    t.index ["draw_step_id"], name: "index_draw_step_sequences_on_draw_step_id"
  end

  create_table "draw_step_varieties", force: :cascade do |t|
    t.string "description"
    t.string "variety"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "allow_free_selection", default: false
    t.boolean "allow_team_selection"
    t.boolean "allow_group_selection"
  end

  create_table "draw_steps", force: :cascade do |t|
    t.bigint "draw_step_variety_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "draw_stage_definition_id"
    t.index ["draw_step_variety_id"], name: "index_draw_steps_on_draw_step_variety_id"
  end

  create_table "draws", force: :cascade do |t|
    t.bigint "draw_definition_id", null: false
    t.bigint "draw_stage_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_id"
    t.index ["draw_definition_id"], name: "index_draws_on_draw_definition_id"
    t.index ["draw_stage_id"], name: "index_draws_on_draw_stage_id"
    t.index ["team_id"], name: "index_draws_on_team_id"
  end

  create_table "drum_groups", force: :cascade do |t|
    t.bigint "draw_id", null: false
    t.bigint "group_id", null: false
    t.index ["draw_id"], name: "index_drum_groups_on_draw_id"
    t.index ["group_id"], name: "index_drum_groups_on_group_id"
  end

  create_table "drum_teams", force: :cascade do |t|
    t.bigint "draw_id", null: false
    t.bigint "team_id", null: false
    t.index ["draw_id"], name: "index_drum_teams_on_draw_id"
    t.index ["team_id"], name: "index_drum_teams_on_team_id"
  end

  create_table "group_definitions", force: :cascade do |t|
    t.bigint "draw_definition_id", null: false
    t.string "name"
    t.string "image_file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["draw_definition_id"], name: "index_group_definitions_on_draw_definition_id"
  end

  create_table "group_teams", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "team_id", null: false
    t.integer "sequence"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_teams_on_group_id"
    t.index ["team_id"], name: "index_group_teams_on_team_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "draw_definition_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image_file"
    t.index ["draw_definition_id"], name: "index_groups_on_draw_definition_id"
  end

  create_table "rule_groups", force: :cascade do |t|
    t.bigint "draw_rule_id", null: false
    t.bigint "group_id", null: false
    t.index ["draw_rule_id"], name: "index_rule_groups_on_draw_rule_id"
    t.index ["group_id"], name: "index_rule_groups_on_group_id"
  end

  create_table "rule_steps", force: :cascade do |t|
    t.bigint "draw_rule_id", null: false
    t.bigint "draw_step_id", null: false
    t.index ["draw_rule_id"], name: "index_rule_steps_on_draw_rule_id"
    t.index ["draw_step_id"], name: "index_rule_steps_on_draw_step_id"
  end

  create_table "step_groups", force: :cascade do |t|
    t.bigint "draw_step_id", null: false
    t.bigint "draw_output_group_definition_id", null: false
    t.index ["draw_output_group_definition_id"], name: "index_step_groups_on_draw_output_group_definition_id"
    t.index ["draw_step_id"], name: "index_step_groups_on_draw_step_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "image_file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "draw_output_group_definitions", "draw_definitions"
  add_foreign_key "draw_output_groups", "draw_output_group_definitions"
  add_foreign_key "draw_output_groups", "draws"
  add_foreign_key "draw_output_groups", "groups"
  add_foreign_key "draw_rules", "draw_definitions"
  add_foreign_key "draw_rules", "draw_rule_varieties"
  add_foreign_key "draw_stage_definitions", "draw_definitions"
  add_foreign_key "draw_stage_definitions", "groups"
  add_foreign_key "draw_stage_sequences", "draw_definitions"
  add_foreign_key "draw_stage_sequences", "draw_stage_definitions"
  add_foreign_key "draw_stages", "draw_stage_definitions"
  add_foreign_key "draw_stages", "draw_steps"
  add_foreign_key "draw_stages", "groups"
  add_foreign_key "draw_step_sequences", "draw_stage_definitions"
  add_foreign_key "draw_step_sequences", "draw_steps"
  add_foreign_key "draw_steps", "draw_step_varieties"
  add_foreign_key "draws", "draw_definitions"
  add_foreign_key "draws", "draw_stages"
  add_foreign_key "draws", "teams"
  add_foreign_key "drum_groups", "draws"
  add_foreign_key "drum_groups", "groups"
  add_foreign_key "drum_teams", "draws"
  add_foreign_key "drum_teams", "teams"
  add_foreign_key "group_definitions", "draw_definitions"
  add_foreign_key "group_teams", "groups"
  add_foreign_key "group_teams", "teams"
  add_foreign_key "groups", "draw_definitions"
  add_foreign_key "rule_groups", "draw_rules"
  add_foreign_key "rule_groups", "groups"
  add_foreign_key "rule_steps", "draw_rules"
  add_foreign_key "rule_steps", "draw_steps"
  add_foreign_key "step_groups", "draw_output_group_definitions"
  add_foreign_key "step_groups", "draw_steps"
end
