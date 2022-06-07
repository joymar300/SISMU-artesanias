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

ActiveRecord::Schema[7.0].define(version: 2022_06_06_201036) do
  create_table "artesanos", force: :cascade do |t|
    t.string "nombre"
    t.string "snombre"
    t.string "apellido"
    t.string "sapellido"
    t.integer "cedula"
    t.integer "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "tipo_categoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_productos", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "producto_id", null: false
    t.index ["category_id", "producto_id"], name: "index_categories_productos_on_category_id_and_producto_id"
    t.index ["producto_id", "category_id"], name: "index_categories_productos_on_producto_id_and_category_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "nombre_cli"
    t.string "nombre2_cli"
    t.string "apellido_cli"
    t.string "apellido2_cli"
    t.integer "tel_cli"
    t.string "correo_cli"
    t.string "direccion_cli"
    t.integer "cedula_cli"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors_detalles", id: false, force: :cascade do |t|
    t.integer "color_id", null: false
    t.integer "detalle_id", null: false
    t.index ["color_id", "detalle_id"], name: "index_colors_detalles_on_color_id_and_detalle_id"
    t.index ["detalle_id", "color_id"], name: "index_colors_detalles_on_detalle_id_and_color_id"
  end

  create_table "detalles", force: :cascade do |t|
    t.integer "factura_id", null: false
    t.integer "producto_id", null: false
    t.integer "cantidad"
    t.decimal "valor", precision: 8, scale: 2
    t.date "fechafin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["factura_id"], name: "index_detalles_on_factura_id"
    t.index ["producto_id"], name: "index_detalles_on_producto_id"
  end

  create_table "dproductions", force: :cascade do |t|
    t.integer "cantidad"
    t.integer "production_id", null: false
    t.integer "producto_id", null: false
    t.integer "artesano_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artesano_id"], name: "index_dproductions_on_artesano_id"
    t.index ["production_id"], name: "index_dproductions_on_production_id"
    t.index ["producto_id"], name: "index_dproductions_on_producto_id"
  end

  create_table "emdetalles", force: :cascade do |t|
    t.integer "cantidad"
    t.decimal "valor"
    t.decimal "precio"
    t.integer "emfactura_id", null: false
    t.integer "producto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emfactura_id"], name: "index_emdetalles_on_emfactura_id"
    t.index ["producto_id"], name: "index_emdetalles_on_producto_id"
  end

  create_table "emfacturas", force: :cascade do |t|
    t.decimal "total"
    t.integer "empresa_id", null: false
    t.date "fechafin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_emfacturas_on_empresa_id"
  end

  create_table "empresas", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.integer "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facturas", force: :cascade do |t|
    t.integer "client_id", null: false
    t.decimal "total", precision: 8, scale: 2
    t.date "fechafin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_facturas_on_client_id"
  end

  create_table "productions", force: :cascade do |t|
    t.string "ref"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre_pro"
    t.string "referencia_pro"
    t.decimal "precio_pro", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "foto"
    t.string "nombre"
    t.string "apellido"
    t.string "direccion"
    t.string "ciudad"
    t.string "estado"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "primernombre"
    t.string "segundonombre"
    t.string "primerapellido"
    t.string "segundoapellido"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "detalles", "facturas"
  add_foreign_key "detalles", "productos"
  add_foreign_key "dproductions", "artesanos"
  add_foreign_key "dproductions", "productions"
  add_foreign_key "dproductions", "productos"
  add_foreign_key "emdetalles", "emfacturas"
  add_foreign_key "emdetalles", "productos"
  add_foreign_key "emfacturas", "empresas"
  add_foreign_key "facturas", "clients"
  add_foreign_key "profiles", "users"
end
