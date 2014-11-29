module TheShiningSource

  ##
  # Holds information about a single Gallery
  class Gallery
    attr_accessor :id, :name, :url, :slug, :created, :description,
                  :project, :images

    ##
    # Create a new Gallery object from +data+ hash
    def initialize(data = {})
      data.each { |key, value| send("#{key}=".downcase, value) }
    end
    
  end
  
end
