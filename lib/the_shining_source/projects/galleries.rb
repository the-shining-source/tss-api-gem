module TheShiningSource
  class Projects::Galleries < ApiBase
    
    def get(project, name)
      get_request("/projects/#{project}/galleries/#{name}/")
    end
    alias :find :get
    
  end
end
