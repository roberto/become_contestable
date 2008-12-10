require 'become_contestable'
require 'become_contest'
require 'become_voter'
require 'models/nomination'
require 'models/vote'
require 'models/contest_winner'
ActiveRecord::Base.send(:include,BecomeContestable)
ActiveRecord::Base.send(:include,BecomeContest)
ActiveRecord::Base.send(:include,BecomeVoter)