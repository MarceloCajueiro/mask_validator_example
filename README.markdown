# Mask validator example

Install the [mask_validator gem](https://github.com/MarceloCajueiro/mask_validator)

## Using the mask validator:

```ruby
validates :phone, :mask => '9999-9999'
validates :document, :mask => '999.999.999-99'
validates :birth_date, :mask => '9999-99-99'
```

## Using the jquery.masked_input.js

[Download the jquery plugin](https://github.com/digitalBush/jquery.maskedinput)

Put the js file in `app/assets/javascripts/` or `vendor/assets/javascripts/`.

To use the mask you have to call the mask to the input selector as this example below:

```javascript
$("#person_phone").mask("9999-9999");
```

## Using the mask automatically with simple_form gem

[Install the simple_form gem](https://github.com/plataformatec/simple_form)

### Autoload the lib folder

```ruby
config.autoload_paths += %W(#{config.root}/lib)
```

### Create a custom form builder

```ruby
module MaskValidatorExample

  class FormBuilder < SimpleForm::FormBuilder

    map_type :string, :tel, :to => MaskValidatorExample::Inputs::StringInput

  end

end
```

### Create a module to fill the `data-mask` following the mask of mask validator

```ruby
module MaskValidatorExample

  module Inputs

    module MaskedInput

      def input_html_options
        options = super

        if has_mask?
          options['data-mask'] ||= mask
        end

        options
      end

      def has_mask?
        !!mask
      end

      def mask
        return unless has_validators?

        mask_validator = find_mask_validator or return
        mask_validator.mask_value_for(object)
      end

      def find_mask_validator
        find_validator(MaskValidator)
      end

    end

  end

end
```

### Include the masked input methods in the String and Telephone inputs

```ruby
module MaskValidatorExample

  module Inputs

    class StringInput < SimpleForm::Inputs::StringInput

      protected

      include MaskValidatorExample::Inputs::MaskedInput

    end

  end

end
```

### Overwriting the `simple_form_for` helper

```ruby
module ApplicationHelper
  def simple_form_for(object, *args, &block)
    options = args.extract_options!
    options[:builder] ||= MaskValidatorExample::FormBuilder

    super(object, *(args << options), &block)
  end
end
```

### Finally! Auto masked input when has `data-mask` in the input

```javascript
$('input[data-mask]').live('focus', function () {
  $(this).mask($(this).attr("data-mask"));
});
```
