require 'spec_helper'

describe TheShiningSource::Projects::Downloads, '#get' do

  before do 
    @client = TheShiningSource::Client.new
  end

  describe 'GET => /projects/{name}/downloads/' do
    
    before do
      stub_get('projects/shining-online/downloads/shining-online-demo-3b/', 'projects/downloads/download.json')
    end    
    
    it 'should get a single download' do
      @client.projects.downloads.find('shining-online', 'shining-online-demo-3b')
      expect(a_get('projects/shining-online/downloads/shining-online-demo-3b/')).
        to have_been_made
    end

    it "should return information about the found download" do
      download = @client.projects.downloads.find('shining-online', 'shining-online-demo-3b')
      expect(download['name']).to eq('Shining Online - Demo 3B')
    end
    
  end  
  
end
