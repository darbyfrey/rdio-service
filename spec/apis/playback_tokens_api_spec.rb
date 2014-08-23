require 'spec_helper'

def app
  ApplicationApi
end

describe PlaybackTokensApi do
  include Rack::Test::Methods

  describe 'POST to create a playback token', :vcr do
    it 'returns a playback token when given a domain param' do
      post '/playback_tokens'

      expect(parsed_response.data.domain).to eq('localhost')
      expect(parsed_response.data.playback_token).to be_present
    end

    it 'returns a playback token when no domain param is supplied' do
      post '/playback_tokens', domain: 'foo.com'

      expect(parsed_response.data.domain).to eq('foo.com')
      expect(parsed_response.data.playback_token).to be_present
    end
  end
end
