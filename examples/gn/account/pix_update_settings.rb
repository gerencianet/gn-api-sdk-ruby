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
    pix: {
        receberSemChave: true,
        chaves: {
            "sua_chave": {
                recebimento: {
                    txidObrigatorio: true,
                    qrCodeEstatico: {
                        recusarTodos: false
                    }
                }
            }
        }
    }
}

gerencianet = Gerencianet.new(options)
puts gerencianet.pix_update_settings(body: body)

