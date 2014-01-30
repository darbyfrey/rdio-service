# load bundler
require 'bundler/setup'
Bundler.setup(:default)
require 'napa'
Bundler.require(:default, Napa.env.to_sym)
require 'active_support'
require 'active_support/dependencies'

# load environment
Dotenv.load(Napa.env.test? ? '.env.test' : '.env')

# autoload initalizers
Dir['./config/initializers/**/*.rb'].map { |file| require file }

# load middleware configs
Dir['./config/middleware/**/*.rb'].map { |file| require file }

# autoload app
relative_load_paths = %w[app/apis app/entities app/models lib]
ActiveSupport::Dependencies.autoload_paths += relative_load_paths
