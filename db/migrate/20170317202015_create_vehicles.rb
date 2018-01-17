class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :nome
      t.float :preco_loc
      t.integer :qtd_loc, default: 0
      t.string :status
      t.references :mark, foreign_key: true
      t.references :model_car, foreign_key: true
      t.timestamps
    end
  end
end
