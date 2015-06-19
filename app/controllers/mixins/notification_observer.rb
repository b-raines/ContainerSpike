module NotificationObserver
  module Base
    def viewWillAppear(animated)
      super
      register_observations
    end

    def viewDidDisappear(animated)
      super
      Event.remove_observer(self)
    end

    def dealloc
      Event.remove_observer(self)
      super
    end

    def register_observations; end
  end
end
