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
    chave: "sua_chave"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.pix_delete_webhook(params: params)

