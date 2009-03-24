module BecomeContest

  def self.included(base) 
    base.extend ActMethods
  end 

  module ActMethods
    def contest_of(association, options = {})
      has_many :votes, :as => :contest, :dependent => :destroy
      
      options[:association] = association.to_sym
      contest_class = reflect_on_association(options[:association]).class_name
      options[:contest_class] = contest_class
      
      unless included_modules.include? InstanceMethods
        class_inheritable_accessor :contest_options
        extend ClassMethods 
        include InstanceMethods
      end
      
      self.contest_options = options
    end
    
    module InstanceMethods
      
      def vote_for(voteable, options = {})
        self.vote(voteable, true, options)
      end
      
      def vote_against(voteable, options = {})
        self.vote(voteable, false, options)
      end

      def vote(voteable, vote, options = {})
        voter = options[:voter] || options[:by]
        
        vote = self.votes.build(:vote => vote, :voteable => voteable, :voter => voter)
        vote.save
      end
    end

    module ClassMethods

    end
  end
end


