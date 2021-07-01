require "gerencianet"
require_relative "./credentials"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: CREDENTIALS::SANDBOX
}

plan = {
  name: "My first plan",
  repeats: 24,
  interval: 2
}

subscription = {
  items: [{
    name: "Product 1",
    value: 1000,
    amount: 2
  }]
}

gerencianet = Gerencianet.new(options)
plan = gerencianet.create_plan(body: plan)

params = {
  id: plan["data"]["plan_id"]
}

puts gerencianet.create_subscription(params: params, body: subscription)
