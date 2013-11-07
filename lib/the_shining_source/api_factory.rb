require 'the_shining_source/core_ext/hash'

module TheShiningSource
  class ApiFactory
    
    def self.new(klass, options={})
      return create_instance(klass, options) if klass
      raise ArgumentError, 'must provide a klass to be instantiated'
    end
    
    def self.create_instance(klass, options)
      options.symbolize_keys!
      instance = convert_to_constant(klass.to_s).new options
      TheShiningSource.client = instance
      instance
    end
    
    def self.convert_to_constant(classes)
      constant = TheShiningSource
      classes.split('::').each do |klass|
        constant = constant.const_get klass
      end
      return constant
    end
    
  end
end
