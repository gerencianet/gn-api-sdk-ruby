require "gerencianet"
require_relative "./credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: true
}

body = {
  payment: {
    credit_card: {
      installments: 1,
      payment_token: "5739b06925244dd1ab8e0afa62389d5fb4ea2945",
      billing_address: {
        street: "Av. JK",
        number: 909,
        neighborhood: "Bauxita",
        zipcode: "35400000",
        city: "Ouro Preto",
        state: "MG"
      },
      customer: {
        name: "Gorbadoc Oldbuck",
        email: "oldbuck@gerencianet.com.br",
        cpf: "04267484171",
        birth: "1977-01-15",
        phone_number: "5144916523"
      }
    }
  }
}

params = {
  id: 2366
}

gerencianet = Gerencianet.new(options)
puts gerencianet.pay_charge(params: params, body: body)
