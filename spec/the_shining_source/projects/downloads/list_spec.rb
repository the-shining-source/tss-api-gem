require 'spec_helper'

describe TheShiningSource::Projects::Downloads, '#list' do

  before do 
    @client = TheShiningSource::Client.new
  end

  describe 'GET => /projects/{name}/downloads/' do
    
    before do
      stub_get('projects/shining-online/downloads/', 'projects/downloads/list.json')
    end

    it 'should get all downloads for a single project' do
      @client.projects.downloads.list('shining-online')
      expect(a_get('projects/shining-online/downloads/')).to have_been_made
    end
    
    it 'should return an array of Download objects' do
      downloads = @client.projects.downloads.list('shining-online')
      expect(downloads).to be_a(Array)
      downloads.each do |download|
        expect(download).to be_a TheShiningSource::Download
      end
    end

    it 'should support the `all` alias' do
      @client.projects.downloads.all('shining-online')
      expect(a_get('projects/shining-online/downloads/')).to have_been_made
    end
    
  end
  
end
