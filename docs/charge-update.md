## Updating charges

### Changing the metadata

You can update the `custom_id` or the `notification_url` of a charge:

```ruby
params = {
  id: 1008
}

body = {
  notification_url: "http://yourdomain.com",
  custom_id: "my_new_id"
}

gerencianet = Gerencianet.new(options)
gerencianet.update_charge_metadata(params: params, body: body)
```

If everything goes well, the return will be:

```ruby
{
  "code": 200
}
```

### Updating the expiration date of a billet

Only charges with status `waiting` or `unpaid` and with payment method `banking_billet` can have the `expire_at` changed:

```ruby
params = {
  id: 1008
}

body = {
  expire_at: "2020-12-12"
}

gerencianet = Gerencianet.new(options)
gerencianet.update_billet(params: params, body: body)
```

If everything goes well, the return will be:

```ruby
{
  "code": 200
}
```
