class PlaybackTokensApi < Grape::API
  resource :playback_tokens do
    desc 'Get a playback token'
    params do
      optional :domain, type: String, desc: 'The domain name of the app requesting the playback token'
    end
    post do
      domain = params[:domain] || 'localhost'

      token = OpenStruct.new(
        playback_token: RDIO.getPlaybackToken(domain: domain),
        domain: domain
      )

      represent token, with: PlaybackTokenRepresenter
    end
  end
end
