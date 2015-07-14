class CCHUD < SVProgressHUD
  class << self
    def show
      setForegroundColor(UIColor.blackColor)
      super
    end

    def showWithMaskType(mask_type)
      setForegroundColor(UIColor.blackColor)
      super(mask_type)
    end

    def showWithStatus(status)
      setForegroundColor(UIColor.blackColor)
      super(status)
    end

    def showWithStatus(status, maskType: mask_type)
      setForegroundColor(UIColor.blackColor)
      super(status, maskType: mask_type)
    end

    def showProgress(progress)
      setForegroundColor(UIColor.blackColor)
      super(progress)
    end

    def showProgress(progress, status: _status)
      setForegroundColor(UIColor.blackColor)
      super(progress, status: _status)
    end

    def showProgress(progress, status: _status, maskType: mask_type)
      setForegroundColor(UIColor.blackColor)
      super(progress, status: _status, maskType: mask_type)
    end


    def showSuccessWithStatus(status)
      setForegroundColor(CCColor.hud_success)
      super(status)
    end

    def showSuccessWithStatus(status, maskType: mask_type)
      setForegroundColor(CCColor.hud_success)
      super(status, maskType: mask_type)
    end

    def showErrorWithStatus(status)
      setForegroundColor(CCColor.hud_failure)
      super(status)
    end

    def showErrorWithStatus(status, maskType: mask_type)
      setForegroundColor(CCColor.hud_failure)
      super(status, maskType: mask_type)
    end
  end
end
