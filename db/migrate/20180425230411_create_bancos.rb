class CreateBancos < ActiveRecord::Migration[5.2]
  def change
    create_table :bancos do |t|
      t.string :nome
      t.string :agencia
      t.string :conta
      t.boolean :ativo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
