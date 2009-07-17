class Activity < ActiveRecord::Base
  serialize :params
  has_many :activity_items
end
