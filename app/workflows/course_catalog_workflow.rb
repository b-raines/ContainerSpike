class CourseCatalogWorkflow < BaseWorkflow
  def start
    @navigation_manager.replace_stack_with(
      [CourseCatalogController.alloc.init]
    )
  end
end
