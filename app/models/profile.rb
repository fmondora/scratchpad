class Profile < ActiveRecord::Base
    cattr_reader :per_page 
      @@per_page = 10
    set_primary_key "user_id" 
  
   def self.table_name() "profile" end
   
end
