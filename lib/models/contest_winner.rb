class ContestWinner < ActiveRecord::Base
  
  belongs_to :contest, :polymorphic => true
  belongs_to :contestable, :polymorphic => true
  
end