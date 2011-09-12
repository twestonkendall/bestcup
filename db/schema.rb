# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110906185133) do

  create_table "beans", :force => true do |t|
    t.string   "variety"
    t.string   "harvest_start"
    t.string   "harvest_end"
    t.integer  "farm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "beans", ["farm_id"], :name => "index_beans_on_farm_id"

  create_table "blends", :force => true do |t|
    t.integer  "bean_id"
    t.integer  "roast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "weight",     :precision => 3, :scale => 2
    t.string   "lot_number"
  end

  add_index "blends", ["bean_id"], :name => "index_blends_on_bean_id"
  add_index "blends", ["roast_id"], :name => "index_blends_on_roast_id"

  create_table "checks", :force => true do |t|
    t.string   "milestones"
    t.string   "gas_flow",   :limit => 2
    t.string   "air_flow"
    t.integer  "temp",       :limit => 3
    t.integer  "time",       :limit => 2
    t.text     "notes"
    t.integer  "roast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cupping_acidities", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "score"
    t.integer  "intensity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupping_acidities", ["sample_id"], :name => "index_cupping_acidities_on_sample_id"

  create_table "cupping_after_tastes", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "score"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupping_after_tastes", ["sample_id"], :name => "index_cupping_after_tastes_on_sample_id"

  create_table "cupping_balances", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupping_balances", ["sample_id"], :name => "index_cupping_balances_on_sample_id"

  create_table "cupping_break_aromas", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "score"
    t.integer  "intensity"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupping_break_aromas", ["sample_id"], :name => "index_cupping_break_aromas_on_sample_id"

  create_table "cupping_clean_cups", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupping_clean_cups", ["sample_id"], :name => "index_cupping_clean_cups_on_sample_id"

  create_table "cupping_crust_aromas", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "score"
    t.integer  "intensity"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupping_crust_aromas", ["sample_id"], :name => "index_cupping_crust_aromas_on_sample_id"

  create_table "cupping_defects", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "number_of_cups"
    t.integer  "intensity"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupping_defects", ["sample_id"], :name => "index_cupping_defects_on_sample_id"

  create_table "cupping_dry_fragrances", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "score"
    t.integer  "intensity"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupping_dry_fragrances", ["sample_id"], :name => "index_cupping_dry_fragrances_on_sample_id"

  create_table "cupping_flavors", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "score"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupping_flavors", ["sample_id"], :name => "index_cupping_flavors_on_sample_id"

  create_table "cupping_mouthfeels", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "score"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupping_mouthfeels", ["sample_id"], :name => "index_cupping_mouthfeels_on_sample_id"

  create_table "cupping_overalls", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupping_overalls", ["sample_id"], :name => "index_cupping_overalls_on_sample_id"

  create_table "cupping_sweetnesses", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupping_sweetnesses", ["sample_id"], :name => "index_cupping_sweetnesses_on_sample_id"

  create_table "cupping_total_scores", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupping_total_scores", ["sample_id"], :name => "index_cupping_total_scores_on_sample_id"

  create_table "cupping_uniformities", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cupping_uniformities", ["sample_id"], :name => "index_cupping_uniformities_on_sample_id"

  create_table "cuppings", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "farms", :force => true do |t|
    t.string   "name"
    t.string   "farmer"
    t.string   "country"
    t.string   "region"
    t.string   "elevation"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roasteries", :force => true do |t|
    t.string   "name"
    t.integer  "year_opened"
    t.text     "description"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roasts", :force => true do |t|
    t.string   "name"
    t.date     "roasted_on"
    t.integer  "roastery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "batch_number"
  end

  add_index "roasts", ["roastery_id"], :name => "index_roasts_on_roastery_id"

  create_table "samples", :force => true do |t|
    t.integer  "cupping_id"
    t.integer  "roast_id"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sample_number"
    t.integer  "total"
  end

  add_index "samples", ["cupping_id"], :name => "index_samples_on_cupping_id"
  add_index "samples", ["roast_id"], :name => "index_samples_on_roast_id"

end
