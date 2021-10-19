class CreateOrcamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :orcamentos do |t|
      t.decimal :janeiro, precision: 9, scale: 2, default: 0
      t.decimal :fevereiro, precision: 9, scale: 2, default: 0
      t.decimal :marco, precision: 9, scale: 2, default: 0
      t.decimal :abril, precision: 9, scale: 2, default: 0
      t.decimal :maio, precision: 9, scale: 2, default: 0
      t.decimal :junho, precision: 9, scale: 2, default: 0
      t.decimal :julho, precision: 9, scale: 2, default: 0
      t.decimal :agosto, precision: 9, scale: 2, default: 0
      t.decimal :setembro, precision: 9, scale: 2, default: 0
      t.decimal :outubro, precision: 9, scale: 2, default: 0
      t.decimal :novembro, precision: 9, scale: 2, default: 0
      t.decimal :dezembro, precision: 9, scale: 2, default: 0
      t.decimal :total, precision: 9, scale: 2
      t.references :user, foreign_key: true
      t.references :ano, foreign_key: true
      t.references :grupocont, foreign_key: true
      t.references :conta, foreign_key: true

      t.timestamps
    end
  end
end
