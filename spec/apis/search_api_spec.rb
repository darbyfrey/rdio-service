require 'spec_helper'

def app
  ApplicationApi
end

describe SearchApi do
  include Rack::Test::Methods

  describe 'GET to create a new search', :vcr do
    it 'returns a collection of objects for the given search' do
      get '/search', q: 'broken social scene'

      expect(parsed_response.data.class).to eq(Array)
      expect(parsed_response.data.first.type).to eq('artist')
    end

    it 'returns an empty collection for a search returning no results' do
      get '/search', q: 'foo bar baz'

      expect(parsed_response.data.class).to eq(Array)
      expect(parsed_response.data.count).to be(0)
    end
  end
end
