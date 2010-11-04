require 'openstate'
require 'rspec'
require 'webmock/rspec'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include WebMock::API

  config.before(:each) do
    @api_base_uri = "openstates.sunlightlabs.com"
    @api_key = "1234567890"
    @api_base_path = "/api/v1"
    @options = {  :api_base_uri => @api_base_uri, 
                  :api_key => @api_key, 
                  :api_base_path => @api_base_path }
    @uri_path = "#{@api_base_uri}#{@api_base_path}"
    @responses_path = "#{File.dirname(__FILE__)}/responses"
  end
  
end
