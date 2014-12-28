require 'spec_helper'

describe TheShiningSource::Projects::Images, '#get' do

  before do
    @client = TheShiningSource::Client.new
  end

  describe 'GET => /projects/{name}/images/{image}/' do
    
    before do
      stub_get('projects/shining-online/images/pc-shot-8/', 'projects/images/get.json')
    end    
    
    it 'retrieves a single image for a project' do
      @client.projects.images.get('shining-online', 'pc-shot-8')
      expect(a_get('projects/shining-online/images/pc-shot-8/')).to have_been_made
    end

    it 'returns an Image object' do
      image = @client.projects.images.get('shining-online', 'pc-shot-8')
      expect(image).to be_a TheShiningSource::Image
      expect(image.name).to eq('PC - Shot 8')
    end

    it 'should support the `find` alias' do
      @client.projects.images.find('shining-online', 'pc-shot-8')
      expect(a_get('projects/shining-online/images/pc-shot-8/')).to have_been_made
    end
    
    it 'should support the `find_by_slug` alias' do
      @client.projects.images.find_by_slug('shining-online', 'pc-shot-8')
      expect(a_get('projects/shining-online/images/pc-shot-8/')).to have_been_made
    end
    
  end

end
