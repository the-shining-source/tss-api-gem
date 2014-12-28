module TheShiningSource
  class Projects::Images < ApiBase

    ##
    # Get a single image for a project
    def get(project, name)
      image = get_request("/projects/#{project}/images/#{name}/")
      TheShiningSource::Image.new(image)
    end
    alias_method :find, :get
    alias_method :find_by_slug, :get

    ##
    # Get all galleries for +project+.
    def list(project)
      images = get_request("/projects/#{project}/images/")
      images.map { |image| TheShiningSource::Image.new(image) }
    end
    alias_method :all, :list

  end
end
