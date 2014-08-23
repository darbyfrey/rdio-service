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

  describe 'GET an album by album_id', :vcr do
    it 'returns an album object for a valid album_id' do
      get '/albums/a329934'
      expect(parsed_response.data.type).to eq('album')
      expect(parsed_response.data.name).to eq('Forgiveness Rock Record')
      expect(parsed_response.data.artist).to eq('Broken Social Scene')
    end

    it 'returns a 404 when the album_id is not found' do
      get '/albums/a99999999'
      expect(last_response.status).to eq(404)
    end

    it 'returns a 404 when given a different type of object_id' do
      get '/albums/t4075432'
      expect(last_response.status).to eq(404)
    end
  end
end
