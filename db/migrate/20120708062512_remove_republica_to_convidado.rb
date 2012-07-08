class RemoveRepublicaToConvidado < ActiveRecord::Migration
  def up
    remove_column :convidados, :republica_id
      end

  def down
    add_column :convidados, :republica_id, :string
  end
end
