require 'the_shining_source/version'
require 'the_shining_source/configuration'
require 'the_shining_source/autoloader'

require 'the_shining_source/entities/entity_base'
require 'the_shining_source/entities/download'
require 'the_shining_source/entities/gallery'

module TheShiningSource
  extend Configuration
  extend Autoloader
  
  class << self
    
    attr_accessor :client
    
    ##
    # Create and return a new client
    def new(options = {}, &block)
      @client = TheShiningSource::Client.new(options, &block)
    end
    
    # Delegate to Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end
    
    # Delegate to Client
    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
    
  end
  
  ##
  # Autoload files
  autoload_all 'the_shining_source',
    ApiBase:    'api_base',
    ApiFactory: 'api_factory',
    Client:     'client',
    Projects:   'projects'
  
end
