require 'spec_helper'

describe TheShiningSource::EntityBase do

  class StubEntityClass < TheShiningSource::EntityBase
    attr_accessor :test_field
  end
  
  describe '#initialize' do
    
    it 'accepts a hash of options ' do
      StubEntityClass.new({})
    end

    it 'sets field values from constructor hash if field exists' do
      object = StubEntityClass.new(test_field: 'value')
      expect(object.test_field).to eq('value')
    end

    it 'does not attempt to set a field that does not exist' do
      StubEntityClass.new(invalid_field: 'value')
    end

  end

end
