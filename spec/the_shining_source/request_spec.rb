require 'spec_helper'

describe TheShiningSource::Request do
  
  class StubClass
    attr_accessor :format, :user_agent, :proxy, :connection_options, :endpoint
    attr_accessor :adapter, :access_token, :mime_type
    
    def initialize()
      @format = :json
      @endpoint = 'http://api.shiningsource.org/1.0/'
      @adapter = Faraday.default_adapter
    end
  end
  
  before(:all) do
    @stub = StubClass.new
    @stub.extend TheShiningSource::Request
    @stub.extend TheShiningSource::Connection
  end
  
  it 'should raise an exception for invalid HTTP methods' do
    expect { @stub.request(:invalid, '/', {}, {}) }.to raise_error(ArgumentError)
  end
  
  it "should be able to make GET requests" do
    stub_get('').to_return(body: '', headers: { content_type: 'text/plain' })
    
    @stub.get_request('/')
    expect(a_get('')).to have_been_made
  end
  
  it 'should be able to make POST requests' do
    stub_post('').to_return(body: '', headers: { content_type: 'text/plain' })
    
    @stub.post_request('/')
    expect(a_post('')).to have_been_made
  end
  
  it 'should be able to make PUT requests' do
    stub_put('').to_return(body: '', headers: { content_type: 'text/plain' })
    
    @stub.put_request('/')
    expect(a_put('')).to have_been_made
  end

  it 'should be able to make PATCH requests' do
    stub_patch('').to_return(body: '', headers: { content_type: 'text/plain' })
    
    @stub.patch_request('/')
    expect(a_patch('')).to have_been_made
  end
  
  it 'should be able to make DELETE requests' do
    stub_delete('').to_return(body: '', headers: { content_type: 'text/plain' })
    
    @stub.delete_request('/')
    expect(a_delete('')).to have_been_made
  end
    
end
