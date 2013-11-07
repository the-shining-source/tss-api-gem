module TheShiningSource
  class Projects::Downloads < ApiBase
    
    def get(project, name)
      get_request("/projects/#{project}/downloads/#{name}/")
    end
    alias :find :get
    
  end
end
