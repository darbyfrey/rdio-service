class TrackRepresenter < RdioRepresenter
  property :object_type, getter: 'track'
  property :id, exec_context: :decorator
  property :base_icon
  property :can_download_album_only
  property :artist_url
  property :duration
  property :album
  property :is_clean
  property :album_url
  property :short_url
  property :album_artist
  property :can_stream
  property :embed_url
  property :type, exec_context: :decorator
  property :grid_icon
  property :price
  property :track_num
  property :albumArtistKey, as: :album_artist_key
  property :radioKey, as: :radio_id
  property :icon
  property :can_sample
  property :name
  property :is_explicit
  property :artist
  property :url
  property :icon400
  property :artistKey, as: :artist_id
  property :can_download
  property :length
  property :can_tether
  property :albumKey
end
