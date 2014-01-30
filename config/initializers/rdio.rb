RDIO = RdioApi.new(
  consumer_key: ENV['RDIO_KEY'],
  consumer_secret: ENV['RDIO_SECRET'],
  access_token: ENV['RDIO_ACCESS_TOKEN'],
  access_secret: ENV['RDIO_ACCESS_SECRET']
)
