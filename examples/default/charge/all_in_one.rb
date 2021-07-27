require "gerencianet"
require_relative "../../credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: CREDENTIALS::SANDBOX
}

charge = {
  items: [{
    name: "Product 1",
    value: 1000,
    amount: 2
  }],
  shippings: [{
    name: "Default Shipping Cost",
    value: 100
  }, {
    name: "Adicional Shipping Cost",
    value: 150
  }]
}

payment = {
  payment: {
    credit_card: {
      installments: 1,
      payment_token: "88faabaa35f9d9ff29c315e03255c5644554a771",
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
        cpf: "94271564656",
        birth: "1977-01-15",
        phone_number: "5144916523"
      }
    }
  }
}

gerencianet = Gerencianet.new(options)

charge = gerencianet.create_charge(body: charge)

params = {
  id: charge["data"]["charge_id"]
}

puts gerencianet.pay_charge(params: params, body: payment)
