require 'spec_helper'

describe TheShiningSource::Projects::Downloads, '#get' do

  before do 
    @client = TheShiningSource::Client.new
  end

  describe 'GET => /projects/{name}/downloads/{download}/' do
    
    before do
      stub_get('projects/shining-online/downloads/shining-online-demo-3b/', 'projects/downloads/download.json')
    end    
    
    it 'retrieves a single download' do
      @client.projects.downloads.get('shining-online', 'shining-online-demo-3b')
      expect(a_get('projects/shining-online/downloads/shining-online-demo-3b/')).
        to have_been_made
    end

    it 'returns a Download object' do
      download = @client.projects.downloads.get('shining-online', 'shining-online-demo-3b')
      expect(download).to be_a TheShiningSource::Download
      expect(download.name).to eq('Shining Online - Demo 3B')
    end

    it 'supports the `find` alias' do
      download = @client.projects.downloads.find('shining-online', 'shining-online-demo-3b')
      expect(download).to be_a TheShiningSource::Download
    end
    
  end

end
