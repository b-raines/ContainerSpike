class HomeWorkflow < BaseWorkflow
  def start
    @navigation_manager.replace_stack_with(
      [AppContainerController.alloc.init]
    )
  end
end
