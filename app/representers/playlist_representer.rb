class PlaylistRepresenter < Napa::Representer
  property :object_type, getter: 'playlist'
  property :id, getter: Proc.new { self['key'] }, type: String
  property :ownerKey
  property :name
  property :url
  property :ownerIcon
  property :owner
  property :shortUrl
  property :length
  property :baseIcon
  property :ownerUrl
  property :embedUrl
  property :type
  property :icon

  collection :songs, extend: SongRepresenter, if: -> (opts) { opts[:include_songs] }
end
