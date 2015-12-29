### Resending the carnet

To resend the carnet, it must have a `active` status.

If the carnet contemplates this requirement, you just have to provide the carnet id and a email to resend it:

```ruby
params = {
  id: 1000
}

body = {
  email: 'oldbuck@gerencianet.com.br'
}

gerencianet = Gerencianet.new(options)
puts gerencianet.resend_carnet(params: params, body: body)
```

If everything goes well, the return will be:

```ruby
{
  "code": 200
}
```
