module TheShiningSource
  class Projects < ApiBase
    extend Autoloader

    autoload_all 'the_shining_source/projects',
      Downloads: 'downloads',
      Galleries: 'galleries'

    ##
    # Get information about a single project by the slug +project_name+.
    def get(project_name)
      get_request("/projects/#{project_name}/")
    end
    alias_method :find, :get
    alias_method :find_by_slug, :get

    ##
    # Get information about all projects on the site.
    def list(params = {})
      get_request('/projects/', params)
    end
    alias_method :all, :list
    
    ##
    # Get the project downloads helper
    def downloads
      @downloads ||= ApiFactory.new 'Projects::Downloads'
    end
    
    ##
    # Get the project galleries helper
    def galleries
      @galleries ||= ApiFactory.new 'Projects::Galleries'
    end

    ##
    # Create a new Projects api helper
    def initialize(options = {})
      super(options)
    end

  end
end
