class SongEntity < Grape::Entity
  root :data, :data

  expose  :radioKey,
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
end
