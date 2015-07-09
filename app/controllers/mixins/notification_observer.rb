module NotificationObserver
  module Base
    def viewWillAppear(animated)
      super
      Event.remove_observer(self)
      register_observations
    end

    def viewDidDisappear(animated)
      super
      Event.remove_observer(self)
      register_persistent_observations
    end

    def dealloc
      Event.remove_observer(self)
      super
    end

    def register_observations
      register_persistent_observations
    end

    def register_persistent_observations; end
  end
end
