require 'spec_helper'

describe TheShiningSource::Projects, '#get' do
  let(:client) { TheShiningSource::Client.new }
  
  describe 'GET => /projects/' do
    
    before do
      stub_get('projects/shining-online/', 'projects/project.json')
    end    
    
    it 'makes a call to the "projects" endpoint' do
      client.projects.get('shining-online')
      expect(a_get('projects/shining-online/')).to have_been_made
    end
    
    it 'returns a single project entity' do
      project = client.projects.get('shining-online')
      expect(project).to be_a(TheShiningSource::Project)
    end

    it 'supports the `find` alias' do
      client.projects.find('shining-online')
      expect(a_get('projects/shining-online/')).to have_been_made
    end

    it 'supports the `find_by_slug` alias' do
      client.projects.find_by_slug('shining-online')
      expect(a_get('projects/shining-online/')).to have_been_made
    end

  end  
  
end
