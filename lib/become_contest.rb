module BecomeContest

  def self.included(base) 
    base.extend ActMethods
  end 

  module ActMethods
    def become_contest(options = {})
      has_many :votes, :as => :voteable
      has_many :nominations, :as => :nominatable
      has_one :contest_option, :as => :contest
      has_many :winners, :as => :contest, :class_name => "ContestWinner"
      
      before_save :save_contest_options
      
      unless included_modules.include? InstanceMethods
        class_inheritable_accessor :become_contest_options
        extend ClassMethods 
        include InstanceMethods 
      end
      
      self.become_contest_options = options 
    end
    
    module InstanceMethods
      
      def top(length = 10)
        
      end
    end

    module ClassMethods

      def save_contest_options
        self.build_contest_option(self.class.become_contest_options) if self.contest_options = nil        
      end
      
      def contest_option_attributes=(contest_option_attributes)
        self.contest_option = ContestOption.new(contest_option_attributes.reverse_merge(self.class.become_contest_options))
      end

    end
  end
end


