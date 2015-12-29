## Updating carnets

### Changing the metadata

You can update the `custom_id` and the `notification_url` of a carnet at any time.

It's important to keep in mind that all the charges of the carnet will be updated. If you want to update only one charge, check [Updating charges](/docs/charge-update.md).

```ruby
params = {
  id: 1000
}

body = {
  notification_url: "http://yourdomain.com",
  custom_id: "my_new_id"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.update_carnet_metadata(params: params, body: body)
```

If everything goes well, the response will be:

```ruby
{
  "code": 200
}
```

### Updating the expiration date of a parcel

Only parcels with status `waiting` or `unpaid` can have expiration date set or updated:

```ruby
params = {
  id: 1000,
  parcel: 1
}

body = {
  expire_at: "2020-12-12"
}

gerencianet = Gerencianet.new(options)
puts gerencianet.update_parcel(params: params, body: body)
```

If everything goes well, the response will be:

```ruby
{
  "code": 200
}
```
