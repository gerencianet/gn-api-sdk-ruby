### Resending carnet parcel

To resend the carnet parcel, the parcel must have a `waiting` status.

If the parcel contemplates this requirement, you just have to provide the carnet id, the parcel number and a email to resend it:

```ruby
params = {
  id: 1000,
  parcel: 1
}

body = {
  email: 'oldbuck@gerencianet.com.br'
}

gerencianet = Gerencianet.new(options)
puts gerencianet.resend_parcel(params: params, body: body)
```

If everything goes well, the return will be:

```ruby
{
  "code": 200
}
```
