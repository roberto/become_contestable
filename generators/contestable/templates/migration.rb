class BecomeContestableMigration < ActiveRecord::Migration
  def self.up
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
  end

  def self.down
    drop_table :votes
  end
end