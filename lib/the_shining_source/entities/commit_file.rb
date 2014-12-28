module TheShiningSource

  ##
  # Holds information about a file contained in a source control commit
  class CommitFile < EntityBase
    attr_accessor :filename, :file_type, :change_type
  end
  
end
