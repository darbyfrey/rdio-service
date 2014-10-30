class ApplicationApi < Grape::API
  format :json

  helpers do
    def get_object_by_type(object_id, type_code)
      response = RDIO.get(keys: object_id)
      return nil unless response.present?

      album = response.send(response.keys.first)
      return nil unless album.type == type_code

      return album
    end
  end

  desc 'Root API path with a link to documentation'
  get do
    {
      documentation: 'https://github.com/bellycard/rdio-service'
    }
  end

  mount AlbumsApi
  mount PlaylistsApi
  mount PlaybackTokensApi
  mount SearchApi
  mount TracksApi
end
