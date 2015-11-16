require "http"
require "cgi"
require "gerencianet/constants"
require "gerencianet/status"

module Gerencianet
  # Given the constants file, with the endpoints signatures,
  # this class maps each one of them to a concerning function
  class Endpoints
    attr_accessor :token
    attr_reader :endpoints
    attr_reader :urls
    attr_reader :base_url
    attr_reader :options

    def initialize(options)
      @token = nil
      @options = options
      @endpoints = Constants::ENDPOINTS
      @urls = Constants::URL
      @base_url = current_base_url

      create_methods
    end

    private

    def create_methods
      @endpoints.each do |key, settings|
        self.class.send(:define_method, key) do |args = {}|
          create(args[:params], args[:body], settings)
        end
      end
    end

    def create(params, body, settings)
      authenticate unless @token

      response = make_request(params, body, settings)

      if response.status.to_s == STATUS::UNAUTHORIZED
        authenticate
        response = make_request(params, body, settings)
      end

      respond(response)
    end

    def make_request(params, body, settings)
      url = get_url(params, settings[:route])

      HTTP
        .headers(accept: "application/json")
        .auth("Bearer #{@token['access_token']}")
        .method(settings[:method])
        .call(url, json: body)
    end

    def authenticate
      url = get_url({}, @endpoints[:authorize][:route])

      response =
        HTTP
        .basic_auth(auth_headers)
        .post(url, json: auth_body)

      if response.status.to_s == STATUS::UNAUTHORIZED
        fail "unable to authenticate"
      else
        @token = respond(response)
      end
    end

    def auth_headers
      {
        user: @options[:client_id],
        pass: @options[:client_secret]
      }
    end

    def auth_body
      {grant_type: :client_credentials}
    end

    def respond(response)
      JSON.parse(response)
    rescue JSON::ParserError
      raise "unable to parse server response, not a valid json"
    end

    def get_url(params, route)
      params = {} if params.nil?
      route = remove_placeholders(params, route)
      full_url(params, route)
    end

    def remove_placeholders(params, route)
      regex = /\:(\w+)/
      route.scan(regex).each do |key|
        key = key[0]
        value = params[key.to_sym].to_s
        route = route.gsub(":#{key}", value)
        params.delete(key.to_sym)
      end

      route
    end

    def full_url(params, route)
      mapped = map_params(params)

      if !mapped.empty?
        "#{@base_url}#{route}?#{CGI.escape(mapped)}"
      else
        "#{@base_url}#{route}"
      end
    end

    def map_params(params)
      params.map do |key|
        "#{key[0]}=#{key[1]}"
      end.join("&")
    end

    def current_base_url
      @options[:sandbox] ? @urls[:sandbox] : @urls[:production]
    end
  end
end
