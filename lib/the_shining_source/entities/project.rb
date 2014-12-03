module TheShiningSource

  ##
  # Holds information about a single Project
  class Project < EntityBase
    attr_accessor :id, :name, :url, :slug, :created, :modified, :last_update,
                  :homepage, :progress, :summary, :description, :banners,
                  :downloads, :team_members
  end
  
end
