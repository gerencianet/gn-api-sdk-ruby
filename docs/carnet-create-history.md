## Adding information to carnet's history

It is possible to add information to the history of a carnet. These informations will be listed when [detailing a carnet](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/carnet-detailing.md).

The process to add information to history is shown below:


```ruby
params = {
  id: 1000
}

body = {
  description: "Info that will be added to carnet history"
}

gerencianet = Gerencianet.new(options)
gerencianet.create_carnet_history(params: params, body: body)
```

If everything goes well, the return will be:

```ruby
{
  "code": 200
}
```
