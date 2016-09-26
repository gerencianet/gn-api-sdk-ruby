require "gerencianet"
require_relative "./credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: true
}

params = {
  id: 1000
}

body = {
  description: "This charge was not fully paid"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.create_charge_history(params: params, body: body)
