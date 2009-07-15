module ViewTrail

  @@whodunnit = nil

  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def has_view_trail(&block)
      before_filter :set_whodunnit
      after_filter(:record_activity, &block)
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
    
    def self.whodunnit
      @@whodunnit.respond_to?(:call) ? @@whodunnit.call : @@whodunnit
    end

    def self.whodunnit=(value)
      @@whodunnit = value
    end
  end
  
  module InstanceMethods
    def record_activity
      if self.class.view_trail_active
        logger.debug(self.class.whodunnit)
        logger.debug(params.delete(:controller))
        logger.debug(params.delete(:action))
        logger.debug(params.inspect)
      end
    end
    def set_whodunnit
      @@whodunnit = lambda {
        self.respond_to?(:current_user) ? self.current_user : nil
      }
    end
  end
end

ActionController::Base.send :include, ViewTrail
