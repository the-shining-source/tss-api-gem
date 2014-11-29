module TheShiningSource

  ##
  # Functionality for making HTTP requests. Supports GET, POST, PUT, DELETE and
  # PATCH methods. 
  module Request

    METHODS = [:get, :post, :put, :delete, :patch]
    METHODS_WITH_BODIES = [:post, :put, :patch]

    
    def get_request(path, params = {}, options = {})
      request(:get, path, params, options)
    end

    def patch_request(path, params = {}, options = {})
      request(:patch, path, params, options)
    end

    def post_request(path, params = {}, options = {})
      request(:post, path, params, options)
    end

    def put_request(path, params = {}, options = {})
      request(:put, path, params, options)
    end

    def delete_request(path, params = {}, options = {})
      request(:delete, path, params, options)
    end

    ##
    # Make a HTTP request.
    def request(method, path, params, options)

      # Check the HTTP method us supported
      unless METHODS.include?(method)
        fail ArgumentError, "unknown HTTP method: #{method}"
      end

      # Open a connection
      conn = connection(options)
      path = (conn.path_prefix + path).gsub(/\/\//, '/') if conn.path_prefix != '/'
      
      response = conn.send(method) do |request|
        case method.to_sym
        when *(METHODS - METHODS_WITH_BODIES)
          request.body = params.delete('data') if params.key?('data')
          request.url(path, params)
        when *METHODS_WITH_BODIES
          request.path = path
          request.body = extract_data_from_params(params) unless params.empty?
        end
      end

      # Create a Response object from the body contents
      Response.create(response.body)
      
    end

    private

    def extract_data_from_params(params) # :nodoc:
      (params.key?('data') && !params['data'].nil?) ? params['data'] : params
    end

  end
end
