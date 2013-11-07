begin
  require 'simplecov'
  require 'simplecov-rcov'  
  SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
rescue LoadError
  # ignore
else
  SimpleCov.start 'the_shining_source'
end

require File.expand_path('../../lib/the_shining_source', __FILE__)

require 'rspec'
require 'webmock/rspec'
RSpec.configure do |config|
  config.include WebMock::API

  config.before(:each) do
    WebMock.reset!
  end
  config.after(:each) do
    WebMock.reset!
  end
end

def a_delete(path)
  a_request(:delete, TheShiningSource.endpoint + path)
end

def a_get(path)
  a_request(:get, TheShiningSource.endpoint + path)
end

def a_post(path)
  a_request(:post, TheShiningSource.endpoint + path)
end

def a_put(path)
  a_request(:put, TheShiningSource.endpoint + path)
end

def stub_delete(path)
  stub_request(:delete, TheShiningSource.endpoint + path)
end

def stub_get(path)
  stub_request(:get, TheShiningSource.endpoint + path)
end

def stub_post(path)
  stub_request(:post, TheShiningSource.endpoint + path)
end

def stub_put(path)
  stub_request(:put, TheShiningSource.endpoint + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
