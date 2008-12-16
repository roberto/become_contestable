module BecomeContestable 

  def self.included(base) 
    base.extend ActMethods
  end 

  module ActMethods
    def contestable_on(association, options = {})
      has_many :votes, :as => :voteable
      
      options[:association] = association.to_sym
      contest_class = reflect_on_association(options[:association]).class_name
      options[:contest_class] = contest_class
      
      
      unless included_modules.include? InstanceMethods 
        class_inheritable_accessor :contestable_options
        extend ClassMethods 
        include InstanceMethods 
      end
      
      
      self.contestable_options = options 
    end
    
    
    module InstanceMethods
      
      def contest
        send(self.class.contestable_options[:association])
      end

    end

    module ClassMethods
      
    end
  end
end


