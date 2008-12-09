#
# Database structures and Models for AR-related tests
#

ActiveRecord::Schema.define do
  create_table :contests, :force => true do |t|
    t.string :name
    t.string :description
    t.datetime :created_at
    t.datetime :updated_at
    t.boolean :nominating, :default => false
  end
  
  create_table :votes, :force => true do |t|
    t.boolean :vote, :default => true
    t.references :voteable, :polymorphic => true, :null => false
    t.references :voter, :polymorphic => true
    t.datetime :created_at
    t.integer :contest_id      
  end
  
  create_table :nominations, :force => true do |t|
    t.references :nominatable, :polymorphic => true, :null => false
    t.integer :contest_id, :null => false
  end
  
  create_table :users, :force => true do |t|
    t.string :login
  end
  
  create_table :movies, :force => true do |t|
    t.string :name
  end
end

class User < ActiveRecord::Base
  become_voter
end

class Movie < ActiveRecord::Base
  become_contestable
end

