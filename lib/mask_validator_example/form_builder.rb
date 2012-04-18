module MaskValidatorExample

  class FormBuilder < SimpleForm::FormBuilder

    map_type :string, :tel, :to => MaskValidatorExample::Inputs::StringInput

  end

end
