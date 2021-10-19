class CreateFornecedors < ActiveRecord::Migration[5.1]
  def change
    create_table :fornecedors do |t|
      t.string :nome
      t.string :endereco
      t.string :cidade
      t.string :telefone
      t.string :documento
      t.boolean :ativo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
