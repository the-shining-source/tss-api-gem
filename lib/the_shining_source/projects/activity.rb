module TheShiningSource
  class Projects::Activity < ApiBase
    
    def get(project)
      get_request("/projects/#{project}/activity/")
    end
    alias :find :get
    
  end
end
