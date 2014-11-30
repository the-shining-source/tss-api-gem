module TheShiningSource

  class EntityBase

    ##
    # Create a new entity object from +data+ hash
    def initialize(data = {})
      data.each { |key, value| send("#{key}=".downcase, value) }
    end
 
  end
  
end
