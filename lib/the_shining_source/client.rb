module TheShiningSource
  
  ##
  # The main TSS client
  class Client < ApiBase
    
    def projects(options = {})
      @projects ||= ApiFactory.new 'Projects', options
    end
    
  end
  
end
