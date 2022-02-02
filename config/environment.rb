require "bundler/setup"
require "date"
Bundler.require(:default, :development)

Dotenv.load

require_relative "../data/api_call"
require_relative "../lib/legislator"
require_relative "../lib/vote"
require_relative "../lib/state"
require_relative "../lib/cli"

