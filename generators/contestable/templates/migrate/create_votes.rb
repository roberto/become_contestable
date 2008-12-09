class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes, :force => true do |t|
      t.boolean :vote, :default => true
      t.datetime :created_at
      t.integer :user_id
      t.integer :contest_id
      t.string :voteable_type, :limit => 20, :null => false
      t.integer :voteable_id, :null => false
    end
  end

  def self.down
    drop_table :votes
  end
end
