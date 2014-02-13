class SongEntity < Grape::Entity
  root :data, :data

  expose  :id,
          :radioKey,
          :baseIcon,
          :artistUrl,
          :duration,
          :album,
          :albumUrl,
          :shortUrl,
          :albumArtist,
          :canStream,
          :embedUrl,
          :trackNum,
          :albumArtistKey,
          :icon,
          :name,
          :artistKey,
          :url,
          :icon400,
          :artist,
          :albumKey

  def id
    self.object['key']
  end
end
