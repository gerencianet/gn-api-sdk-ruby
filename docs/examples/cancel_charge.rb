require "gerencianet"
require_relative "./credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: true
}

params = {
  id: 2363
}

gerencianet = Gerencianet.new(options)
puts gerencianet.cancel_charge(params: params)
