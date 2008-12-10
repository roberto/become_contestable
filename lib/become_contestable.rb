module BecomeContestable 

  def self.included(base) 
    base.extend ActMethods
  end 

  module ActMethods
    def become_contestable
      has_many :votes, :as => :voteable
      has_many :nominations, :as => :nominatable
      
      unless included_modules.include? InstanceMethods 
        extend ClassMethods 
        include InstanceMethods 
      end
    end
    
    module InstanceMethods

    end

    module ClassMethods
      
    end
  end
end


