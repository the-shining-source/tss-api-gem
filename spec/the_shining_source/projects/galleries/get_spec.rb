require 'spec_helper'

describe TheShiningSource::Projects::Galleries, '#get' do

  before do
    @client = TheShiningSource::Client.new
  end

  describe 'GET => /projects/{name}/galleries/{gallery}/' do
    
    before do
      stub_get('projects/shining-online/galleries/old-pc-version/', 'projects/galleries/gallery.json')
    end    
    
    it 'retrieves a single gallery' do
      @client.projects.galleries.get('shining-online', 'old-pc-version')
      expect(a_get('projects/shining-online/galleries/old-pc-version/')).to have_been_made
    end

    it 'returns a Gallery object' do
      gallery = @client.projects.galleries.get('shining-online', 'old-pc-version')
      expect(gallery).to be_a TheShiningSource::Gallery
      expect(gallery.name).to eq('Old PC Version')
    end

    it 'supports the `find` alias' do
      @client.projects.galleries.find('shining-online', 'old-pc-version')
      expect(a_get('projects/shining-online/galleries/old-pc-version/')).to have_been_made
    end
    
    it 'supports the `find_by_slug` alias' do
      @client.projects.galleries.find_by_slug('shining-online', 'old-pc-version')
      expect(a_get('projects/shining-online/galleries/old-pc-version/')).to have_been_made
    end
    
  end

end
