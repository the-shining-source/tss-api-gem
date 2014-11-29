module TheShiningSource
  class Projects < ApiBase
    extend Autoloader

    autoload_all 'the_shining_source/projects',
      Downloads: 'downloads',
      Galleries: 'galleries',
      Activity:  'activity'
    
    def initialize(options = {})
      super(options)
    end
    
    def activity
      @activity ||= ApiFactory.new 'Projects::Activity'
    end
    
    def downloads
      @downloads ||= ApiFactory.new 'Projects::Downloads'
    end
    
    def galleries
      @galleries ||= ApiFactory.new 'Projects::Galleries'
    end
    
    def get(project_name, params = {})
      get_request("/projects/#{project_name}/", params)
    end
    alias_method :find, :get
    alias_method :find_by_slug, :get
    
    def list(params = {})
      get_request('/projects/', params)
    end
    alias_method :all, :list
    
  end
end
