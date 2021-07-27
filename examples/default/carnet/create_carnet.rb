require "gerencianet"
require "date"
require_relative "../../credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: CREDENTIALS::SANDBOX
}

tomorrow = Date.today + 1

body = {
  expire_at: tomorrow.strftime,
  items: [{
    name: "Carnet Item 1",
    value: 1000,
    amount: 2
  }],
  customer: {
    name: "Gorbadoc Oldbuck",
    email: "oldbuck@gerencianet.com.br",
    cpf: "94271564656",
    birth: "1977-01-15",
    phone_number: "5144916523"
  },
  repeats: 12,
  split_items: false
}

gerencianet = Gerencianet.new(options)
puts gerencianet.create_carnet(body: body)
