module TheShiningSource

  ##
  # Holds information about a single Download
  class Download < EntityBase
    attr_accessor :id, :name, :icon, :url, :slug, :created, :summary,
                  :description, :downloads, :size, :download_url, :platform
  end
  
end
