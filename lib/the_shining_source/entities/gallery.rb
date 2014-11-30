module TheShiningSource

  ##
  # Holds information about a single Gallery
  class Gallery < EntityBase
    attr_accessor :id, :name, :url, :slug, :created, :description,
                  :project, :images
  end
  
end
