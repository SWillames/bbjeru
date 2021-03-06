# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160725215805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "cpf"
    t.float    "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.float    "price"
    t.text     "description"
    t.string   "mark"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products_sales", id: false, force: :cascade do |t|
    t.integer "product_id"
    t.integer "sale_id"
  end

  add_index "products_sales", ["product_id"], name: "index_products_sales_on_product_id", using: :btree
  add_index "products_sales", ["sale_id"], name: "index_products_sales_on_sale_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.float    "value"
    t.integer  "client_id"
    t.string   "installments"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "sales", ["client_id"], name: "index_sales_on_client_id", using: :btree

  add_foreign_key "products_sales", "products"
  add_foreign_key "products_sales", "sales"
  add_foreign_key "sales", "clients"
end
