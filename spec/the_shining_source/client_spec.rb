require 'spec_helper'

describe TheShiningSource::Client do
  let(:client) { TheShiningSource::Client.new }
  
  it "should return a TheShiningSource::Projects instance" do
    client.projects.should be_a TheShiningSource::Projects
  end
end
