json.extract! client, :id, :nome, :telefone, :pais, :cidade, :endereco, :created_at, :updated_at
json.url client_url(client, format: :json)
