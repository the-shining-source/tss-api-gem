require 'spec_helper'

describe TheShiningSource::Projects do
  let(:projects) { TheShiningSource::Projects.new }
  
  it 'should return a TheShiningSource::Projects::Downloads instance' do
    expect(projects.downloads).to be_a TheShiningSource::Projects::Downloads
  end

  it 'should return a TheShiningSource::Projects::Galleries instance' do
    expect(projects.galleries).to be_a TheShiningSource::Projects::Galleries
  end

end
