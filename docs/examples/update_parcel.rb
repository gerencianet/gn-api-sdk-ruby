require "gerencianet"
require_relative "./credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: true
}

params = {
  id: 1008
}

body = {
  parcel: 1,
  expire_at: "2020-12-12"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.update_parcel(params: params, body: body)
