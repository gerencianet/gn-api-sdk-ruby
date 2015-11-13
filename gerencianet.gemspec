# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gerencianet/version'

Gem::Specification.new do |spec|
  spec.name          = "gerencianet"
  spec.version       = Gerencianet::VERSION
  spec.authors       = ["Francisco Carvalho"]
  spec.email         = ["desenvolvedores@gerencianet.com.br"]

  spec.summary       = %q{Gerencianet API Ruby Gem}
  spec.description   = %q{A ruby gem for integration of your backend with the payment services provided by Gerencianet}
  spec.homepage      = "https://github.com/gerencianet/gn-api-sdk-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "webmock"

  spec.add_runtime_dependency "http", ">= 0.9.8"
end
