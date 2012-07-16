class AddDescricaoToConta < ActiveRecord::Migration
  def change
    add_column :contas, :descricao, :text
  end
end
