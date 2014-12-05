module TheShiningSource

  class EntityBase

    ##
    # Create a new entity object from +data+ hash
    def initialize(data = {})
      data.each do |key, value|
        method = "#{key}=".downcase
        send(method, value) if respond_to? method
      end
    end
 
  end
  
end
