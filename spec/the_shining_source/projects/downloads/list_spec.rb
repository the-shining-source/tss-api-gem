require 'spec_helper'

describe TheShiningSource::Projects::Downloads, '#list' do

  before do 
    @client = TheShiningSource::Client.new
  end
  
  describe "GET => /projects/{name}/downloads/" do
    
    before do
      stub_get("projects/shining-online/downloads/").
        to_return(:body => fixture("projects/downloads/list.json"), :headers => {:content_type => "application/json"})
    end    
    
    it "should get a list of downloads for a project" do
      @client.projects.downloads.list("shining-online")
      a_get("projects/shining-online/downloads/").
        should have_been_made
    end
    
    it "should fetch an array of downloads for a project" do
      downloads = @client.projects.downloads.list("shining-online")
      downloads.should be_a Array
    end
    
  end  
  
end
