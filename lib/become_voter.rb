module BecomeVoter

  def self.included(base) 
    base.extend ActMethods
  end 

  module ActMethods
    
    def become_voter
      has_many :votes
            
      unless included_modules.include? InstanceMethods
        extend ClassMethods 
        include InstanceMethods 
      end
    end

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


