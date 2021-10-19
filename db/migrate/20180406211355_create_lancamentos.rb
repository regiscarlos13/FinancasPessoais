class CreateLancamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :lancamentos do |t|
      t.string :descricao
      t.date :data
      t.integer :tipo
      t.decimal :valor, precision: 9, scale: 2, default: 0
      t.references :orcamento, foreign_key: true
      t.references :user, foreign_key: true
      t.references :fonte, foreign_key: true
      t.references :fornecedor, foreign_key: true
      t.references :centro, foreign_key: true

      t.timestamps
    end
  end
end
