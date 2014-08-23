class PlaylistRepresenter < RdioRepresenter
  property :object_type, getter: 'playlist'
  property :id, exec_context: :decorator
  property :name
  property :url
  property :owner_icon
  property :owner
  property :short_url
  property :length
  property :base_icon
  property :owner_url
  property :embed_url
  property :type
  property :icon

  collection :songs, extend: TrackRepresenter, if: -> (opts) { opts[:include_tracks] }
end
