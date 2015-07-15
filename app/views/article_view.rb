module Footer
  class ArticleView < FooterView
    def init
      super

      self.height = DEFAULT_FOOTER_HEIGHT

      self.addSubview(@left_bar_button = CCButton.alloc.init_with_image('back_arrow.png'))
      self.addSubview(
        @right_bar_button = CCButton.alloc.init_with_title(
          'Next',
          font: CCFont.proxima_light(size: 20),
          color: UIColor.blackColor,
          background_color: nil
        )
      )


      TapEvent.new(left_bar_button, 'WillDismissArticle').register
      TapEvent.new(right_bar_button, 'WillViewNextArticle').register

      self
    end

    protected

    attr_reader :left_bar_button, :right_bar_button

    private

    def subview_constraints
      _constraints = []

      _constraints += CCLayout.new(
        left_bar_button,
        margin: [0, nil, 0, 23],
        vertical_align: :center
      ).constraints

      _constraints += CCLayout.new(
        right_bar_button,
        margin: [0, 23, 0, nil],
        vertical_align: :center
      ).constraints

      _constraints
    end
  end
end
