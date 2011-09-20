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

ActiveRecord::Schema.define(:version => 20110920115241) do

  create_table "assets", :force => true do |t|
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "attachments", :force => true do |t|
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.string   "description"
    t.string   "image_size"
    t.integer  "priority"
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.integer  "parent_id"
    t.string   "navlabel"
    t.boolean  "active"
    t.boolean  "admin"
    t.integer  "position"
    t.string   "controller_name"
    t.string   "category",            :default => "Admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "controller_redirect"
    t.string   "action_redirect"
    t.boolean  "redirect"
  end

  create_table "hours", :force => true do |t|
    t.string   "description"
    t.decimal  "number",      :precision => 10, :scale => 2
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "relation_id"
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "body"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsarchives", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "author"
    t.string   "link"
    t.boolean  "active"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "body"
    t.string   "headline"
    t.boolean  "active"
    t.string   "image"
    t.string   "image_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "author"
    t.integer  "priority",   :default => 1
    t.integer  "parent_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "headline"
    t.text     "description"
    t.string   "kind"
    t.integer  "cost_price"
    t.integer  "sales_price"
    t.integer  "purchase_quantity"
    t.integer  "stock_in"
    t.integer  "stock_out"
    t.integer  "stock"
    t.integer  "active"
    t.string   "image"
    t.string   "title"
    t.string   "image_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relations", :force => true do |t|
    t.string   "company"
    t.string   "address"
    t.string   "postno"
    t.string   "city"
    t.text     "log"
    t.string   "category"
    t.string   "responsible"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "phone"
    t.datetime "next_action"
    t.integer  "lock_version"
    t.integer  "user_id"
    t.string   "type"
    t.integer  "search_lock"
    t.string   "homepage"
    t.string   "email"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.boolean  "admin"
    t.boolean  "active"
    t.string   "category"
    t.string   "blogname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
    t.string   "password_salt"
  end

  create_table "vouchers", :force => true do |t|
    t.string   "description"
    t.integer  "number"
    t.integer  "relation_id"
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
