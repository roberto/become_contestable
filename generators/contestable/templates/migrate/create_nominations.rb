class CreateNominations < ActiveRecord::Migration
  def self.up
    create_table :nominations, :force => true do |t|
      t.references :nominatable, :polymorphic => true, :null => false
      t.integer :contest_id, :null => false
    end
    
    add_index :nominations, ["nominatable_id", "nominatable_type"], :name => "fk_nominatables"
    add_index :contest_id
  end

  def self.down
    drop_table :nominations
  end
end
