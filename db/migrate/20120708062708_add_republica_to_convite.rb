class AddRepublicaToConvite < ActiveRecord::Migration
  def change
    add_column :convites, :republica_id, :integer
  end
end
