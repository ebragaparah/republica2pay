class AddRepublicaToFatura < ActiveRecord::Migration
  def change
    add_column :faturas, :republica_id, :integer
  end
end
