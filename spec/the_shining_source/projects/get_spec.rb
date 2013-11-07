require 'spec_helper'

describe TheShiningSource::Projects, '#get' do
  let(:client) { TheShiningSource::Client.new }
  
  describe "GET => /projects/" do
    
    before do
      stub_get("projects/shining-online/").
        to_return(:body => fixture("projects/project.json"), :headers => {:content_type => "application/json"})
    end    
    
    it "should get a single project" do
      client.projects.find('shining-online')
      a_get("projects/shining-online/").
        should have_been_made
    end

    it "should return information about the found project" do
      project = client.projects.find('shining-online')
      project['name'].should == 'Shining Online'
    end
    
  end  
  
end
