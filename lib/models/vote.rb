class Vote < ActiveRecord::Base
  
  belongs_to :voteable, :polymorphic => true
  belongs_to :voter, :polymorphic => true
  belongs_to :contest, :polymorphic => true
  
  
  def counter_cache_after_create_for_voteable
    voteable.class.increment_counter(:votes_count, voteable.id) if voteable.class.column_names.include?("votes_count") && !voteable.nil?
  end
  after_create :counter_cache_after_create_for_voteable
  
  def counter_cache_before_destroy_for_voteable
    voteable.class.decrement_counter(:votes_count, voteable.id) if voteable.class.column_names.include?("votes_count") && !voteable.nil?
  end
  before_destroy :counter_cache_before_destroy_for_voteable
  
end