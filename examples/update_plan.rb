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
  name: "My new plan"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.update_plan(params: params, body: body)
