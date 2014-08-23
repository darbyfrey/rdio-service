require 'spec_helper'

def app
  ApplicationApi
end

describe TracksApi do
  include Rack::Test::Methods

  describe 'GET to search for tracks with an artist_id', :vcr do
    it 'returns a collection of objects for the given search' do
      get '/tracks', artist_id: 'r79991'

      expect(parsed_response.data.class).to eq(Array)
      expect(parsed_response.data.first.type).to eq('track')
    end

    it 'returns an empty collection for a search returning no results' do
      get '/tracks', artist_id: 'foo'

      expect(parsed_response.data.class).to eq(Array)
      expect(parsed_response.data.count).to be(0)
    end
  end
end
