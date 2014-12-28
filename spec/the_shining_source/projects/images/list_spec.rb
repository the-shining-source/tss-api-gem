require 'spec_helper'

describe TheShiningSource::Projects::Images, '#list' do

  before do 
    @client = TheShiningSource::Client.new
  end

  describe 'GET => /projects/{name}/images/' do
    
    before do
      stub_get('projects/shining-online/images/', 'projects/images/list.json')
    end

    it 'fetches images for a project' do
      @client.projects.images.list('shining-online')
      expect(a_get('projects/shining-online/images/')).to have_been_made
    end
    
    it 'returns an array of Image objects' do
      images = @client.projects.images.list('shining-online')
      expect(images).to be_a(Array)
      images.each do |image|
        expect(image).to be_a TheShiningSource::Image
      end
    end

    it 'supports the `all` alias' do
      @client.projects.images.all('shining-online')
      expect(a_get('projects/shining-online/images/')).to have_been_made
    end
    
  end

end
