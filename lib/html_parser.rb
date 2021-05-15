require 'nokogiri'
require 'net/http'
require 'byebug'

require_relative 'constants'
require_relative 'helpers'

module BigFiveResults
  class HTMLParser
    include Helpers

    def initialize(options={})
      @personality_test_url = options[:personality_test_url]
    end

    def read
      facet_data
    end

    private

      def unparsed_html
        uri = URI.parse(url_endpoint)
        req = Net::HTTP::Get.new(uri.to_s)
        response = https(uri).request(req)

        response.body
      end

      def parsed_html
        Nokogiri::HTML(unparsed_html)
      end

      def facet_data
        facets_hash = {}

        parsed_html.css('div.graph-txt').each do |card|
          card.css('code p').each_with_index do |facet, index|
            next if index.zero?

            lines_of_hash = parse_line_into_hash(facet.text) unless facet.text.empty?
            facets_hash["#{lines_of_hash.keys.first}"] = lines_of_hash.values.first
          end
        end

        hash_builder(facets_hash)
      end

      def https(uri)
        Net::HTTP.new(uri.host, uri.port).tap do |http|
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
      end

      def url_endpoint
        @personality_test_url
      end
  end
end

