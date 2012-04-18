module MaskValidatorExample

  module Inputs

    class StringInput < SimpleForm::Inputs::StringInput

      protected

      include MaskValidatorExample::Inputs::MaskedInput

    end

  end

end
