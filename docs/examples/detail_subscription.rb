require "gerencianet"
require_relative "./credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: true
}

params = {
  id: 1120
}

gerencianet = Gerencianet.new(options)
puts gerencianet.detail_subscription(params: params)
