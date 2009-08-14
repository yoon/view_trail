require 'view_trail/activity'
require 'view_trail/activity_item'

module ViewTrail
  @@whodiddit = nil
  
  def self.included(base)
    base.send :extend, ClassMethods
    base.before_filter :set_whodiddit
  end

  def self.whodiddit
    @@whodiddit.respond_to?(:call) ? @@whodiddit.call : @@whodiddit
  end

  def self.whodiddit=(value)
    @@whodiddit = value
  end

  private

  def set_whodiddit
    @@whodiddit = lambda {
      self.respond_to?(:current_user) ? self.current_user : nil
    }
  end

  module ClassMethods
    def has_view_trail(*conditions)
      before_filter :set_whodiddit
      after_filter(:record_activity, conditions)
      cattr_accessor :view_trail_active
      self.view_trail_active = true
      send :include, InstanceMethods
    end

    def view_trail_off
      self.view_trail_active = false
    end
    def view_trail_on
      self.view_trail_active = true
    end  
  end
  
  module InstanceMethods
    def audit(items)
      @activity_items = items
    end
    def record_activity
      if self.class.view_trail_active
        a = Activity.create(:whodiddit => ViewTrail.whodiddit, :controller => params.delete(:controller), :action => params.delete(:action), :params => params)
        (@activity_items || {}).each do |k,v|
          a.activity_items.create(:key => k.to_s, :value => v)
        end
        @activity_items = nil
      end
    end
  end
end

ActionController::Base.send :include, ViewTrail
