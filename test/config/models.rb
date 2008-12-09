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
    t.datetime :created_at
    t.integer :user_id
    t.integer :contest_id
    t.string :voteable_type, :limit => 20, :null => false
    t.integer :voteable_id, :null => false
  end
  
  create_table :nominations, :force => true do |t|
    t.string :nominatable_type, :limit => 20, :null => false
    t.integer :nominatable_id, :null => false
    t.integer :contest_id, :null => false
    t.datetime :created_at
  end
  
  create_table :users, :force => true do |t|
    t.string :login
  end
  
  create_table :movies, :force => true do |t|
    t.string :name
  end
end

class User < ActiveRecord::Base
  acts_as_voter
end

class Movie < ActiveRecord::Base
  acts_as_contestable
end
