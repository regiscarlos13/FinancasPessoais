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

ActiveRecord::Schema.define(version: 2019_11_24_205503) do

  create_table "anos", force: :cascade do |t|
    t.integer "ano"
    t.boolean "ativo"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_anos_on_user_id"
  end

  create_table "bancos", force: :cascade do |t|
    t.string "nome"
    t.string "agencia"
    t.string "conta"
    t.boolean "ativo"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bancos_on_user_id"
  end

  create_table "beneficiarios", force: :cascade do |t|
    t.string "nome"
    t.boolean "ativo"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_beneficiarios_on_user_id"
  end

  create_table "centros", force: :cascade do |t|
    t.string "nome"
    t.boolean "ativo"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_centros_on_user_id"
  end

  create_table "contas", force: :cascade do |t|
    t.string "nome"
    t.integer "tipo"
    t.integer "ctipo"
    t.boolean "ativo"
    t.integer "user_id"
    t.integer "grupocont_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grupocont_id"], name: "index_contas_on_grupocont_id"
    t.index ["user_id"], name: "index_contas_on_user_id"
  end

  create_table "fontes", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "cidade"
    t.string "telefone"
    t.string "documento"
    t.boolean "ativo"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fontes_on_user_id"
  end

  create_table "fornecedors", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "cidade"
    t.string "telefone"
    t.string "documento"
    t.boolean "ativo"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fornecedors_on_user_id"
  end

  create_table "grupoconts", force: :cascade do |t|
    t.string "nome"
    t.integer "tipo"
    t.boolean "ativo"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_grupoconts_on_user_id"
  end

  create_table "lancamentos", force: :cascade do |t|
    t.string "descricao"
    t.date "data"
    t.integer "tipo"
    t.decimal "valor", precision: 9, scale: 2, default: "0.0"
    t.integer "orcamento_id"
    t.integer "user_id"
    t.integer "fonte_id"
    t.integer "fornecedor_id"
    t.integer "centro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parcela"
    t.integer "number"
    t.index ["centro_id"], name: "index_lancamentos_on_centro_id"
    t.index ["fonte_id"], name: "index_lancamentos_on_fonte_id"
    t.index ["fornecedor_id"], name: "index_lancamentos_on_fornecedor_id"
    t.index ["orcamento_id"], name: "index_lancamentos_on_orcamento_id"
    t.index ["user_id"], name: "index_lancamentos_on_user_id"
  end

  create_table "orcamentos", force: :cascade do |t|
    t.decimal "janeiro", precision: 9, scale: 2, default: "0.0"
    t.decimal "fevereiro", precision: 9, scale: 2, default: "0.0"
    t.decimal "marco", precision: 9, scale: 2, default: "0.0"
    t.decimal "abril", precision: 9, scale: 2, default: "0.0"
    t.decimal "maio", precision: 9, scale: 2, default: "0.0"
    t.decimal "junho", precision: 9, scale: 2, default: "0.0"
    t.decimal "julho", precision: 9, scale: 2, default: "0.0"
    t.decimal "agosto", precision: 9, scale: 2, default: "0.0"
    t.decimal "setembro", precision: 9, scale: 2, default: "0.0"
    t.decimal "outubro", precision: 9, scale: 2, default: "0.0"
    t.decimal "novembro", precision: 9, scale: 2, default: "0.0"
    t.decimal "dezembro", precision: 9, scale: 2, default: "0.0"
    t.decimal "total", precision: 9, scale: 2
    t.integer "user_id"
    t.integer "ano_id"
    t.integer "grupocont_id"
    t.integer "conta_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ano_id"], name: "index_orcamentos_on_ano_id"
    t.index ["conta_id"], name: "index_orcamentos_on_conta_id"
    t.index ["grupocont_id"], name: "index_orcamentos_on_grupocont_id"
    t.index ["user_id"], name: "index_orcamentos_on_user_id"
  end

  create_table "pagamentos", force: :cascade do |t|
    t.date "data"
    t.decimal "valor", precision: 9, scale: 2, default: "0.0"
    t.decimal "juros", precision: 9, scale: 2, default: "0.0"
    t.decimal "multa", precision: 9, scale: 2, default: "0.0"
    t.decimal "total", precision: 9, scale: 2, default: "0.0"
    t.integer "tipo"
    t.integer "user_id"
    t.integer "lancamento_id"
    t.integer "banco_id"
    t.integer "beneficiario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["banco_id"], name: "index_pagamentos_on_banco_id"
    t.index ["beneficiario_id"], name: "index_pagamentos_on_beneficiario_id"
    t.index ["lancamento_id"], name: "index_pagamentos_on_lancamento_id"
    t.index ["user_id"], name: "index_pagamentos_on_user_id"
  end

  create_table "transferencias", force: :cascade do |t|
    t.integer "obs"
    t.integer "user_id"
    t.integer "pagamento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pagamento_id"], name: "index_transferencias_on_pagamento_id"
    t.index ["user_id"], name: "index_transferencias_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "anos", "users"
  add_foreign_key "bancos", "users"
  add_foreign_key "beneficiarios", "users"
  add_foreign_key "centros", "users"
  add_foreign_key "contas", "grupoconts"
  add_foreign_key "contas", "users"
  add_foreign_key "fontes", "users"
  add_foreign_key "fornecedors", "users"
  add_foreign_key "grupoconts", "users"
  add_foreign_key "lancamentos", "centros"
  add_foreign_key "lancamentos", "fontes"
  add_foreign_key "lancamentos", "fornecedors"
  add_foreign_key "lancamentos", "orcamentos"
  add_foreign_key "lancamentos", "users"
  add_foreign_key "orcamentos", "anos"
  add_foreign_key "orcamentos", "contas"
  add_foreign_key "orcamentos", "grupoconts"
  add_foreign_key "orcamentos", "users"
  add_foreign_key "pagamentos", "bancos"
  add_foreign_key "pagamentos", "beneficiarios"
  add_foreign_key "pagamentos", "lancamentos"
  add_foreign_key "pagamentos", "users"
  add_foreign_key "transferencias", "pagamentos"
  add_foreign_key "transferencias", "users"
end
