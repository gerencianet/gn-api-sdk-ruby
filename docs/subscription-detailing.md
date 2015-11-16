## Detailing subscriptions

Works just like the charge detailing, but here you pass the subscription id:

```ruby
params = {
  id: 1120
}

gerencianet = Gerencianet.new(options)
gerencianet.detail_subscription(params: params)
```

Response:

```ruby
{
  "code": 200,
  "data": {
    "subscription_id": 12,
    "value": 2000,
    "status": "new",
    "payment_method": null,
    "next_execution": null,
    "next_expire_at": null,
    "interval": 1,
    "repeats": 2,
    "processed_amount": 0,
    "created_at": "2015-05-14 15:39:14",
    "history": [
      {
        "charge_id": 233,
        "status": "new",
        "created_at": "2015-05-14 15:39:14"
      }
    ]
  }
}
```

Note that if you [detail a charge](/docs/charge-detailing.md) that belongs to a subscription, the response will have a `subscription` block with data about it, including the `subscription_id`. If you need the subscription information, you can do this:

```ruby
params = {
  charge_id: 2332
}

gerencianet = Gerencianet.new(options)
charge = gerencianet.detail_charge(params: params)

params = {
  id: charge["data"]["subscription_id"]
}

gerencianet.detail_subscription(params: params)
```
