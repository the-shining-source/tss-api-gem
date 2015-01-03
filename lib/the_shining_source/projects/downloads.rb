module TheShiningSource
  class Projects::Downloads < ApiBase

    ##
    # Get information about a single download for a project.
    def get(project, name)
      download = get_request("/projects/#{project}/downloads/#{name}/")
      TheShiningSource::Download.new(download)
    end
    alias_method :find, :get

    ##
    # Get all downloads for +project+.
    def list(project)
      downloads = get_request("/projects/#{project}/downloads/")
      downloads.map { |download| TheShiningSource::Download.new(download) }
    end
    alias_method :all, :list
    
  end
end
