class CreateTransferencias < ActiveRecord::Migration[5.2]
  def change
    create_table :transferencias do |t|
      t.integer :obs
      t.references :user, foreign_key: true
      t.references :pagamento, foreign_key: true

      t.timestamps
    end
  end
end
