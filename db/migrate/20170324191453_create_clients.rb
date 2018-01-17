class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :nome
      t.integer :idade
      t.string :telefone
      t.string :pais
      t.string :uf
      t.string :cidade
      t.string :endereco
      t.string :status, default: "DISPONÍVEL"

      t.timestamps
    end
  end
end
