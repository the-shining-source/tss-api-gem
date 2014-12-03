module TheShiningSource

  ##
  # Holds information about a single Project
  class Project < EntityBase
    attr_accessor :id, :name, :url, :slug, :created, :modified, :last_update,
                  :homepage, :progress, :summary, :description,
                  :twitter_name, :facebook_page, :google_plus,
                  :banners, :galleries, :downloads, :team_members
  end
  
end
