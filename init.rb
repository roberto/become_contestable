require 'acts_as_contestable'
require 'models/contest'
require 'models/nomination'
require 'models/vote'
ActiveRecord::Base.send(:include,ActsAsContestable)