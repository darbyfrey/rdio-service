class ApplicationApi < Grape::API
  format :json

  mount AlbumsApi
  mount PlaylistsApi
  mount PlaybackTokensApi
  mount SearchApi
  mount TracksApi
end
