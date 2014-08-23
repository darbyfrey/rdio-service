class AlbumsApi < Grape::API
  resource :albums do
    desc 'Get a collection of albums for a given artist_id'
    params do
      requires :artist_id, type: String, desc: 'The id of the artists albums to get'
    end
    get do
      albums = RDIO.getAlbumsForArtist(artist: params.artist_id, count: 100)
      represent albums.to_a, with: AlbumRepresenter
    end

    desc 'Get an album for the given album_id'
    get ':album_id' do
      album = get_object_by_type(params.album_id, 'a')
      return status 404 if album.nil?
      represent OpenStruct.new(album), with: AlbumRepresenter
    end
  end
end
