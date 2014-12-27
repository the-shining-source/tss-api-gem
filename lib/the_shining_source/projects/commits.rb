module TheShiningSource
  class Projects::Commits < ApiBase
    
    def get(project, id)
      commit = get_request("/projects/#{project}/commits/#{id}/")
      TheShiningSource::Commit.new(commit)
    end
    alias_method :find, :get

    ##
    # List 
    def list(project, args = {})
      arg_string = URI.encode_www_form(args)
      commits = get_request("/projects/#{project}/commits/?#{arg_string}")
      commits.map { |commit| TheShiningSource::Commit.new(commit) }
    end
    alias_method :all, :list
    
  end
end
