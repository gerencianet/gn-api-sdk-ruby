### Canceling carnet parcel

You can cancel carnet parcel. To this, the charge status must be `new`, `waiting` or `unpaid`.

```ruby
params = {
  id: 1000, 
  parcel: 1
}

gerencianet = Gerencianet.new(options)
puts gerencianet.cancel_parcel(params: params)
```

If everything goes well, the return will be:

```ruby
{
  "code": 200
}
```
