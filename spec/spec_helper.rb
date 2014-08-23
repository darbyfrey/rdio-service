ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'simplecov'
require 'napa/rspec_extensions/response_helpers'

SimpleCov.start do
  add_filter "/spec\/.*/"
  add_filter "/vendor\/.*/"
end

require './app'

SimpleCov.start do
  add_filter "/spec\/.*/"
  add_filter "/vendor\/.*/"
end

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.include Napa::RspecExtensions::ResponseHelpers
end