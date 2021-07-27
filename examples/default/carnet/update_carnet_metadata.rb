require "gerencianet"
require_relative "../../credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: CREDENTIALS::SANDBOX
}

params = {
  id: 1004
}

body = {
  notification_url: "http://yourdomain.com",
  custom_id: "my_new_id"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.update_carnet_metadata(params: params, body: body)
