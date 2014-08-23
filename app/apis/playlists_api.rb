class PlaylistsApi < Grape::API
  helpers do
    def find_playlist(id)
      RDIO.getPlaylists(extras: 'trackKeys').values.flatten.select { |x| x['key'] == id }.first
    end
  end

  resource :playlists do
    desc 'Returns all available Playlists'
    get do
      playlists = RDIO.getPlaylists(extras: 'trackKeys')['owned']

      represent playlists, with: PlaylistRepresenter
    end

    desc 'Returns a playlist for a given id'
    get ':playlist_id' do
      playlist = find_playlist(params[:playlist_id])

      song_ids = playlist['trackKeys'].join(',')
      songs = RDIO.get(keys: song_ids).values

      playlist.merge!(id: playlist['key'], songs: songs)

      represent OpenStruct.new(playlist), with: PlaylistRepresenter, include_songs: true
    end
  end
end
