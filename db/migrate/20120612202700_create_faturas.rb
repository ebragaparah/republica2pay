class CreateFaturas < ActiveRecord::Migration
  def change
    create_table :faturas do |t|
      t.date :vencimento
      t.float :total
      t.float :por_pessoa

      t.timestamps
    end
  end
end
