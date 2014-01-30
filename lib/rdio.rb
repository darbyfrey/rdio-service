class Rdio
  def self.grant_access
    oauth_options = {
      site:               'http://api.rdio.com',
      scheme:             :header,
      http_method:        :post,
      request_token_path: '/oauth/request_token',
      access_token_path:  '/oauth/access_token',
      authorize_path:     '/oauth/authorize'
    }

    connection = OAuth::Consumer.new(ENV['RDIO_KEY'], ENV['RDIO_SECRET'], oauth_options)

    request_token = connection.get_request_token
    Launchy.open request_token.authorize_url.gsub(/api.rdio.com/, 'www.rdio.com')

    puts "What's the value of `oauth_verifier`?"

    oauth_verifier = gets.chomp
    access_token = request_token.get_access_token(oauth_verifier: oauth_verifier)

    puts "SUCCESS! Now, add these values to your .env file:\n\n"

    puts "RDIO_ACCESS_TOKEN=#{access_token.token}\n"
    puts "RDIO_ACCESS_SECRET=#{access_token.secret}\n"

    puts "\n\n"
  end
end
