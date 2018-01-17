class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :tipo_loc
      t.float :valor_loc
      t.date :dt_cadastro
      t.date :dt_devolucao
      t.references :vehicle, foreign_key: true
      t.references :client, foreign_key: true
      t.timestamps
    end
  end
end
