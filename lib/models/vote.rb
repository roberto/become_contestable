class Vote < ActiveRecord::Base
  
  belongs_to :voteable, :polymorphic => true
  belongs_to :voter, :polymorphic => true
  belongs_to :contest
  
end