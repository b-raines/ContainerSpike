module ContainerContentController
  def didMoveToParentViewController(parent)
    parent.view.addConstraints(self.view.layout_constraints) if parent
  end
end
