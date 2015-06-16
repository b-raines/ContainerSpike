module ContainerContentController
  def didMoveToParentViewController(parent)
    parent.view.addConstraints(self.view.constraints) if parent
  end
end
