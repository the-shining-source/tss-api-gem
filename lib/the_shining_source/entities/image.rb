module TheShiningSource

  ##
  # Holds information about a single gallery image
  class Image < EntityBase
    attr_accessor :id, :name, :url, :slug, :created, :description,
                  :gallery_id, :width, :height, :mime
  end
  
end
