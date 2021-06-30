require "gerencianet"
require "date"
require_relative "./credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: CREDENTIALS::SANDBOX
}

tomorrow = Date.today + 1

params = {
  id: 553880 
}

body = {
  payment: {
    banking_billet: {
      expire_at: tomorrow.strftime,
      customer: {
        name: "Gorbadoc Oldbuck",
        email: "oldbuck@gerencianet.com.br",
        cpf: "94271564656",
        birth: "1977-01-15",
        phone_number: "5144916523"
      }
    }
  }
}

gerencianet = Gerencianet.new(options)
puts gerencianet.pay_charge(params: params, body: body)
