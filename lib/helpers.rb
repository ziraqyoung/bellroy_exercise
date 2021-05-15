require_relative 'constants'

module Helpers
  def parse_line_into_hash(line)
    return unless match = line.match(BigFiveResults::LINE_FORMAT)

    { "#{match[:category]}": match[:score].to_i }
  end

  def hash_builder(attr_hash)
    only_results_hash = {}

    BigFiveResults::MODELS.keys.each do |model|
      model_facets = {}

      attr_hash.keys.each do |attr|
        if attr == model.to_s
          only_results_hash[model] = {
            "Overall Score": attr_hash[attr],
          }
        end

        if BigFiveResults::MODELS[model].include?(attr)
          model_facets.merge!({ "#{attr}": attr_hash[attr] })

          only_results_hash[model].merge!("Facets": model_facets)
        end
      end
    end

    only_results_hash
  end
end
