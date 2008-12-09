module BecomeContestable 

  def self.included(base) 
    base.extend ActMethods
  end 

  module ActMethods
    def become_contestable
      has_many :votes, :as => :voteable
      has_many :nominations, :as => :nominatable
      
      unless included_modules.include? Contestable::InstanceMethods 
        extend Contestable::ClassMethods 
        include Contestable::InstanceMethods 
      end
    end
    
    def become_voter
      has_many :votes
      unless included_modules.include? Voter::InstanceMethods
        extend Voter::ClassMethods 
        include Voter::InstanceMethods 
      end
    end
    
    module Contestable
      module InstanceMethods

      end

      module ClassMethods
        
      end
    end
    
    module Voter
      module InstanceMethods
        
        def vote_for(voteable, options = {})
          self.vote(voteable, true)
        end
        
        def vote_against(voteable, options = {})
          self.vote(voteable, false)
        end
 
        def vote(voteable, vote, options = {})
          vote = self.votes.build(:vote => vote, :voteable => voteable, :contest => options[:on])
          vote.save
        end        
      end

      module ClassMethods

      end
    end
  end
end


