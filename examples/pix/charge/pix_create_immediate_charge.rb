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
    calendario: {
        expiracao: 3600
    },
    devedor: {
        cpf: "12345678909",
        nome: "Francisco da Silva"
    },
    valor: {
        original: "0.01"
    },
    chave: "sua_chave",
    solicitacaoPagador: "Cobrança dos serviços prestados."
}

gerencianet = Gerencianet.new(options)
puts gerencianet.pix_create_immediate_charge(body: body)
