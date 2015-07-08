module Content
  class CourseWorkflow < BaseWorkflow
    def start
      @navigation_manager.replace_stack_with(
        [CourseWebViewController.alloc.init]
      )
    end
  end
end
