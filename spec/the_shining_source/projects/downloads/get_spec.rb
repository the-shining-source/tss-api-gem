require 'spec_helper'

describe TheShiningSource::Projects::Downloads, '#get' do

  before do 
    @client = TheShiningSource::Client.new
  end

  describe "GET => /projects/{name}/downloads/" do
    
    before do
      stub_get("projects/shining-online/downloads/shining-online-demo-3b/").
        to_return(:body => fixture("projects/downloads/download.json"), :headers => {:content_type => "application/json"})
    end    
    
    it "should get a single download" do
      @client.projects.downloads.find('shining-online', 'shining-online-demo-3b')
      a_get("projects/shining-online/downloads/shining-online-demo-3b/").
        should have_been_made
    end

    it "should return information about the found download" do
      download = @client.projects.downloads.find('shining-online', 'shining-online-demo-3b')
      download['name'].should == 'Shining Online - Demo 3B'
    end
    
  end  
  
end
