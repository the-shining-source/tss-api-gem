require 'simplecov'
require 'simplecov-rcov'  

class SimpleCov::Formatter::MergedFormatter
  def format(result)
     SimpleCov::Formatter::HTMLFormatter.new.format(result)
     SimpleCov::Formatter::RcovFormatter.new.format(result)
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MergedFormatter
SimpleCov.start

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

def a_patch(path)
  a_request(:patch, TheShiningSource.endpoint + path)
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

def stub_patch(path)
  stub_request(:patch, TheShiningSource.endpoint + path)
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
