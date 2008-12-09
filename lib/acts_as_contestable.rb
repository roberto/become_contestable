module ActsAsContestable 

  def self.included(base) 
    base.extend ActMethods
  end 

  module ActMethods
    def acts_as_contestable
      unless included_modules.include? InstanceMethods 
       extend ClassMethods 
       include InstanceMethods 
      end
    end
    
    def acts_as_voter
      unless included_modules.include? InstanceMethods 
       extend VoterClassMethods 
       include VoterInstanceMethods 
      end
    end
  end

  module InstanceMethods
    
  end

  module ClassMethods
    
  end
  
  module VoterInstanceMethods
    
  end
  
  module VoterClassMethods
    
  end

end


