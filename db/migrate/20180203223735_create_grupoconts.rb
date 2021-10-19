class CreateGrupoconts < ActiveRecord::Migration[5.1]
  def change
    create_table :grupoconts do |t|
      t.string :nome
      t.integer :tipo
      t.boolean :ativo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end