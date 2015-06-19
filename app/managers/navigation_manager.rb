class NavigationManager
  class << self
    def shared
      Dispatch.once { @shared = new }
      @shared
    end

    def navigation_controller
      shared.navigation_controller
    end

    def navigation_controller=(nc)
      shared.navigation_controller = nc
    end

    def navigate_to(*args)
      shared.navigate_to(*args)
    end

    def go_back_to(*args)
      shared.go_back_to(*args)
    end

    def pop
      shared.pop
    end

    def pop_to_root(animated = true)
      shared.pop_to_root(animated)
    end

    def replace_stack_with(controllers, opts={})
      controllers = [controllers] unless controllers.is_a?(Array)

      shared.replace_stack_with(controllers, opts)
    end

    def show_nav_bar
      shared.show_nav_bar
    end

    def refresh_workflow
      shared.refresh_workflow
    end
  end

  attr_accessor :navigation_controller

  def initialize
    self.navigation_controller = CCNavigationController.alloc.init
    start_current_workflow
  end

  def navigate_to(vc, opts = {})
    opts.fetch(:navigation_controller, navigation_controller).pushViewController(vc, animated: opts.fetch(:animated, true))
  end

  def go_back_to(controller_class, opts = {})
    navigation_controller.popToViewController(controller_for_class(controller_class), animated: opts.fetch(:animated, true))
  end

  def pop
    navigation_controller.popViewControllerAnimated(true)
  end

  def pop_to_root(animated)
    navigation_controller.popToRootViewControllerAnimated(animated)
  end

  def replace_stack_with(controllers, opts = {})
    navigation_controller.setViewControllers(controllers, animated: opts.fetch(:animated, true))
  end

  def show_nav_bar
    navigation_controller.setNavigationBarHidden(false, animated:false)
  end

  def refresh_workflow
    start_current_workflow
  end

  private

  def start_current_workflow
    HomeWorkflow.new(self).start
  end

  def controller_for_class(controller_class)
    navigation_controller.viewControllers.select { |vc| vc.is_a? controller_class }.first
  end
end
