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
    id: " "
}

gerencianet = Gerencianet.new(options)
puts gerencianet.pix_unset_txid(params: params)

