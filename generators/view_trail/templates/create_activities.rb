class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string   :controller
      t.string   :action
      t.text     :params
      t.string   :whodunnit
      t.datetime :created_at
    end
    # add_index :activities, [:item_type, :item_id]
  end

  def self.down
    # remove_index :activities, [:item_type, :item_id]
    drop_table :activities
  end
end
