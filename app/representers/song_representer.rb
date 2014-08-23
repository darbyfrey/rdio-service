class SongRepresenter < Napa::Representer
  property :object_type, getter: 'song'
  property :id, getter: Proc.new { self['key'] }, type: String
  property :radioKey
  property :baseIcon
  property :artistUrl
  property :duration
  property :album
  property :albumUrl
  property :shortUrl
  property :albumArtist
  property :canStream
  property :embedUrl
  property :trackNum
  property :albumArtistKey
  property :icon
  property :name
  property :artistKey
  property :url
  property :icon400
  property :artist
  property :albumKey
end
