## Adding information to charge's history

It is possible to add information to the history of a charge. These informations will be listed when [detailing a charge](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/charge-detailing.md).

The process to add information to history is shown below:


```ruby
params = {
  id: 1000
}

body = {
  description: "Info that will be added to charges history"
}

gerencianet = Gerencianet.new(options)
gerencianet.create_charge_history(params: params, body: body)
```

If everything goes well, the return will be:

```ruby
{
  "code": 200
}
```
