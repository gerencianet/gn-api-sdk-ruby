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
response =  gerencianet.pix_generate_qrcode(params: params)
puts response['qrcode']

data = response['imagemQrcode']
image_data = Base64.decode64(data['data:image/png;base64,'.length .. -1])
new_file=File.new("./../../../imgQrcode/qrCodeImage.png", 'wb') #salva a imagem do qrcode na pasta imgQrcode no diretório raiz
new_file.write(image_data)