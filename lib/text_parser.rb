require_relative 'constants'
require_relative 'helpers'

module BigFiveResults
  class TextParser
    include Helpers

    def initialize(filename:)
      @filename = filename
      @filepath = File.join(APP_ROOT, 'extras', @filename)

      if !File.exist?(@filepath)
        abort("Results file does not exists")
      end

      self
    end

    def read
      facet_data
    end

    private

      def facet_data
        facets_hash = {}

        File.open(@filepath, 'r') do |file|
          file.each_line do |line|
            next if line.strip!.empty?

            lines_of_hash = parse_line_into_hash(line) unless line.empty?
            facets_hash["#{lines_of_hash.keys.first}"] = lines_of_hash.values.first
          end
        end

        hash_builder(facets_hash)
      end
  end
end
