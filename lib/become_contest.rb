module BecomeContest

  def self.included(base) 
    base.extend ActMethods
  end 

  module ActMethods
    def become_contest
      has_many :votes, :as => :voteable
      has_many :nominations, :as => :nominatable
      has_one :contest_option, :as => :contest
      has_many :winners, :as => :contest, :class_name => "ContestWinner"
      
      unless included_modules.include? InstanceMethods 
        extend ClassMethods 
        include InstanceMethods 
      end
    end
    
    module InstanceMethods
      
      def top(length = 10)
        
      end
    end

    module ClassMethods

    end
  end
end


