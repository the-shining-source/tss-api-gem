require 'spec_helper'

describe TheShiningSource::Client do
  let(:client) { TheShiningSource::Client.new }
  
  describe '#initialize' do
    
    it 'should accept a hash of options ' do
      
      client = TheShiningSource::Client.new(
        access_token: '123456',
        endpoint: 'test-endpoint',
        format: 'xml',
        user_agent: 'some-agent',
        proxy: 'localhost'
      )
      
      expect(client.access_token).to eq('123456')
      expect(client.endpoint).to eq('test-endpoint')
      expect(client.format).to eq('xml')
      expect(client.user_agent).to eq('some-agent')
      expect(client.proxy).to eq('localhost')
      
    end
    
  end

  it 'should return a TheShiningSource::Projects instance' do
    expect(client.projects).to be_a TheShiningSource::Projects
  end
end
