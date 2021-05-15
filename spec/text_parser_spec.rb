require 'text_parser'

describe "BigFiveResults::TextParser" do
  describe "#read" do
    it 'returns formatted facets hash data' do
      hash_of_models_with_facets = BigFiveResults::TextParser.new(filename: "results.txt").read

      models = hash_of_models_with_facets.keys
      expect(models).to eq([:"EXTRAVERSION", :"AGREEABLENESS", :"CONSCIENTIOUSNESS", :"NEUROTICISM", :"OPENNESS TO EXPERIENCE"])
    end
  end
end
