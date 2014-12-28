require 'spec_helper'

describe TheShiningSource::Projects::Galleries, '#list' do

  before do 
    @client = TheShiningSource::Client.new
  end

  describe 'GET => /projects/{name}/galleries/' do
    
    before do
      stub_get('projects/shining-online/galleries/', 'projects/galleries/list.json')
    end

    it 'should get all galleries for a single project' do
      @client.projects.galleries.list('shining-online')
      expect(a_get('projects/shining-online/galleries/')).to have_been_made
    end
    
    it 'should return an array of Gallery objects' do
      galleries = @client.projects.galleries.list('shining-online')
      expect(galleries).to be_a(Array)
      galleries.each do |gallery|
        expect(gallery).to be_a TheShiningSource::Gallery
      end
    end

    it 'should support the `all` alias' do
      @client.projects.galleries.all('shining-online')
      expect(a_get('projects/shining-online/galleries/')).to have_been_made
    end
    
  end

end
