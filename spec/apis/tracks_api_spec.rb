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

  describe 'GET a track by track_id', :vcr do
    it 'returns a track object for a valid track_id' do
      get '/tracks/t4075432'
      expect(parsed_response.data.type).to eq('track')
      expect(parsed_response.data.album).to eq('Forgiveness Rock Record')
      expect(parsed_response.data.name).to eq('World Sick')
      expect(parsed_response.data.artist).to eq('Broken Social Scene')
    end

    it 'returns a 404 when the track_id is not found' do
      get '/tracks/t99999999'
      expect(last_response.status).to eq(404)
    end

    it 'returns a 404 when given a different type of object_id' do
      get '/tracks/a329934'
      expect(last_response.status).to eq(404)
    end
  end
end
