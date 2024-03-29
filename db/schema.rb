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

ActiveRecord::Schema.define(version: 2022_02_19_120430) do

  create_table "adhocrotations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "truck_id"
    t.integer "trailer_id"
    t.date "date"
    t.integer "mileage"
    t.string "tire1sn"
    t.string "tire2sn"
    t.string "tire3sn"
    t.string "tire4sn"
    t.string "tire5sn"
    t.string "tire6sn"
    t.string "tire7sn"
    t.string "tire8sn"
    t.string "tire9sn"
    t.string "tire10sn"
    t.string "tire11sn"
    t.string "tire12sn"
    t.string "tire13sn"
    t.date "tire1purchase"
    t.date "tire2purchase"
    t.date "tire3purchase"
    t.date "tire4purchase"
    t.date "tire5purchase"
    t.date "tire6purchase"
    t.date "tire7purchase"
    t.date "tire8purchase"
    t.date "tire9purchase"
    t.date "tire10purchase"
    t.date "tire11purchase"
    t.date "tire12purchase"
    t.date "tire13purchase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tire1depthmiddle"
    t.integer "tire2depthmiddle"
    t.integer "tire3depthmiddle"
    t.integer "tire4depthmiddle"
    t.integer "tire5depthmiddle"
    t.integer "tire6depthmiddle"
    t.integer "tire7depthmiddle"
    t.integer "tire8depthmiddle"
    t.integer "tire9depthmiddle"
    t.integer "tire10depthmiddle"
    t.integer "tire11depthmiddle"
    t.integer "tire12depthmiddle"
    t.integer "tire13depthmiddle"
    t.integer "tire1depthside"
    t.integer "tire2depthside"
    t.integer "tire3depthside"
    t.integer "tire4depthside"
    t.integer "tire5depthside"
    t.integer "tire6depthside"
    t.integer "tire7depthside"
    t.integer "tire8depthside"
    t.integer "tire9depthside"
    t.integer "tire10depthside"
    t.integer "tire11depthside"
    t.integer "tire12depthside"
    t.integer "tire13depthside"
  end

  create_table "admins", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "approvers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "company_id"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_approvers_on_company_id"
  end

  create_table "branches", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "company_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_branches_on_company_id"
  end

  create_table "companies", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name_j"
    t.string "name_e"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "opt_tirerotation", default: false
  end

  create_table "costbases", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "company_id"
    t.string "model"
    t.string "category"
    t.integer "oil_filter"
    t.integer "fuel_filter"
    t.integer "ps_oil"
    t.integer "tm_oil"
    t.integer "df_oil"
    t.integer "air_filter"
    t.integer "air_drier"
    t.integer "break_oil"
    t.integer "clutch_oil"
    t.integer "coolant"
    t.integer "grease"
    t.integer "cng_filter"
    t.integer "spark_plug"
    t.integer "clutch_kit"
    t.integer "battery"
    t.integer "filter_ps_oil"
    t.integer "timing_belt_eg"
    t.integer "timing_belt_ac"
    t.integer "filter_axle"
    t.integer "softwasher"
    t.integer "gasket_front_wheel"
    t.integer "gasket_rear_wheel"
    t.integer "seal_oil_front_wheel"
    t.integer "wheel_grease"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.integer "seal_oil_rear_wheel"
    t.integer "totalcost"
    t.string "extra1"
    t.integer "extra1parts"
    t.integer "extra1labor"
    t.string "extra2"
    t.integer "extra2parts"
    t.integer "extra2labor"
    t.string "extra3"
    t.integer "extra3parts"
    t.integer "extra3labor"
    t.string "extra4"
    t.integer "extra4parts"
    t.integer "extra4labor"
    t.string "extra5"
    t.integer "extra5parts"
    t.integer "extra5labor"
    t.string "extra6"
    t.integer "extra6parts"
    t.integer "extra6labor"
    t.string "extra7"
    t.integer "extra7parts"
    t.integer "extra7labor"
    t.string "extra8"
    t.integer "extra8parts"
    t.integer "extra8labor"
    t.string "extra9"
    t.integer "extra9parts"
    t.integer "extra9labor"
    t.string "extra10"
    t.integer "extra10parts"
    t.integer "extra10labor"
    t.integer "sendbooking_id"
    t.index ["company_id"], name: "index_costbases_on_company_id"
    t.index ["sendbooking_id"], name: "index_costbases_on_sendbooking_id"
  end

  create_table "dealerbranches", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "dealercompany_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dealercompany_id"], name: "index_dealerbranches_on_dealercompany_id"
  end

  create_table "dealercompanies", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dealerusers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "position"
    t.integer "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "dealercompany_id"
    t.integer "dealerbranch_id"
    t.index ["branch_id"], name: "index_dealerusers_on_branch_id"
    t.index ["dealerbranch_id"], name: "index_dealerusers_on_dealerbranch_id"
    t.index ["dealercompany_id"], name: "index_dealerusers_on_dealercompany_id"
  end

  create_table "loginotes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "truck_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["truck_id", "created_at"], name: "index_loginotes_on_truck_id_and_created_at"
    t.index ["truck_id"], name: "index_loginotes_on_truck_id"
  end

  create_table "logiposts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "logithread_id"
    t.datetime "date"
    t.string "content"
    t.integer "dealeruser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dealeruser_id"], name: "index_logiposts_on_dealeruser_id"
    t.index ["logithread_id"], name: "index_logiposts_on_logithread_id"
  end

  create_table "logithreads", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "seed"
    t.integer "dealercompany_id"
    t.integer "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "complete"
    t.integer "admin_id"
    t.index ["admin_id"], name: "fk_rails_bc8bc0ab95"
    t.index ["dealercompany_id"], name: "index_logithreads_on_dealercompany_id"
    t.index ["truck_id"], name: "index_logithreads_on_truck_id"
  end

  create_table "maintains", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "truck_id"
    t.date "action"
    t.integer "mileage"
    t.integer "nextmileage"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["truck_id"], name: "index_maintains_on_truck_id"
  end

  create_table "oilprices", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sendbookings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "truck_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "done", default: false
    t.index ["truck_id"], name: "index_sendbookings_on_truck_id"
    t.index ["user_id"], name: "index_sendbookings_on_user_id"
  end

  create_table "tireadmins", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "company_id"
    t.integer "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_tireadmins_on_branch_id"
    t.index ["company_id"], name: "index_tireadmins_on_company_id"
  end

  create_table "tirehistories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "truck_id"
    t.integer "index"
    t.string "serialno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "purchasedate"
    t.index ["truck_id"], name: "index_tirehistories_on_truck_id"
  end

  create_table "trailerrelationships", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "trailer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trailer_id"], name: "index_trailerrelationships_on_trailer_id"
    t.index ["user_id"], name: "index_trailerrelationships_on_user_id"
  end

  create_table "trailers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "company_id"
    t.integer "branch_id"
    t.string "wheels"
    t.string "vehicleid"
    t.string "number"
    t.string "tire"
    t.date "purchase"
    t.string "image"
    t.integer "dealercompany_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_trailers_on_branch_id"
    t.index ["company_id"], name: "index_trailers_on_company_id"
    t.index ["dealercompany_id"], name: "index_trailers_on_dealercompany_id"
  end

  create_table "trailertirehistories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "trailer_id"
    t.integer "index"
    t.string "serialno"
    t.date "purchasedate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trailer_id"], name: "index_trailertirehistories_on_trailer_id"
  end

  create_table "truckhistories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "truck_id"
    t.date "action"
    t.integer "mileage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["truck_id"], name: "index_truckhistories_on_truck_id"
  end

  create_table "truckrelationships", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["truck_id"], name: "index_truckrelationships_on_truck_id"
    t.index ["user_id"], name: "index_truckrelationships_on_user_id"
  end

  create_table "trucks", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "company_id"
    t.integer "branch_id"
    t.string "maker"
    t.string "model"
    t.string "body"
    t.integer "wheels"
    t.integer "year"
    t.integer "age"
    t.string "engine"
    t.string "vehicleid"
    t.string "number"
    t.integer "e_oil"
    t.integer "tm_oil"
    t.string "tire"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "df_oil"
    t.integer "initmileage"
    t.date "purchase"
    t.string "image"
    t.integer "dealercompany_id"
    t.index ["branch_id"], name: "index_trucks_on_branch_id"
    t.index ["company_id"], name: "index_trucks_on_company_id"
    t.index ["dealercompany_id"], name: "index_trucks_on_dealercompany_id"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "company_id"
    t.string "name"
    t.boolean "authorizer"
    t.integer "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["company_id"], name: "index_users_on_company_id"
  end

  add_foreign_key "approvers", "companies"
  add_foreign_key "branches", "companies"
  add_foreign_key "costbases", "companies"
  add_foreign_key "costbases", "sendbookings"
  add_foreign_key "dealerbranches", "dealercompanies"
  add_foreign_key "dealerusers", "branches"
  add_foreign_key "dealerusers", "dealerbranches"
  add_foreign_key "dealerusers", "dealercompanies"
  add_foreign_key "loginotes", "trucks"
  add_foreign_key "logiposts", "dealerusers"
  add_foreign_key "logiposts", "logithreads"
  add_foreign_key "logithreads", "admins"
  add_foreign_key "logithreads", "dealercompanies"
  add_foreign_key "logithreads", "trucks"
  add_foreign_key "maintains", "trucks"
  add_foreign_key "sendbookings", "trucks"
  add_foreign_key "sendbookings", "users"
  add_foreign_key "tireadmins", "branches"
  add_foreign_key "tireadmins", "companies"
  add_foreign_key "tirehistories", "trucks"
  add_foreign_key "trailerrelationships", "trailers"
  add_foreign_key "trailerrelationships", "users"
  add_foreign_key "trailers", "branches"
  add_foreign_key "trailers", "companies"
  add_foreign_key "trailers", "dealercompanies"
  add_foreign_key "trailertirehistories", "trailers"
  add_foreign_key "truckhistories", "trucks"
  add_foreign_key "truckrelationships", "trucks"
  add_foreign_key "truckrelationships", "users"
  add_foreign_key "trucks", "branches"
  add_foreign_key "trucks", "companies"
  add_foreign_key "trucks", "dealercompanies"
  add_foreign_key "users", "branches"
  add_foreign_key "users", "companies"
end
