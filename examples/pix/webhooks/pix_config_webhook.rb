require "gerencianet"
require_relative "../../credentials"

require "uri"
require "net/http"
require "openssl"

#verificar o mtls

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  pix_cert: CREDENTIALS::PIX_CERT,
  sandbox: CREDENTIALS::SANDBOX,
  "x-skip-mtls-checking": "true"
}


params = {
    chave: "sua_chave"
}

body = {
    webhookUrl: "https://exemplo-pix/webhook"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.pix_config_webhook(params: params, body: body)
