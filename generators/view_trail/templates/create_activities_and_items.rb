class CreateActivitiesAndItems < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string   :controller
      t.string   :action
      t.text     :params
      t.string   :whodiddit
      t.datetime :created_at
    end  
    create_table :activity_items do |t|
      t.integer :activity_id
      t.string  :key
      t.text    :value
    end
  end

  def self.down
    drop_table :activities
    drop_table :activity_items
  end
end