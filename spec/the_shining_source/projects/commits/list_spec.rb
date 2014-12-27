require 'spec_helper'

describe TheShiningSource::Projects::Commits, '#list' do

  before do 
    @client = TheShiningSource::Client.new
  end

  describe 'GET => /projects/{name}/commits/' do
    
    before do
      stub_get('projects/shining-online/commits/', 'projects/commits/list.json')
    end

    it 'retrieves latest commits for a single project' do
      @client.projects.commits.list('shining-online')
      expect(a_get('projects/shining-online/commits/')).to have_been_made
    end
    
    it 'returns an array of Commit objects' do
      commits = @client.projects.commits.list('shining-online')
      expect(commits).to be_a(Array)
      commits.each do |commit|
        expect(commit).to be_a TheShiningSource::Commit
      end
    end

    it 'supports the `all` alias' do
      @client.projects.commits.all('shining-online')
      expect(a_get('projects/shining-online/commits/')).to have_been_made
    end
    
    it 'appends query arguments if passed' do
      stub_get('projects/shining-online/commits/?limit=10', 'projects/commits/list.json')
      @client.projects.commits.list('shining-online', limit: 10)
      expect(a_get('projects/shining-online/commits/?limit=10')).to have_been_made
    end

  end
  
end
