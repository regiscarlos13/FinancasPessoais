class CreateAnos < ActiveRecord::Migration[5.1]
  def change
    create_table :anos do |t|
      t.integer :ano
      t.boolean :ativo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
