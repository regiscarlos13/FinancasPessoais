class CreateBeneficiarios < ActiveRecord::Migration[5.2]
  def change
    create_table :beneficiarios do |t|
      t.string :nome
      t.boolean :ativo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
