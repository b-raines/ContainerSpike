module NotificationObserver
  module Base
    def viewWillAppear(animated)
      super
      register_observations
    end

    def viewWillDisappear(animated)
      super
      Event.unsubscribe(self)
    end

    def dealloc
      Event.unsubscribe
      super
    end
  end
end
