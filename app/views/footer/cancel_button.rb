module Footer
  class CancelButton < UIView
    include CCAutoLayoutView

    def init
      super

      self.addSubview(@label = CCLabel.alloc.init_with_options(
        text: 'Cancel',
        font: CCFont.proxima_regular(size: 16.5),
        color: CCColor.gray
      ))
      self.addSubview(@down_arrow = UIImageView.alloc.initWithImage(UIImage.imageNamed('down_arrow_gray.png')))
      down_arrow.translatesAutoresizingMaskIntoConstraints = false
      down_arrow.contentMode = UIViewContentModeScaleAspectFit
      self.addConstraints(subview_constraints)

      self
    end

    protected

    attr_reader :label, :down_arrow

    private

    def subview_constraints
      _constraints = []

      _constraints += CCLayout.new(
        label,
        bottom_view: down_arrow,
        margin: [0]
      ).constraints

      _constraints += CCLayout.new(
        down_arrow,
        height: 12,
        top_view: label,
        margin: [0],
        align: :center
      ).constraints

      _constraints
    end
  end
end
