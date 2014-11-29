require 'the_shining_source/connection'
require 'the_shining_source/response'
require 'the_shining_source/request'

module TheShiningSource
  class ApiBase
    include Connection
    include Request
    
    attr_accessor *Configuration::VALID_OPTIONS_KEYS
    
    # Creates a new API
    def initialize(options = {})
      options = TheShiningSource.options.merge(options)
      TheShiningSource::Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
    
  end
end
