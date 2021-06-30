require "gerencianet"
require_relative "./credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: CREDENTIALS::SANDBOX
}

params = {
  id: 1008
}

body = {
  expire_at: "2020-12-12"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.update_billet(params: params, body: body)
