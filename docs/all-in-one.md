## Create charge and payment

The most common case scenarios consist of the two steps mentioned in the title. The other examples show each part separately. Here goes the most used endpoints grouped in one example.

Create the inputs for the three endpoints:

```ruby
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
        cpf: "04267484171",
        birth: "1977-01-15",
        phone_number: "5144916523"
      }
    }
  }
}
```

Call the endpoints:

```ruby
require "gerencianet"

options = {
  client_id: "client_id",
  client_secret: "client_secret",
  sandbox: true
}

gerencianet = Gerencianet.new(options)

charge = gerencianet.create_charge(body: charge)

params = {
  id: charge["data"]["charge_id"]
}

puts gerencianet.pay_charge(params: params, body: payment)
```

Response:

```ruby
{ "code": 200,
  "data": {
     "charge_id": 260,
     "total": 2250,
     "status": 'new',
     "custom_id": null,
     "created_at": "2015-05-18"
   }
} #charge created

{ "code": 200,
  "data": {
     "charge_id": 260,
     "total": 2400,
     "payment": "credit_card",
     "installments": 1,
     "installment_value": 2400
  }
} #payment created
```
