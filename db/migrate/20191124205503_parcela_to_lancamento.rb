class ParcelaToLancamento < ActiveRecord::Migration[5.2]
  def change
    add_column :lancamentos, :parcela, :integer
    add_column :lancamentos, :number, :integer
  end
end
