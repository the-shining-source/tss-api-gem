require 'faraday_middleware'

module TheShiningSource
  module Connection
    private
    
    def connection(raw = false)
      
      options = {
        :headers => {'Accept' => "application/#{format}; charset=utf-8", 'User-Agent' => user_agent},
        :proxy   => proxy,
        :ssl     => {:verify => false},
        :url     => endpoint,
      }
      
      Faraday::Connection.new(options) do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use FaradayMiddleware::Mashify unless raw
        
        if format.to_s.downcase == 'json'
          connection.use FaradayMiddleware::ParseJson
          #connection.use FaradayMiddleware::Response::Parse
        end
      
        #connection.use FaradayMiddleware::RaiseHttpException
        connection.adapter(adapter)
      end
    end
  end
end
