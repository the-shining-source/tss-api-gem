module TheShiningSource

  ##
  # Holds information about a file contained in a source control commit
  class CommitFile < EntityBase
    attr_accessor :filename, :file_type, :change_type

    def initialize(data = {})
      super(data)
      @file_type   = lookup_file_type(@file_type)
      @change_type = lookup_change_type(@change_type)
    end

    def lookup_file_type(type)
      case type
        when 'file' then :file
        when 'dir' then :directory
      end
    end

    def lookup_change_type(type)
      case type
        when 'M' then :modified
        when 'A' then :added
        when 'D' then :deleted
      end
    end

  end
  
end
