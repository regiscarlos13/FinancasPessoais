class CreateContas < ActiveRecord::Migration[5.1]
  def change
    create_table :contas do |t|
      t.string :nome
      t.integer :tipo
      t.integer :ctipo
      t.boolean :ativo
      t.references :user, foreign_key: true
      t.references :grupocont, foreign_key: true
      t.timestamps
    end
  end
end
