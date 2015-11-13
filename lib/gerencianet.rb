require "gerencianet/version"
require "gerencianet/endpoints"

# Module that just returns an Endpoints instance
module Gerencianet
  def self.new(options)
    Endpoints.new(options)
  end
end
