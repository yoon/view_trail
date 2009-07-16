ActiveRecord::Schema.define(:version => 0) do

  create_table :activities, :force => true do |t|
    t.string   :controller
    t.string   :action
    t.text     :params
    t.string   :whodunnit
    t.datetime :created_at
  end

end
