require "gerencianet"
require_relative "../../credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: CREDENTIALS::SANDBOX
}

params = {
  id: 1008,
  parcel: 1
}

body = {
  expire_at: "2020-12-12"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.update_parcel(params: params, body: body)
