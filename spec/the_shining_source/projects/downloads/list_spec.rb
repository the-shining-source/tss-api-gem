require 'spec_helper'

describe TheShiningSource::Projects::Downloads, '#list' do

  before do 
    @client = TheShiningSource::Client.new
  end
  
  describe 'GET => /projects/{name}/downloads/' do
    
    before do
      stub_get('projects/shining-online/downloads/', 'projects/downloads/list.json')
    end    
    
    it 'should get a list of downloads for a project' do
      @client.projects.downloads.list('shining-online')
      expect(a_get('projects/shining-online/downloads/')).to have_been_made
    end
    
    it 'should fetch an array of downloads for a project' do
      downloads = @client.projects.downloads.list('shining-online')
      expect(downloads).to be_a(Array)
    end
    
  end  
  
end
