class CCFont
  class << self
    def proxima_regular(opts = {})
      font_with_name('ProximaNova-Regular', opts.fetch(:size, 19))
    end

    def proxima_light(opts = {})
      font_with_name('ProximaNova-Light', opts.fetch(:size, 19))
    end

    def proxima_italic(opts = {})
      font_with_name('ProximaNova-RegularIt', opts.fetch(:size, 19))
    end

    def proxima_bold(opts = {})
      font_with_name('ProximaNova-Bold', opts.fetch(:size, 19))
    end

    def proxima_semibold(opts = {})
      font_with_name('ProximaNova-Semibold', opts.fetch(:size, 19))
    end

    def font_with_name(name, size)
      UIFont.fontWithName(name, size: size)
    end
  end
end
