module TheShiningSource
  module Response
    
    attr_accessor :pagination
    attr_accessor :meta

    def self.create(response_hash)
      data = response_hash.data.dup rescue response_hash
      data.extend(self)
      
      # [todo] - Do we even really need this?
      # data.instance_exec do
      #   @pagination = response_hash.pagination
      #   @meta = response_hash.meta
      # end
      
      data
    end

  end
end
