class AddGrupoToConta < ActiveRecord::Migration
  def change
    add_column :contas, :grupo_id, :integer
  end
end
