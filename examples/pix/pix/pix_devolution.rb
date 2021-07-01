require "gerencianet"
require_relative "../../credentials"

require "uri"
require "net/http"
require "openssl"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  pix_cert: CREDENTIALS::PIX_CERT,
  sandbox: CREDENTIALS::SANDBOX
}

params = {
    e2eId: " ",
    id: " "
}

body = {
    valor: "0.01"
}


gerencianet = Gerencianet.new(options)
puts gerencianet.pix_devolution(params: params, body: body)

