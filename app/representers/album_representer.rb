class AlbumRepresenter < RdioRepresenter
  property :object_type, getter: 'album'
  property :id, exec_context: :decorator
  property :base_icon
  property :release_date
  property :display_date
  property :duration
  property :is_clean
  property :short_url
  property :can_stream
  property :embed_url
  property :type, exec_context: :decorator
  property :price
  property :icon
  property :can_sample
  property :name
  property :is_explicit
  property :artist
  property :url
  property :artistKey, as: :artist_id
  property :length
  property :can_tether
  property :artist_url
  property :trackKeys, as: :track_ids
end
