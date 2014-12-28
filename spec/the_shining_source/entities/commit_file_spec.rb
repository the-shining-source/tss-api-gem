require 'spec_helper'

describe TheShiningSource::CommitFile do

  describe '#initialize' do
    
    it 'converts string file type to a symbol' do
 
      file = TheShiningSource::CommitFile.new('file_type' => 'file')
      expect(file.file_type).to eq(:file)

      file = TheShiningSource::CommitFile.new('file_type' => 'dir')
      expect(file.file_type).to eq(:directory)

    end
    
    it 'converts string change type to a symbol' do
 
      file = TheShiningSource::CommitFile.new('change_type' => 'A')
      expect(file.change_type).to eq(:added)

      file = TheShiningSource::CommitFile.new('change_type' => 'M')
      expect(file.change_type).to eq(:modified)

      file = TheShiningSource::CommitFile.new('change_type' => 'D')
      expect(file.change_type).to eq(:deleted)

    end
    
  end

end
