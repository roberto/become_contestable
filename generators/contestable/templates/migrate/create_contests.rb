class CreateContests < ActiveRecord::Migration
  def self.up
    create_table :contests, :force => true do |t|
      t.string :name
      t.text :description
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :nominating, :default => false
    end
  end

  def self.down
    drop_table :contests
  end
end
