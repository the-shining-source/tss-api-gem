module TheShiningSource
  class Projects::Galleries < ApiBase

    ##
    # Get a single gallery for a project
    def get(project, name)
      gallery = get_request("/projects/#{project}/galleries/#{name}/")
      TheShiningSource::Gallery.new(gallery)
    end
    alias_method :find, :get
    alias_method :find_by_slug, :get

    ##
    # Get all galleries for +project+.
    def list(project)
      galleries = get_request("/projects/#{project}/galleries/")
      galleries.map { |gallery| TheShiningSource::Gallery.new(gallery) }
    end
    alias_method :all, :list

  end
end
