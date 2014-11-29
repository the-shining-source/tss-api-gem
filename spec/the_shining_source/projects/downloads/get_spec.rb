require 'spec_helper'

describe TheShiningSource::Projects::Downloads, '#get' do

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
  
  describe 'GET => /projects/{name}/downloads/{download}/' do
    
    before do
      stub_get('projects/shining-online/downloads/shining-online-demo-3b/', 'projects/downloads/download.json')
    end    
    
    it 'should get a single download' do
      @client.projects.downloads.find('shining-online', 'shining-online-demo-3b')
      expect(a_get('projects/shining-online/downloads/shining-online-demo-3b/')).
        to have_been_made
    end

    it 'should return a Download object' do
      download = @client.projects.downloads.get('shining-online', 'shining-online-demo-3b')
      expect(download).to be_a TheShiningSource::Download
      expect(download.name).to eq('Shining Online - Demo 3B')
    end

    it 'should support the `find` alias' do
      download = @client.projects.downloads.find('shining-online', 'shining-online-demo-3b')
      expect(download).to be_a TheShiningSource::Download
    end
    
  end

end
