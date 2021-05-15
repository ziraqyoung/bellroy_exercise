require 'helpers'


describe "Helpers" do
  class DummyClass; end

  before(:each) do
    @dummy_class = DummyClass.new
    @dummy_class.extend(Helpers)

    @arr_of_string = [
      "FirstFacet.....21",
      "First Facet.....20",
      "Long First Facet.......29",
      "SqueezedFact39"
    ]

    @results_hash = [
      {"FirstFacet": 21},
      {"First Facet": 20},
      {"Long First Facet": 29},
      {"SqueezedFact": 39}
    ]
  end

  describe "#parse_line_into_hash" do
    it 'returns a string parsed to hash' do

      h = []

      @arr_of_string.each do |str|
        h << @dummy_class.parse_line_into_hash(str)
      end

      expect(@results_hash).to eq(h)
    end 
  end

  describe "#hash_builder" do
    it "merges hash together adding 'Overall Scroe' key for any of Big Five models" do
      pending "******* Require more dubug *******"

      attr_hash = {
        "CONSCIENTIOUSNESS": 43,
        "Self-Efficacy": 24,
        "Orderliness": 18,
        "Dutifulness": 54,
        "Achievement-Striving": 56,
        "Self-Discipline": 47,
        "Cautiousness": 72
      }

      formatted_hash = {
        "CONSCIENTIOUSNESS": {
          "Overall Score":43,
          "Facets": {
            "Self-Efficacy": 24,
            "Orderliness": 18,
            "Dutifulness": 54,
            "Achievement-Striving": 56,
            "Self-Discipline": 47,
            "Cautiousness": 72
          }
        }
      }

      expect(@dummy_class.hash_builder(attr_hash)).to eq(formatted_hash)
    end
  end
end
