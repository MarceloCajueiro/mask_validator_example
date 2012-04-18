module ApplicationHelper
  def simple_form_for(object, *args, &block)
    options = args.extract_options!
    options[:builder] ||= MaskValidatorExample::FormBuilder

    super(object, *(args << options), &block)
  end
end
