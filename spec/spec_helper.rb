require 'vcr'
require 'dotenv'
require 'timecop'

Dotenv.load

require 'coveralls'
Coveralls.wear_merged!

$:.unshift File.dirname(__FILE__)+'../lib'

VCR.configure do |c|
  # Automatically filter all secure details that are stored in the environment
  [
      'METRICS_API_USERNAME',
      'METRICS_API_PASSWORD'
  ].each do |env_var|
    c.filter_sensitive_data("<#{env_var}>") { ENV[env_var] }
  end


  c.cassette_library_dir     = 'spec/cassettes'
  c.default_cassette_options = { :record => :once }
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered                = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end