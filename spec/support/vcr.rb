VCR.configure do |c|
  c.cassette_library_dir = './spec/vcr'
  c.hook_into :fakeweb
  c.filter_sensitive_data('<RDIO_KEY>') { ENV['RDIO_KEY'] }
  c.filter_sensitive_data('<RDIO_SECRET>') { ENV['RDIO_SECRET'] }
  c.filter_sensitive_data('<RDIO_ACCESS_TOKEN>') { ENV['RDIO_ACCESS_TOKEN'] }
  c.filter_sensitive_data('<RDIO_ACCESS_SECRET>') { ENV['RDIO_ACCESS_SECRET'] }
  c.before_record do |i|
    i.request.headers.delete('authorization')

    u = URI.parse(i.request.uri)
    i.request.uri.sub!(/:\/\/.*#{Regexp.escape(u.host)}/, "://#{u.host}" )
  end
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].split(/\s+/, 2).join('/').underscore.gsub(/[^\w\/]+/, '_')
    options = example.metadata.slice(:record, :match_requests_on).except(:example_group)
    VCR.use_cassette(name, options) { example.call }
  end
end
