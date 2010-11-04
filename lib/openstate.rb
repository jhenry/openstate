require 'httparty'

class OpenState
  include HTTParty
  attr_reader :api_base_path

  def configure(options)
    @api_base_path = options[:api_base_path]
    
    self.class.default_params :apikey => options[:api_key]
    self.class.base_uri options[:api_base_uri]
    self.class.format :json
  end
end

require 'openstate/statemetadata'
require 'openstate/bill'
require 'openstate/legislator'
require 'openstate/committee'
