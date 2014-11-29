module TheShiningSource

  ##
  # Holds information about a single Download
  class Download
    attr_accessor :id, :name, :icon, :url, :slug, :created, :summary,
                  :description, :downloads, :size, :download_url, :platform

    ##
    # Create a new Download object from +data+ hash
    def initialize(data = {})
      data.each { |key, value| send("#{key}=".downcase, value) }
    end
    
  end
  
end
