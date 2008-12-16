module BecomeVoter

  def self.included(base) 
    base.extend ActMethods
  end 

  module ActMethods
    
    def become_voter
      has_many :votes, :as => :voter
            
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
        contest = options[:contest] || options[:on]
        
        vote = self.votes.build(:vote => vote, :voteable => voteable, :contest => contest)
        vote.save
      end
      
      
      def voted_for?(voteable, options = {})
        voted?(voteable, true, options = {})
      end

       def voted_against?(voteable, options = {})
         voted?(voteable, false, options = {})
       end

       def voted_on?(voteable, options = {})
         contest = options[:contest] || options[:on] || voteable.contest
                  0 < self.votes.count(:all, :conditions => {:contest_id => contest.id, :contest_type => contest.class.name, :voteable_id => voteable.id, :voteable_type => voteable.class.name})
       end  
       
       def voted?(voteable, for_or_against, options = {})
         contest = options[:contest] || options[:on] || voteable.contest
         0 < self.votes.count(:all, :conditions => {:contest_id => contest.id, :contest_type => contest.class.name, :vote => for_or_against, :voteable_id => voteable.id, :voteable_type => voteable.class.name})
       end 
       
       private :voted?
    end

    module ClassMethods

    end

  end
end


