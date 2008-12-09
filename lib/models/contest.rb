class Contest < ActiveRecord::Base
  
  has_many :votes
  has_many :nominations
  
end