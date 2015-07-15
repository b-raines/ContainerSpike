module Footer
  module SignedIn
    class CourseView < FooterView
      def init
        super

        self.height = DEFAULT_FOOTER_HEIGHT
        self.addSubview(
          @label = CCLabel.alloc.init_with_options(
            text: '10% Happier',
            font: CCFont.proxima_light(size: 20),
            color: UIColor.blackColor
          )
        )
        # self.addSubview(@left_bar_button = CCButton.alloc.init_with_image('down_arrow.png'))
        # left_bar_button.setImageEdgeInsets(UIEdgeInsetsMake(10,10,10,10))
        # TapEvent.new(left_bar_button, 'WillDismissArticleView').register

        self
      end

      protected

      attr_reader :label, :left_bar_button

      private

      def subview_constraints
        _constraints = []

  #       _constraints += CCLayout.new(
  #         left_bar_button,
  #         right_view: enroll_button,
  #         margin: [0, nil, 0, 23],
  #         vertical_align: :center
  #       ).constraints

        _constraints += CCLayout.new(
          label,
          # left_view: left_bar_button,
          align: :center,
          vertical_align: :center
        ).constraints

        _constraints
      end
    end
  end
end
