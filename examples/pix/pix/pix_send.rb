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

body = {
    valor: "0.01",
    pagador: {
        chave: "sua_chave"
    },
    favorecido: {
        chave: "chave_favorecido"
    }
}

gerencianet = Gerencianet.new(options)
puts gerencianet.pix_send(body: body)

