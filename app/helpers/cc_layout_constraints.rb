class CCLayoutConstraints
  def initialize(view, opts = {})
    @view               = view
    @top_view           = opts[:top_view]
    @bottom_view        = opts[:bottom_view]
    @left_view          = opts[:left_view]
    @right_view         = opts[:right_view]
    @width              = opts.fetch(:width, default_view_width)
    @height             = opts.fetch(:height, default_view_height)
    @align              = opts[:align]
    @vertical_align     = opts[:vertical_align]
    @top                = opts[:margin_top]
    @right              = opts[:margin_right]
    @bottom             = opts[:margin_bottom]
    @left               = opts[:margin_left]

    self.margins = opts.fetch(:margin, default_view_margins)
  end

  def default_view_margins
    if view.respond_to?(:margin)
      view.margin
    else
      []
    end
  end

  def default_view_width
    view.width if view.respond_to?(:width)
  end

  def default_view_width
    view.width if view.respond_to?(:height)
  end

  def constraints
    @constraints = []

    @constraints += horizontal_constraints
    @constraints += vertical_constraints
    @constraints << align_constraint if align
    @constraints << vertical_align_constraint if vertical_align

    @constraints
  end

  protected

  attr_reader \
    :view,
    :top_view,
    :bottom_view,
    :left_view,
    :right_view,
    :top,
    :right,
    :bottom,
    :left,
    :width,
    :height,
    :align,
    :vertical_align

  private

  def views
    @views ||= {
      'view'       => view,
      'topView'    => top_view,
      'bottomView' => bottom_view,
      'leftView'   => left_view,
      'rightView'  => right_view
    }
  end

  def horizontal_constraints
    NSLayoutConstraint.constraintsWithVisualFormat(
      vfl(:horizontal),
      options: 0,
      metrics: nil,
      views: views
    )
  end

  def vertical_constraints
    NSLayoutConstraint.constraintsWithVisualFormat(
      vfl(:vertical),
      options: 0,
      metrics: nil,
      views: views
    )
  end

  def vfl(side)
    case side
    when :horizontal
      "H:#{margin(:left)}[view#{width_constraint}]#{margin(:right)}"
    when :vertical
      "V:#{margin(:top)}[view#{height_constraint}]#{margin(:bottom)}"
    end
  end

  def align_constraint
    case align
    when :left
      left_aligned
    when :right
      right_aligned
    when :center
      center_x_aligned
    end
  end

  def vertical_align_constraint
    case vertical_align
    when :top
      top_aligned
    when :bottom
      bottom_aligned
    when :center
      center_y_aligned
    end
  end

  def height_constraint
    if height && height >= 0
      "(#{height})"
    end
  end

  def width_constraint
    if width && width >= 0
      "(#{width})"
    end
  end

  def margin(side)
    side_margin = self.send(side)
    if side_margin && side_margin >= 0
      case side
      when :top, :left
        "#{relative_view(side)}-#{side_margin}-"
      when :right, :bottom
        "-#{side_margin}-#{relative_view(side)}"
      end
    end
  end

  def relative_view(side)
    if views["#{side}View"]
      "[#{side}View]"
    else
      '|'
    end
  end

  def margins=(margin)
    case margin.length
    when 4
      assign_margins(margin[0], margin[1], margin[2], margin[3])
    when 3
      assign_margins(margin[0], margin[1], margin[2], margin[1])
    when 2
      assign_margins(margin[0], margin[1], margin[0], margin[1])
    when 1
      assign_margins(margin[0], margin[0], margin[0], margin[0])
    end
  end

  def assign_margins(*margins)
    @top    ||= margins[0]
    @right  ||= margins[1]
    @bottom ||= margins[2]
    @left   ||= margins[3]
  end

  def top_aligned
    constraint_relative_to_superview_attribute(NSLayoutAttributeTop)
  end

  def bottom_aligned
    constraint_relative_to_superview_attribute(NSLayoutAttributeBottom)
  end

  def center_y_aligned
    constraint_relative_to_superview_attribute(NSLayoutAttributeCenterY)
  end

  def left_aligned
    constraint_relative_to_superview_attribute(NSLayoutAttributeLeft)
  end

  def right_aligned
    constraint_relative_to_superview_attribute(NSLayoutAttributeRight)
  end

  def center_x_aligned
    constraint_relative_to_superview_attribute(NSLayoutAttributeCenterX)
  end

  def constraint_relative_to_superview_attribute(layout_attribute, opts = {})
    NSLayoutConstraint.constraintWithItem(
      view,
      attribute: layout_attribute,
      relatedBy: opts.fetch(:related_by, NSLayoutRelationEqual),
      toItem: view.superview,
      attribute: layout_attribute,
      multiplier: opts.fetch(:multiplier, 1),
      constant: opts.fetch(:constant, 0)
    )
  end
end