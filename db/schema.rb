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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170604011157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgpool_recovery"

  create_table "categories", force: :cascade do |t|
    t.string "name",        null: false
    t.text   "description", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "item_sales", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "sale_id"
    t.integer  "used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_sales_on_item_id", using: :btree
    t.index ["sale_id"], name: "index_item_sales_on_sale_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.integer "receipt_id",                null: false
    t.integer "category_id",               null: false
    t.string  "name",                      null: false
    t.text    "description"
    t.integer "quantity",    default: 1,   null: false
    t.float   "cost",                      null: false
    t.string  "measurement", default: "p", null: false
    t.integer "used",        default: 0
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["receipt_id"], name: "index_items_on_receipt_id", using: :btree
  end

  create_table "receipts", force: :cascade do |t|
    t.string   "vendor",                null: false
    t.text     "description"
    t.float    "tax",                   null: false
    t.string   "hardcopy_file_name"
    t.string   "hardcopy_content_type"
    t.integer  "hardcopy_file_size"
    t.datetime "hardcopy_updated_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "sales", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.float    "total",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "item_sales", "items"
  add_foreign_key "item_sales", "sales"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "receipts"
end
