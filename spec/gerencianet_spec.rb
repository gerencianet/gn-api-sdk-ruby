require "spec_helper"
require "cgi"

describe Gerencianet::Endpoints do
  let(:base_url) { Gerencianet::Constants::URL[:sandbox] }
  let(:endpoints) { Gerencianet::Constants::ENDPOINTS }

  before(:each) do
    @options = {
      client_id: "client_id",
      client_secret: "client_secret",
      sandbox: true
    }

    @gerencianet = Gerencianet.new(@options)
  end

  describe "initialization" do
    context "methods creation" do
      it "should have mapped the endpoints" do
        expect(@gerencianet).to respond_to :create_charge
      end
    end

    context "urls" do
      urls = Gerencianet::Constants::URL

      it "should set base_url to point to sandbox" do
        expect(@gerencianet.base_url).to eq(urls[:sandbox])
      end

      it "should set base_url to point to production" do
        @options[:sandbox] = false
        @gerencianet = Gerencianet.new(@options)
        expect(@gerencianet.base_url).to eq(urls[:production])
      end
    end
  end

  describe "making requests" do
    let(:authorize_url) do
      "#{base_url}#{endpoints[:authorize][:route]}"
    end

    let(:create_charge_url) do
      "#{base_url}#{endpoints[:create_charge][:route]}"
    end

    let(:detail_charge_url) do
      "#{base_url}/charge/1000?page=10&total=2000"
    end

    it "should get a token and make a request" do
      stub_request(:post, authorize_url)
        .to_return(body: {}.to_json)

      stub_request(:post, create_charge_url)
        .to_return(body: {}.to_json)

      @gerencianet.create_charge

      expect(WebMock).to have_requested(:post, authorize_url)
      expect(WebMock).to have_requested(:post, create_charge_url)
    end

    it "should stop at trying to get a token" do
      stub_request(:post, authorize_url)
        .to_return(status: 401)

      expect do
        @gerencianet.create_charge
      end.to raise_error("unable to authenticate")

      expect(WebMock).to have_requested(:post, authorize_url)
      expect(WebMock).not_to have_requested(:post, create_charge_url)
    end

    it "should redo authorization and original request one time" do
      @gerencianet.token = {}

      stub_request(:post, create_charge_url)
        .to_return(status: 401, body: {}.to_json)

      stub_request(:post, authorize_url)
        .to_return(body: {}.to_json)

      @gerencianet.create_charge

      expect(WebMock).to have_requested(:post, create_charge_url).twice
      expect(WebMock).to have_requested(:post, authorize_url)
    end

    it "should raise parser error" do
      stub_request(:post, authorize_url)
        .to_return(body: "")

      expect do
        @gerencianet.create_charge
      end.to raise_error("unable to parse server response, not a valid json")

      expect(WebMock).to have_requested(:post, authorize_url)
      expect(WebMock).not_to have_requested(:post, create_charge_url)
    end

    context "mapping params" do
      it "should map params to route placeholders and query string" do
        stub_request(:post, authorize_url)
          .to_return(body: {}.to_json)

        stub_request(:get, detail_charge_url)
          .to_return(body: {}.to_json)

        @gerencianet.detail_charge(params: {id: 1000, page: 10, total: 2000})

        expect(WebMock).to have_requested(:post, authorize_url)
        expect(WebMock).to have_requested(:get, detail_charge_url)
      end

      it "should forward parter-token header" do
        @options[:partner_token] = 'my-partner-token'

        stub_request(:post, authorize_url)
          .to_return(body: {}.to_json)

        stub_request(:post, create_charge_url)
          .with(:headers => {'Accept' => 'application/json',
            'Api-Sdk' => "ruby-#{Gerencianet::VERSION}",
            'Authorization' => 'Bearer ',
            'Connection' => 'close', 'Host'=>'sandbox.gerencianet.com.br',
            'User-Agent' => 'http.rb/0.9.8',
            'Partner-Token' => 'my-partner-token'
          }).to_return(body: {}.to_json)

        @gerencianet.create_charge

        expect(WebMock).to have_requested(:post, authorize_url)
        expect(WebMock).to have_requested(:post, create_charge_url)
      end
    end
  end
end
