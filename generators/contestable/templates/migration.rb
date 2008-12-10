class BecomeContestableMigration < ActiveRecord::Migration
  def self.up
    create_table :contest_options, :force => true do |t|
      t.references :contest, :polymorphic => true, :null => false
      t.boolean :nominating, :default => false
      t.integer :max_winners, :default => 0
    end
    add_index :contest_options, ["contest_id", "contest_type"], :name => "fk_options_contests"

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
  end

  def self.down
    drop_table :nominations
    drop_table :votes
    drop_table :contest_options
  end
end
