require 'spec_helper'

describe TheShiningSource::Projects do
  let(:projects) { TheShiningSource::Projects.new }
  
  it 'can return a TheShiningSource::Projects::Downloads instance' do
    expect(projects.downloads).to be_a TheShiningSource::Projects::Downloads
  end

  it 'can return a TheShiningSource::Projects::Galleries instance' do
    expect(projects.galleries).to be_a TheShiningSource::Projects::Galleries
  end

  it 'can return a TheShiningSource::Projects::Images instance' do
    expect(projects.images).to be_a TheShiningSource::Projects::Images
  end
  
  it 'can return a TheShiningSource::Projects::Commits instance' do
    expect(projects.downloads).to be_a TheShiningSource::Projects::Downloads
  end
  
end
