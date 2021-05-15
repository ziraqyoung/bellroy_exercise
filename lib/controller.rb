require_relative 'text_parser'
require_relative 'html_parser'
require_relative 'submitter'
require_relative 'constants'

module BigFiveResults
  class Controller
    def initialize(options:, use_url:)
      @options = options
      @use_url = use_url
    end

    def run!
      pp merged_data

      #code to submit results to recruitbot api
      @submission = BigFiveResults::Submitter.new(url: BigFiveResults::API_ENDPOINT, data: merged_data)
      puts @submission.submit
    end

    private

      def merged_data
        full_results = {
          "NAME": get_name,
          "EMAIL": get_email
        }

        if @use_url
          full_results.merge! html_data
        else
          full_results.merge! text_file_data
        end
      end

      def text_file_data
        BigFiveResults::TextParser.new(filename: get_textfile).read
      end

      def html_data
        BigFiveResults::HTMLParser.new(personality_test_url: get_results_url).read
      end

      def get_name
        @options[:name] ||= "Josphat Kariuki"
      end

      def get_email
        @options[:email] ||= "ziraqyoung@outlook.com"
      end

      def get_textfile
        @options[:textfile] ||= "results.txt"
      end

      def get_results_url
        @options[:results_url] ||= BigFiveResults::RESULTS_ENDPOINT
      end
  end
end
