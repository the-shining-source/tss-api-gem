module TheShiningSource
  class Projects::Downloads < ApiBase
    
    def get(project, name)
      get_request("/projects/#{project}/downloads/#{name}/")
    end
    alias :find :get
    
    def list(project)
      get_request("/projects/#{project}/downloads/")
    end
    alias :all :list
    
  end
end
