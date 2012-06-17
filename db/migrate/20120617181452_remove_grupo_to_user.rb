class RemoveGrupoToUser < ActiveRecord::Migration
  def up
    remove_column :users, :grupo_id
      end

  def down
    add_column :users, :grupo_id, :integer
  end
end
