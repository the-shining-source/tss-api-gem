module TheShiningSource
  class Projects < ApiBase
    extend Autoloader

    autoload_all 'the_shining_source/projects',
                 Downloads: 'downloads',
                 Galleries: 'galleries',
                 Images:    'images',
                 Commits:   'commits'
               
    ##
    # Get information about a single project by the slug +project_name+.
    def get(project_name)
      response = get_request("/projects/#{project_name}/")
      TheShiningSource::Project.new(response)
    end
    alias_method :find, :get
    alias_method :find_by_slug, :get

    ##
    # Get information about all projects on the site.
    def list(params = {})
      response = get_request('/projects/', params)
      response.map { |project| TheShiningSource::Project.new(project) }
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
    # Get the project images helper
    def images
      @images ||= ApiFactory.new 'Projects::Images'
    end

    ##
    # Get the project commits helper
    def commits
      @commits ||= ApiFactory.new 'Projects::Commits'
    end

    ##
    # Create a new Projects api helper
    def initialize(options = {})
      super(options)
    end

  end
end
