# gn-api-sdk-ruby

> A ruby gem for integration of your backend with the payment services
provided by [Gerencianet](http://gerencianet.com.br).

[![Build Status](https://travis-ci.org/gerencianet/gn-api-sdk-ruby.svg)](https://travis-ci.org/gerencianet/gn-api-sdk-ruby)
[![Coverage Status](https://coveralls.io/repos/gerencianet/gn-api-sdk-ruby/badge.svg?branch=master&service=github)](https://coveralls.io/github/gerencianet/gn-api-sdk-ruby?branch=master)
[![Code Climate](https://codeclimate.com/github/gerencianet/gn-api-sdk-ruby/badges/gpa.svg)](https://codeclimate.com/github/gerencianet/gn-api-sdk-ruby)
[![Gem Version](https://badge.fury.io/rb/gerencianet.svg)](https://badge.fury.io/rb/gerencianet)

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
## Tested with
```
ruby 2.6.6
```
## Basic usage

```ruby
require "gerencianet"

options = {
  client_id: CREDENTIALS::CLIENT_ID,
  client_secret: CREDENTIALS::CLIENT_SECRET,
  sandbox: CREDENTIALS::SANDBOX
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

You can run the examples inside `examples` with `$ ruby examples/example.rb`:

```bash
$ ruby examples/create_charge.rb
```

Just remember to set the correct credentials inside `examples/credentials.rb` before running.

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

The full documentation with all available endpoints is in https://dev.gerencianet.com.br/.

## Changelog

[CHANGELOG](https://github.com/gerencianet/gn-api-sdk-ruby/tree/master/CHANGELOG.md)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gerencianet/gn-api-sdk-ruby. This project is intended to be a safe, welcoming space for collaboration.

## License

The gem is available as open source under the terms of the [MIT License](LICENSE).
