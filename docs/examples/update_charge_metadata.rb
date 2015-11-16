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
  notification_url: "http://yourdomain.com",
  custom_id: "my_new_id"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.update_charge_metadata(params: params, body: body)
