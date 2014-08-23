class TracksApi < Grape::API
  resource :tracks do
    desc 'Get a collection of tracks for a given artist_id'
    params do
      requires :artist_id, type: String, desc: 'The id of the artists tracks to get'
    end
    get do
      tracks = RDIO.getTracksForArtist(artist: params.artist_id, count: 100)
      represent tracks.to_a, with: TrackRepresenter
    end

    desc 'Get a track for the given track_id'
    get ':track_id' do
      track = get_object_by_type(params.track_id, 't')
      return status 404 if track.nil?
      represent OpenStruct.new(track), with: TrackRepresenter
    end
  end
end
