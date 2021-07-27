require "gerencianet"
require_relative "../../credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: CREDENTIALS::SANDBOX
}

params = {
  id: 1009
}

body = {
  notification_url: "http://yourdomain.com",
  custom_id: "my_new_id"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.update_subscription_metadata(params: params, body: body)
