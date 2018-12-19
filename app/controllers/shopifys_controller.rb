class ShopifysController < ApplicationController
    attr_accessor :tokens
    API_KEY = ENV['API_KEY']
    API_SECRET = ENV['API_SECRET']
    APP_URL = "e45422c0.ngrok.io"

    def initialize
        @tokens = {}
        super
    end

    def install
        shop = request.params['shop']
        scopes = "read_orders,read_products"

        install_url =
            "http://#{shop}/admin/oauth/authorize?client_id=#{API_KEY}&scope=#{scopes}"\
            "&redirect_uri=https://#{APP_URL}/shopify/auth"

        redirect_to install_url
    end

    def auth
        shop = request.params['shop']
        code = request.params['code']
        hmac = request.params['hmac']

        h = request.params.reject{|k,_| k == 'hmac'}
        query = URI.escape(h.sort.collect{|k,v| "#{k}=#{v}"}.join('&'))
        digest = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), API_SECRET, query)

        if not ActiveSupport::SecurityUtils.secure_compare(hmac, digest)
            return [403, "Authentication failed. Digest provided was: #{digest}"]
        else
            redirect_to root
        end

    end

end