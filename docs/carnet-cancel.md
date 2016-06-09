### Canceling the carnet

Only `active` carnets can be canceled:

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
