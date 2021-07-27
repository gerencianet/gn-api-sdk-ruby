require "gerencianet"
require "date"
require_relative "../../credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: CREDENTIALS::SANDBOX
}

expireAt = Date.today + 3

params = {
  id: 1000
}

body = {
  billet_discount: 0,
  card_discount: 0,
  message: "",
  expire_at: expireAt.strftime,
  request_delivery_address: false,
  payment_method: "all"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.charge_link(params: params, body: body)
