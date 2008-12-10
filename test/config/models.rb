#
# Database structures and Models for AR-related tests
#

ActiveRecord::Schema.define do
  create_table :contest_options, :force => true do |t|
    t.references :contest, :polymorphic => true, :null => false
    t.boolean :nominating, :default => false
  end
  
  create_table :contest_winners, :force => true do |t|
    t.references :contest, :polymorphic => true, :null => false
    t.references :contestable, :polymorphic => true, :null => false
    t.text :notes
  end
  
  create_table :nominations, :force => true do |t|
    t.references :nominatable, :polymorphic => true, :null => false
    t.references :contest, :polymorphic => true, :null => false
  end
  
  add_index :nominations, ["nominatable_id", "nominatable_type"], :name => "fk_nominatables"
  add_index :nominations, ["contest_id", "contest_type"], :name => "fk_nominations_contests"
  
  create_table :votes, :force => true do |t|
    t.boolean :vote, :default => true
    t.references :voteable, :polymorphic => true, :null => false
    t.references :voter, :polymorphic => true
    t.references :contest, :polymorphic => true, :null => false
    t.datetime :created_at    
  end
  
  add_index :votes, ["voter_id", "voter_type"], :name => "fk_voters"
  add_index :votes, ["voteable_id", "voteable_type"], :name => "fk_voteables"
  add_index :votes, ["contest_id", "contest_type"], :name => "fk_votes_contests"
  
  create_table :users, :force => true do |t|
    t.string :login
  end
  
  create_table :movies, :force => true do |t|
    t.string :name
  end
  
  create_table :voting_contests, :force => true do |t|
    t.string :name
  end
end

class User < ActiveRecord::Base
  become_voter
end

class Movie < ActiveRecord::Base
  become_contestable
end

class VotingContest < ActiveRecord::Base
  become_contest
end

