require 'spec_helper'

describe TheShiningSource::Projects, '#get' do
  let(:client) { TheShiningSource::Client.new }
  
  describe 'GET => /projects/' do
    
    before do
      stub_get('projects/shining-online/', 'projects/project.json')
    end    
    
    it 'should get a single project' do
      client.projects.get('shining-online')
      expect(a_get('projects/shining-online/')).to have_been_made
    end
    
    it 'should return information about the found project' do
      project = client.projects.get('shining-online')
      expect(project['name']).to eq('Shining Online')
    end

    it 'should support the `find` alias' do
      client.projects.find('shining-online')
      expect(a_get('projects/shining-online/')).to have_been_made
    end

    it 'should support the `find_by_slug` alias' do
      client.projects.find_by_slug('shining-online')
      expect(a_get('projects/shining-online/')).to have_been_made
    end

  end  
  
end
