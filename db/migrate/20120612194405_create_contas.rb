class CreateContas < ActiveRecord::Migration
  def change
    create_table :contas do |t|
      t.string :nome
      t.float :valor

      t.timestamps
    end
  end
end
