require 'spec_helper'

describe TheShiningSource::Projects::Commits, '#get' do

  before do 
    @client = TheShiningSource::Client.new
  end

  describe 'GET => /projects/{name}/commits/{id}/' do
    
    before do
      stub_get('projects/shining-online/commits/122/', 'projects/commits/get.json')
    end

    it 'retrieves a single commit for a project' do
      @client.projects.commits.get('shining-online', 122)
      expect(a_get('projects/shining-online/commits/122/')).to have_been_made
    end
    
    it 'returns a Commit object' do
      commit = @client.projects.commits.get('shining-online', 122)
      expect(commit).to be_a TheShiningSource::Commit
    end

    it 'supports the `find` alias' do
      @client.projects.commits.find('shining-online', 122)
      expect(a_get('projects/shining-online/commits/122/')).to have_been_made
    end

  end
  
end
