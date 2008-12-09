class CreateNominations < ActiveRecord::Migration
  def self.up
    create_table :nominations, :force => true do |t|
      t.string :nominatable_type, :limit => 20, :null => false
      t.integer :nominatable_id, :null => false
      t.integer :contest_id, :null => false
    end
  end

  def self.down
    drop_table :nominations
  end
end
