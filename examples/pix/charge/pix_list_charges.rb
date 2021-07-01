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
  inicio: "2020-10-22T16:01:35Z",
  fim: "2021-04-23T16:01:35Z"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.pix_list_charges(params: params)
