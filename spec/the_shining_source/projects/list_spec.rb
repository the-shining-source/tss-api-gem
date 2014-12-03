require 'spec_helper'

describe TheShiningSource::Projects, '#index' do

  before do 
    @client = TheShiningSource::Client.new
  end

  describe 'GET => /projects/' do
    
    before do
      stub_get('projects/', 'projects/index.json')
    end    
    
    it 'makes a call to fetch all projects' do
      @client.projects.list
      expect(a_get('projects/')).to have_been_made
    end

    it 'returns an array of project objects' do
      projects = @client.projects.list
      expect(projects).to be_a(Array)
      projects.each do |project|
        expect(project).to be_a(TheShiningSource::Project)
      end
    end

    it 'accepts the `all` alias' do
      @client.projects.all
      expect(a_get('projects/')).to have_been_made
    end

    
  end  
  
end
