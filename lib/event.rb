class Event
  class << self
    def trigger(notification_name, options = {})
      object = options['object']
      user_info = options['user_info'] || options[:user_info] || {}

      NSNotificationCenter.defaultCenter.postNotificationName(
        notification_name,
        object: object,
        userInfo: user_info
      )
    end

    def subscribe(observer, notification_name, options = {})
      selector = options['selector'] || "#{notification_name.cc_underscore}:"
      object = options['object']

      NSNotificationCenter.defaultCenter.addObserver(
        observer,
        selector: selector,
        name: notification_name,
        object: object
      )
    end

    def unsubscribe(observer, notification_name, options = {})
      object = options['object']

      NSNotificationCenter.defaultCenter.removeObserver(
        observer,
        name: notification_name,
        object: object
      )
    end

    def remove_observer(observer)
      NSNotificationCenter.defaultCenter.removeObserver(observer)
    end
  end
end
