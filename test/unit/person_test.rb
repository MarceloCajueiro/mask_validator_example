require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test 'validate the format of phone' do
    subject = Person.new(:phone => '99999999')
    subject.valid?

    assert subject.errors[:phone].include? 'is invalid'

    subject = Person.new(:phone => '9999-9999')
    subject.valid?

    assert !subject.errors[:phone].include?('is invalid')
  end

  test 'validate the format of document' do
    subject = Person.new(:document => '99999999')
    subject.valid?

    assert subject.errors[:document].include? 'is invalid'

    subject = Person.new(:document => '001.213.543-61')
    subject.valid?

    assert !subject.errors[:document].include?('is invalid')
  end

  test 'validate the format of birth_date' do
    subject = Person.new(:birth_date => '10/10/2012')
    subject.valid?

    assert subject.errors[:birth_date].include? 'is invalid'

    subject = Person.new(:birth_date => '2012-10-10')
    subject.valid?

    assert !subject.errors[:birth_date].include?('is invalid')
  end
end
