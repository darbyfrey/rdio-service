class PlaylistEntity < Grape::Entity
  root :data, :data

  expose  :id,
          :ownerKey,
          :name,
          :url,
          :ownerIcon,
          :owner,
          :shortUrl,
          :length,
          :baseIcon,
          :ownerUrl,
          :embedUrl,
          :type,
          :icon

  expose :songs, using: SongEntity, if: { type: :full }
end
