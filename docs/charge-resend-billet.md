### Resending billet

To resend the charge's billet, the charge must have a `waiting` status, and the payment method chosen must be `banking_billet`.

If the charge contemplates these requirements, you just have to provide the charge id and a email to resend the billet:

```ruby
params = {
  id: 1253
}

body = {
  email: 'oldbuck@gerencianet.com.br'
}

gerencianet = Gerencianet.new(options)
puts gerencianet.resend_billet(params: params, body: body)
```

If everything goes well, the return will be:

```ruby
{
  "code": 200
}
```
