class ContestOption < ActiveRecord::Base
  
  belongs_to :contest, :polymorphic => true
  
end