## Creating subscriptions

If you ever have to recurrently charge your clients, you can create a different kind of charge, one that belongs to a subscription. This way, subsequent charges will be automatically created based on plan configuration and the charge value is charged in your customers' credit card, or the banking billet is generated and sent to the custumer, accoding to the plan’s configuration.

The plan configuration receive two params: `repeats` and `interval`:

The `repeats` parameter defines how many times the transaction will be repeated. If you don't provide it, the subscription will create charges indefinitely.

The `interval` parameter defines the interval, in months, that a charge has to be generated. The minimum value is 1, and the maximum is 24.

It's worth to mention that this mechanics is triggered only if the customer commits the subscription. In other words, it takes effect when the customer pays the first charge.

At last, it boils down to creating a plan and then the subscription. The plan can be reused for generating other subscriptions:

```ruby
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

gerencianet.create_subscription(params: params, body: subscription)
```

### Deleting a plan:
*(works just for plans that doesn't have a subscription associated):*

```ruby
params = {
  id: 1
}

gerencianet = Gerencianet.new(options)
gerencianet.delete_plan(params: params)
```

### Canceling subscriptions

You can cancel active subscriptions at any time:

```ruby
params = {
  id: 1111
}

gerencianet = Gerencianet.new(options)
puts gerencianet.cancel_subscription(params: params)
```

```js
{
  "code": 200
}
```
