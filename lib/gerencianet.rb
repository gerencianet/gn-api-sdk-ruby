require "gerencianet/version"
require "gerencianet/endpoints"

module Gerencianet
  def self.new(options)
    Endpoints.new(options)
  end
end