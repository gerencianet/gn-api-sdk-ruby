### Canceling a carnet parcel

To cancel a carnet parcel, it must have status `waiting` or `unpaid`.

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
