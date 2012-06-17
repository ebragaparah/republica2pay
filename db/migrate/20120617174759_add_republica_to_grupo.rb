class AddRepublicaToGrupo < ActiveRecord::Migration
  def change
    add_column :grupos, :republica_id, :integer
  end
end
