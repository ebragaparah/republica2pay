class AddFaturaToContas < ActiveRecord::Migration
  def change
    add_column :contas, :fatura_id, :integer
  end
end
