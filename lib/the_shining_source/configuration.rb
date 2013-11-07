require 'faraday'

module TheShiningSource
  
  module Configuration
    
    # Array of valid options
    VALID_OPTIONS_KEYS = [
      :adapter,
      :access_token,
      :endpoint,
      :format,
      :user_agent,
      :proxy,
      :connection_options,
      :mime_type
    ].freeze
    
    DEFAULT_ADAPTER            = Faraday.default_adapter
    DEFAULT_ACCESS_TOKEN       = nil
    DEFAULT_ENDPOINT           = 'http://api.shiningsource.org/1.0/'.freeze
    DEFAULT_FORMAT             = :json
    DEFAULT_USER_AGENT         = "TSS Ruby Gem #{TheShiningSource::VERSION::STRING}".freeze
    DEFAULT_PROXY              = nil
    DEFAULT_MIME_TYPE          = :json
    DEFAULT_CONNECTION_OPTIONS = {}
    
    DEFAULT_PROJECT            = nil

    attr_accessor *VALID_OPTIONS_KEYS
    
    def self.extended(base)
      base.reset
    end
    
    def configure
      yield self
    end
    
    def options
      options = {}
      VALID_OPTIONS_KEYS.each { |k| options[k] = send(k) }
      options
    end
    
    def reset
      self.adapter            = DEFAULT_ADAPTER
      self.access_token       = DEFAULT_ACCESS_TOKEN
      self.endpoint           = DEFAULT_ENDPOINT
      self.format             = DEFAULT_FORMAT
      self.user_agent         = DEFAULT_USER_AGENT
      self.proxy              = DEFAULT_PROXY
      self.connection_options = DEFAULT_CONNECTION_OPTIONS
      self.mime_type          = DEFAULT_MIME_TYPE
    end
 
  end
  
end
