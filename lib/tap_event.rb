class TapEvent
  def initialize(observer, event_name, opts = {})
    @observer = observer
    @target = opts[:target] || self
    @event_name = event_name
  end

  def register
    observer.addGestureRecognizer(
      UITapGestureRecognizer.alloc.initWithTarget(
        target,
        action: 'trigger_event'
      )
    )
  end

  protected

  attr_reader :observer, :target, :event_name

  private

  def trigger_event
    Event.trigger(event_name)
  end
end
