require 'spec_helper'

describe TheShiningSource do

  it "should respond to 'new' message" do
    subject.should respond_to :new
  end

  it "should receive 'new' and initialize subject::Client instance" do
    subject.new.should be_a TheShiningSource::Client
  end
  
  it "should respond to 'configure' message" do
    subject.should respond_to :configure
  end
  
  describe "setting configuration options" do
    it "should return default adapter" do
      subject.adapter.should == TheShiningSource::Configuration::DEFAULT_ADAPTER
    end
    
    it "should allow to set adapter" do
      subject.adapter = :typhoeus
      subject.adapter.should == :typhoeus
    end
    
    it "should return the default end point" do
      subject.endpoint.should == TheShiningSource::Configuration::DEFAULT_ENDPOINT
    end

    it "should allow to set endpoint" do
      subject.endpoint = 'http://example.org'
      subject.endpoint.should == 'http://example.org'
    end

    it "should return the default user agent" do
      subject.user_agent.should == TheShiningSource::Configuration::DEFAULT_USER_AGENT
    end

    it "should allow to set new user agent" do
      subject.user_agent = 'New User Agent'
      subject.user_agent.should == 'New User Agent'
    end

    it "should have set mime type to json" do
      subject.mime_type.should == :json
    end
    
    it "should allow to set current api client" do
      subject.should respond_to :client=
      subject.should respond_to :client
    end
  end
  
  describe ".configure" do
    TheShiningSource::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set the #{key}" do
        TheShiningSource.configure do |config|
          config.send("#{key}=", key)
          TheShiningSource.send(key).should == key
        end
      end
    end
  end
  
end
