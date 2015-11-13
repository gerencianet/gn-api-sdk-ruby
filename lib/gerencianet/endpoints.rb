require "http"
require "gerencianet/constants"
require "gerencianet/status"

module Gerencianet
  class Endpoints
    attr_accessor :token
    attr_reader :endpoints
    attr_reader :urls
    attr_reader :base_url
    attr_reader :options

    def initialize(options)
      @token = nil
      @options = options
      @endpoints = Constants::endpoints[:ENDPOINTS]
      @urls = Constants::endpoints[:URL]
      @base_url = get_base_url

      create_methods
    end

    private
      def create_methods
        @endpoints.each do |key, settings|
          self.class.send(:define_method, key) do |params = nil, body = nil|
            create(params, body, settings)
          end
        end
      end

      def create(params, body, settings)
        if(!@token)
          authenticate
        end

        response = make_request(params, body, settings)

        if(response.status.to_s == STATUS::UNAUTHORIZED)
          authenticate
          response = make_request(params, body, settings)
        end

        response
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

        headers = {
          user: @options[:client_id],
          pass: @options[:client_secret]
        }

        body = {
          grant_type: :client_credentials
        }

        response = HTTP
          .basic_auth(headers)
          .post(url, json: body)

        if(response.status.to_s == STATUS::OK)
          begin
            @token = JSON.parse(response)
          rescue JSON::ParserError
            raise "unable to parse server response, not a valid json"
          end
        else
          raise "unable to authenticate"
        end
      end

      def get_url(params, route)
        params ||= {}
        regex = /\:(\w+)/

        route.scan(regex).each do |key|
          key = key[0]
          value = params[key.to_sym].to_s
          route = route.gsub(":#{key}", value)
          params.delete(key.to_sym)
        end

        mapped = params.map do |key|
          "#{key[0]}=#{key[1]}"
        end.join('&')

        if(!mapped.empty?)
          "#{@base_url}#{route}?#{mapped}"
        else
          "#{@base_url}#{route}"
        end
      end

      def get_base_url
        if(@options[:sandbox])
          @urls[:sandbox]
        else
          @urls[:production]
        end
      end
  end
end