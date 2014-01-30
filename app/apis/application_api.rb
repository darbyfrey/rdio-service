class ApplicationApi < Grape::API
  format :json

  mount PlaylistsApi
end
