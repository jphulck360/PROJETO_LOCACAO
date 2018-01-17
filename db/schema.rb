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

ActiveRecord::Schema.define(version: 20170406170642) do

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome"
    t.integer  "idade"
    t.string   "telefone"
    t.string   "pais"
    t.string   "uf"
    t.string   "cidade"
    t.string   "endereco"
    t.string   "status",     default: "DISPONÍVEL"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "tipo_loc"
    t.float    "valor_loc",    limit: 24
    t.date     "dt_cadastro"
    t.date     "dt_devolucao"
    t.integer  "vehicle_id"
    t.integer  "client_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["client_id"], name: "index_locations_on_client_id", using: :btree
    t.index ["vehicle_id"], name: "index_locations_on_vehicle_id", using: :btree
  end

  create_table "marks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "marca_desc"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "model_cars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "modelo_desc"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "nome"
    t.string   "cpf"
    t.string   "endereco"
    t.string   "numero"
    t.string   "complemento"
    t.string   "cidade"
    t.string   "uf"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vehicles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nome"
    t.float    "preco_loc",          limit: 24
    t.integer  "qtd_loc",                       default: 0
    t.string   "status"
    t.integer  "mark_id"
    t.integer  "model_car_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["mark_id"], name: "index_vehicles_on_mark_id", using: :btree
    t.index ["model_car_id"], name: "index_vehicles_on_model_car_id", using: :btree
  end

  add_foreign_key "locations", "vehicles"
  add_foreign_key "vehicles", "marks"
  add_foreign_key "vehicles", "model_cars"
end
