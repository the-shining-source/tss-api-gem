module TheShiningSource
  class Projects < ApiBase
    extend Autoloader
    
    def initialize(options = {})
      super(options)
    end
    
    def get(project_name, params={})
      get_request("/projects/#{project_name}/", params)
    end
    alias :find :get
    alias :find_by_slug :get
    
    def list(params = {})
      get_request("/projects/", params)
    end
    alias :all :list
    
  end
end
