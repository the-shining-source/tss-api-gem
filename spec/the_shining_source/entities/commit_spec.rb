require 'spec_helper'

describe TheShiningSource::Commit do

  describe '#initialize' do

    let(:raw_data) do
      {
        'files' => [
          {
            'filename'    => 'test_file.txt',
            'file_type'   => 'file',
            'change_type' => 'M'
          }
        ]
      }
    end
    
    it 'adds commit file data when initialized' do
      commit = TheShiningSource::Commit.new(raw_data)
      expect(commit.files.length).to eq(1)
      expect(commit.files.first).to be_a(TheShiningSource::CommitFile)
    end
    
  end

end
