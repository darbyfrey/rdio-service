class AlbumsApi < Grape::API
  resource :albums do
    desc 'Get a collection of albums'
    params do
      requires :artist_id, type: String, desc: 'The id of the artists albums to get'
    end
    get do
      albums = RDIO.getAlbumsForArtist(artist: params.artist_id, count: 100)
      represent albums.to_a, with: AlbumRepresenter
    end
  end
end
