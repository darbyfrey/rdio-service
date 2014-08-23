require 'spec_helper'

def app
  ApplicationApi
end

describe AlbumsApi do
  include Rack::Test::Methods

  describe 'GET to search for an album with an artist_id', :vcr do
    it 'returns a collection of objects for the given search' do
      get '/albums', artist_id: 'r79991'

      expect(parsed_response.data.class).to eq(Array)
      expect(parsed_response.data.first.type).to eq('album')
    end

    it 'returns an empty collection for a search returning no results' do
      get '/albums', artist_id: 'foo'

      expect(parsed_response.data.class).to eq(Array)
      expect(parsed_response.data.count).to be(0)
    end
  end
end
