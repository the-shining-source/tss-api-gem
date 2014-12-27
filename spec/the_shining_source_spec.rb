require 'spec_helper'

describe TheShiningSource do

  it "responds to 'new' message" do
    expect(subject).to respond_to :new
  end

  it "receives 'new' and initialize subject::Client instance" do
    expect(subject.new).to be_a TheShiningSource::Client
  end
  
  it "responds to 'configure' message" do
    expect(subject).to respond_to :configure
  end

  describe 'delegating to the client' do

    it 'calls respond_to if method exists in Client class' do
      expect(TheShiningSource).to respond_to(:projects)
    end

    it 'delegates missing methods to Client' do
      expect(TheShiningSource.projects).to be_a(TheShiningSource::Projects)
    end

  end

  describe 'after creation' do
 
    it 'returns default adapter' do
      expect(subject.adapter).to eq TheShiningSource::Configuration::DEFAULT_ADAPTER
    end
 
    it 'returns the default end point' do
      expect(subject.endpoint).to eq TheShiningSource::Configuration::DEFAULT_ENDPOINT
    end

    it 'returns the default user agent' do
      expect(subject.user_agent).to eq TheShiningSource::Configuration::DEFAULT_USER_AGENT
    end

    it 'sets the default mime type to JSON' do
      expect(subject.mime_type).to eq :json
    end

  end
    
  describe 'setting configuration options' do
    
    it 'can set the adapter' do
      subject.adapter = :typhoeus
      expect(subject.adapter).to eq :typhoeus
    end

    it 'can set the endpoint' do
      subject.endpoint = 'http://example.org'
      expect(subject.endpoint).to eq 'http://example.org'
    end
    
    it 'set the user agent' do
      subject.user_agent = 'New User Agent'
      expect(subject.user_agent).to eq 'New User Agent'
    end

    it 'can set the current api client' do
      expect(subject).to respond_to :client=
      expect(subject).to respond_to :client
    end
    
  end
  
  describe '.configure' do
    TheShiningSource::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "sets the #{key} directly" do
        TheShiningSource.configure do |config|
          config.send("#{key}=", key)
          expect(TheShiningSource.send(key)).to eq key
        end
      end
    end
  end

end
