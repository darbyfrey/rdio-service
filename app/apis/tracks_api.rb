class TracksApi < Grape::API
  resource :tracks do
    desc 'Get a collection of tracks'
    params do
      requires :artist_id, type: String, desc: 'The id of the artists tracks to get'
    end
    get do
      tracks = RDIO.getTracksForArtist(artist: params.artist_id, count: 100)
      represent tracks.to_a, with: TrackRepresenter
    end
  end
end
