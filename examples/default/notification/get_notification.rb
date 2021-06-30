require "gerencianet"
require_relative "./credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: CREDENTIALS::SANDBOX
}

params = {
  token: "252948279264ee47e117cb099ef81"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.get_notification(params: params)
