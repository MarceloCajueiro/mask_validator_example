class Person < ActiveRecord::Base
  validates :phone, :mask => '9999-9999'
  validates :document, :mask => '999.999.999-99'
  validates :birth_date, :mask => '9999-99-99'
end
