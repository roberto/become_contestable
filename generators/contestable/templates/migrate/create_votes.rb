class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes, :force => true do |t|
      t.boolean :vote, :default => true
      t.references :voteable, :polymorphic => true, :null => false
      t.references :voter, :polymorphic => true
      t.datetime :created_at
      t.integer :contest_id      
    end
  end

  def self.down
    drop_table :votes
  end
end
