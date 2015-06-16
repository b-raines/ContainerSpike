module CCInputToolbar
  def viewDidLoad
    super

    @field_bar = MIMInputToolbar.new
    assign_input_fields_accessory_view_and_delegate(@field_bar)
    setup_input_toolbar(@field_bar)
  end

  def textFieldShouldReturn(text_field)
    text_field.resignFirstResponder
    true
  end

  private

  def input_fields
    @input_fields ||=
      view.subviews.select do |v|
        v.is_a?(UITextField) || v.is_a?(UITextView)
      end
  end

  def assign_input_fields_accessory_view_and_delegate(field_bar)
    input_fields.each do |field|
      field.inputAccessoryView = field_bar
      field.delegate = self
    end
  end

  def setup_input_toolbar(field_bar)
    field_bar.fields = input_fields
    if input_fields.count == 1
      field_bar.items = field_bar.items[2..3]
    end
  end
end
