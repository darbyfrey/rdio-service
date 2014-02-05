class PlaybackTokensApi < Grape::API
  resource :playback_tokens do
    desc 'Creates a Playback Token'
    params do
      optional :domain, type: String, desc: 'The domain name of the app requesting the playback token'
    end
    post do
      if ENV['AIRPLANE_MODE'] == 'enabled'
        JSON.parse(File.read('spec/fixtures/playback_token.json'))
      else
        domain = params[:domain] || 'localhost'

        { token: RDIO.getPlaybackToken(domain: domain) }
      end
    end
  end
end
