require 'net/http'
require 'json'

module BigFiveResults
  class Submitter
    def initialize(option={})
      @url_enpoint = option[:url]
      @data = option[:data]
    end

    def submit
      post_data
    end

    private

      def data_to_json
        @data.to_json
      end

      def post_data
        uri = URI.parse(@url_enpoint)
        req = Net::HTTP::Post.new(uri.to_s)
        req.body = data_to_json
        req['Content-Type'] = 'application/json'

        response = https(uri).request(req)
        puts response.body
      end

      def https(uri)
        Net::HTTP.new(uri.host, uri.port).tap do |http|
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
      end
  end
end
