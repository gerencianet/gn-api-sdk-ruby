require "gerencianet"
require_relative "./credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: true
}

params = {
  brand: "visa",
  total: 5000
}

gerencianet = Gerencianet.new(options)
puts gerencianet.get_installments(params: params)
