require "gerencianet"
require_relative "./credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: true
}

body = {
  name: "My first plan",
  repeats: 24,
  interval: 2
}

gerencianet = Gerencianet.new(options)
puts gerencianet.create_plan(body: body)
