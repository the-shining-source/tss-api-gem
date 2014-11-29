require 'spec_helper'

describe TheShiningSource do

  it "should respond to 'new' message" do
    expect(subject).to respond_to :new
  end

  it "should receive 'new' and initialize subject::Client instance" do
    expect(subject.new).to be_a TheShiningSource::Client
  end
  
  it "should respond to 'configure' message" do
    expect(subject).to respond_to :configure
  end

  describe 'delegating to the client' do

    it 'should respond_to if method exists Client' do
      expect(TheShiningSource).to respond_to(:projects)
    end

    it 'should delegate missing methods to Client' do
      expect(TheShiningSource.projects).to be_a(TheShiningSource::Projects)
    end

  end
  
  describe 'setting configuration options' do
    
    it 'should return default adapter' do
      expect(subject.adapter).to eq TheShiningSource::Configuration::DEFAULT_ADAPTER
    end
    
    it 'should allow to set adapter' do
      subject.adapter = :typhoeus
      expect(subject.adapter).to eq :typhoeus
    end
    
    it 'should return the default end point' do
      expect(subject.endpoint).to eq TheShiningSource::Configuration::DEFAULT_ENDPOINT
    end

    it 'should allow to set endpoint' do
      subject.endpoint = 'http://example.org'
      expect(subject.endpoint).to eq 'http://example.org'
    end

    it 'should return the default user agent' do
      expect(subject.user_agent).to eq TheShiningSource::Configuration::DEFAULT_USER_AGENT
    end

    it 'should allow to set new user agent' do
      subject.user_agent = 'New User Agent'
      expect(subject.user_agent).to eq 'New User Agent'
    end

    it 'should have set mime type to json' do
      expect(subject.mime_type).to eq :json
    end
    
    it 'should allow to set current api client' do
      expect(subject).to respond_to :client=
      expect(subject).to respond_to :client
    end
    
  end
  
  describe '.configure' do
    TheShiningSource::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set the #{key}" do
        TheShiningSource.configure do |config|
          config.send("#{key}=", key)
          expect(TheShiningSource.send(key)).to eq key
        end
      end
    end
  end

end
