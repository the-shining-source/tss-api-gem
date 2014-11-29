require 'spec_helper'

describe TheShiningSource::ApiFactory do
  
  context '#new' do
    it 'throws an error if klass type is ommitted' do
      expect { described_class.new nil }.to raise_error(ArgumentError)
    end
    
    it 'instantiates a new object if valid class is used' do
      expect(described_class.new('Projects')).to be_a TheShiningSource::Projects
    end
  end
  
end
