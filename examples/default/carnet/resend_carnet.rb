require "gerencianet"
require_relative "./credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: CREDENTIALS::SANDBOX
}

params = {
  id: 1000
}

body = {
  email: 'oldbuck@gerencianet.com.br'
}

gerencianet = Gerencianet.new(options)
puts gerencianet.resend_carnet(params: params, body: body)