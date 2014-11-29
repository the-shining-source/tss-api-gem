module TheShiningSource
  module Autoloader
    
    def autoload_all(prefix, options)
      options.each do |const_name, path|
        autoload const_name, File.join(prefix, path)
      end
    end
    
  end
end
