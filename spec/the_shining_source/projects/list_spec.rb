require 'spec_helper'

describe TheShiningSource::Projects, '#index' do

  before do 
    @client = TheShiningSource::Client.new
  end

  describe "GET => /projects/" do
    
    before do
      stub_get("projects/").
        to_return(:body => fixture("projects/index.json"), :headers => {:content_type => "application/json"})
    end    
    
    it "should get a list of projects" do
      @client.projects.list()
      a_get("projects/").
        should have_been_made
    end

    it "should fetch an array of projects" do
      projects = @client.projects.list()
      projects.should be_a Array
    end
    
  end  
  
end
