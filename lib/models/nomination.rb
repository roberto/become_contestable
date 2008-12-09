class Nomination < ActiveRecord::Base
  
  belongs_to :contest
  belongs_to :nominatable, :polymorphic => true
  
end