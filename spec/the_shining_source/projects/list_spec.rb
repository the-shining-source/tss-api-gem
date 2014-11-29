require 'spec_helper'

describe TheShiningSource::Projects, '#index' do

  before do 
    @client = TheShiningSource::Client.new
  end

  describe 'GET => /projects/' do
    
    before do
      stub_get('projects/', 'projects/index.json')
    end    
    
    it 'should get a list of projects' do
      @client.projects.list
      expect(a_get('projects/')).to have_been_made
    end

    it 'should fetch an array of projects' do
      projects = @client.projects.list
      expect(projects).to be_a(Array)
    end
    
  end  
  
end
