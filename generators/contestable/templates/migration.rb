class BecomeContestableMigration < ActiveRecord::Migration
  def self.up
    create_table :contests, :force => true do |t|
      t.string :name
      t.text :description
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :nominating, :default => false
    end
    
    create_table :nominations, :force => true do |t|
      t.references :nominatable, :polymorphic => true, :null => false
      t.integer :contest_id, :null => false
    end
    
    add_index :nominations, ["nominatable_id", "nominatable_type"], :name => "fk_nominatables"
    add_index :contest_id
    
    create_table :votes, :force => true do |t|
      t.boolean :vote, :default => true
      t.references :voteable, :polymorphic => true, :null => false
      t.references :voter, :polymorphic => true
      t.datetime :created_at
      t.integer :contest_id      
    end
    
    add_index :votes, ["voter_id", "voter_type"], :name => "fk_voters"
    add_index :votes, ["voteable_id", "voteable_type"], :name => "fk_voteables"
    add_index :votes, :contest_id
  end

  def self.down
    drop_table :contests
    drop_table :nominations
    drop_table :votes
  end
end
