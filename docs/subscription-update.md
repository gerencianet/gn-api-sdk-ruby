## Updating subscriptions

### Changing the metadata

You can update the `custom_id` or the `notification_url` of a subscription.

It is important to keep in mind that all the subscription charges will be updated. If you want to update only one, check [Updating charges](/docs/charge-update).

```ruby
params = {
  id: 1009
}

body = {
  notification_url: "http://yourdomain.com",
  custom_id: "my_new_id"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.update_subscription_metadata(params: params, body: body)
```

If everything goes well, the return will be:

```ruby
{
  "code": 200
}
```
