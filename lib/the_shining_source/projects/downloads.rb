module TheShiningSource
  class Projects::Downloads < ApiBase
    
    def get(project, name)
      download = get_request("/projects/#{project}/downloads/#{name}/")
      TheShiningSource::Download.new(download)
    end
    alias_method :find, :get
    
    def list(project)
      downloads = get_request("/projects/#{project}/downloads/")
      downloads.map { |download| TheShiningSource::Download.new(download) }
    end
    alias_method :all, :list
    
  end
end
