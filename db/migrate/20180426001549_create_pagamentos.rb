class CreatePagamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :pagamentos do |t|
      t.date :data
      t.decimal :valor, precision: 9, scale: 2, default: 0
      t.decimal :juros, precision: 9, scale: 2, default: 0
      t.decimal :multa, precision: 9, scale: 2, default: 0
      t.decimal :total, precision: 9, scale: 2, default: 0
      t.integer :tipo
      t.references :user, foreign_key: true
      t.references :lancamento, foreign_key: true
      t.references :banco, foreign_key: true
      t.references :beneficiario, foreign_key: true

      t.timestamps
    end
  end
end
