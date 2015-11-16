require "gerencianet"
require_relative "./credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: true
}

body = {
  name: "My Plan",
  limit: 1,
  offset: 0
}

gerencianet = Gerencianet.new(options)
puts gerencianet.get_plans(params: body)
