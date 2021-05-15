require 'html_parser'

describe "BigFiveResults::HTMLParser" do
  describe "#read" do
    it 'returns formatted facets hash data' do
      hash_of_models_with_facets = BigFiveResults::HTMLParser.new(personality_test_url: BigFiveResults::RESULTS_ENDPOINT).read

      models = hash_of_models_with_facets.keys
      expect(models).to eq([:"EXTRAVERSION", :"AGREEABLENESS", :"CONSCIENTIOUSNESS", :"NEUROTICISM", :"OPENNESS TO EXPERIENCE"])
    end
  end
end
