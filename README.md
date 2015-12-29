# gn-api-sdk-ruby

> A ruby gem for integration of your backend with the payment services
provided by [Gerencianet](http://gerencianet.com.br).

[![Build Status](https://travis-ci.org/gerencianet/gn-api-sdk-ruby.svg)](https://travis-ci.org/gerencianet/gn-api-sdk-ruby)
[![Coverage Status](https://coveralls.io/repos/gerencianet/gn-api-sdk-ruby/badge.svg?branch=master&service=github)](https://coveralls.io/github/gerencianet/gn-api-sdk-ruby?branch=master)
[![Code Climate](https://codeclimate.com/github/gerencianet/gn-api-sdk-ruby/badges/gpa.svg)](https://codeclimate.com/github/gerencianet/gn-api-sdk-ruby)
[![Gem Version](https://badge.fury.io/rb/gerencianet.svg)](https://badge.fury.io/rb/gerencianet)

:warning: **Gerencianet API is under BETA version, meaning that it's not available for all users right now. If you're interested, you can always send an email to
desenvolvedores@gerencianet.com.br and we'll enable it for your account**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gerencianet'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install gerencianet
```

## Basic usage

```ruby
require "gerencianet"

options = {
  client_id: "client_id",
  client_secret: "client_secret",
  sandbox: true
}

gerencianet = Gerencianet.new(options)

charge = {
  items: [{
    name: "Product A",
    value: 1000,
    amount: 2
  }]
}

response = gerencianet.create_charge(body: charge)
```

## Examples

You can run the examples inside `docs/examples` with `$ ruby docs/examples/example.rb`:

```bash
$ ruby docs/examples/create_charge.rb
```

Just remember to set the correct credentials inside `docs/examples/credentials.rb` before running.

## Tests

To run the tests, just run *rspec*:

```bash
$ rspec
```

Or use *guard* to watch files and automatically run *rspec*

```bash
$ guard -n false -c
```

## Additional documentation

### Charges

- [Creating charges](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/charges.md)
- [Paying a charge](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/charge-payment.md)
- [Detailing charges](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/charge-detailing.md)
- [Updating informations](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/charge-update.md)
- [Resending billet](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/charge-resend-billet.md)
- [Adding information to charge's history](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/charge-create-history.md)

### Carnets

- [Creating carnets](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/carnets.md)
- [Detailing carnets](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/carnet-detailing.md)
- [Updating informations](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/carnet-update.md)
- [Resending the carnet](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/carnet-resend.md)
- [Resending carnet parcel](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/carnet-resend-parcel.md)
- [Adding information to carnet's history](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/carnet-create-history.md)

### Subscriptions

- [Creating subscriptions](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/subscriptions.md)
- [Paying a subscription](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/subscription-payment.md)
- [Detailing subscriptions](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/subscription-detailing.md)
- [Updating informations](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/subscription-update.md)

### Marketplace

- [Creating a marketplace](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/charge-with-marketplace.md)

### Notifications

- [Getting notifications](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/notifications.md)

### Payments

- [Getting installments](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/installments.md)

### All in one

- [Usage](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/docs/all-in-one.md)

## Changelog

[CHANGELOG](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/CHANGELOG.md)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gerencianet/gn-api-sdk-ruby. This project is intended to be a safe, welcoming space for collaboration.

## License

The gem is available as open source under the terms of the [MIT License](LICENSE).
