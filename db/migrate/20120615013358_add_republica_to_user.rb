class AddRepublicaToUser < ActiveRecord::Migration
  def change
    add_column :users, :republica_id, :integer
  end
end
