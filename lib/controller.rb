require_relative 'text_parser'
require_relative 'html_parser'
require_relative 'submitter'
require_relative 'constants'

module BigFiveResults
  class Controller
    def initialize
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
          "NAME": "Jane Doe",
          "EMAIL": "janee@doe.com"
        }

        # use text file data
        # full_results.merge! text_file_data

        # use html file data
        full_results.merge! html_data
      end

      def text_file_data
        BigFiveResults::TextParser.new.read
      end

      def html_data
        BigFiveResults::HTMLParser.new(personality_test_url: BigFiveResults::RESULTS_ENDPOINT).read
      end
  end
end
