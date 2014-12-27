module TheShiningSource

  ##
  # Holds information about a single source control commit
  class Commit < EntityBase
    attr_accessor :commit_id, :commit_message, :created_at,
                  :author_id, :author_username, :author_name, :author_email
  end
  
end
