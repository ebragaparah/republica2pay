class AddGrupoToUser < ActiveRecord::Migration
  def change
    add_column :users, :grupo_id, :integer
  end
end
