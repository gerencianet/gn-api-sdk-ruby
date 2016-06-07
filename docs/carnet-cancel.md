### Canceling the carnet

You can cancel `active` carnet:

```ruby
params = {
  id: 1000
}

gerencianet = Gerencianet.new(options)
puts gerencianet.cancel_carnet(params: params)
```

If everything goes well, the return will be:

```ruby
{
  "code": 200
}
```
