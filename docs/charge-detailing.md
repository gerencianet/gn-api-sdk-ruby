## Detailing charges

It's very simple to get details from a charge. You just need the id:

```ruby
params = {
  id: 1000
}

gerencianet = Gerencianet.new(options)
gerencianet.detail_charge(params: params)
```

As response, you will receive all the information about the charge (including if it belongs to a subscription or carnet):

```ruby
{
  "code": 200,
  "data": {
    "charge_id": 233,
    "subscription_id": 12,
    "total": 2000,
    "status": "new",
    "custom_id": null,
    "created_at": "2015-05-14",
    "notification_url": "http://yourdomain.com",
    "items": [
      {
        "name": "Product 1",
        "value": 1000,
        "amount": 2
      }
    ],
    "history": [
      {
        "message": "Cobrança criada",
        "created_at": "2015-05-14 15:39:14"
      }
    ]
  }
}
```
