require 'minitest/autorun'
require 'validations_skipper'
require 'active_model'
require 'active_support/core_ext/object/inclusion.rb'

class TestValidationsSkipper < Minitest::Test
  class ClassWithOneValidation
    include ActiveModel::Validations
    include ValidationsSkipable

    validate :validation_method

    def validation_method
      errors.add(:column, 'An error message')
    end
  end

  def test_skipping_validation
    @object = ClassWithOneValidation.new
    @object.skip_validations = [:validation_method]

    assert_equal(@object.valid?, true)
  end

  def test_not_skipping_validation
    @object = ClassWithOneValidation.new

    assert_equal(@object.valid?, false)
  end

  def test_toggleing_skipping_validation
    @object = ClassWithOneValidation.new
    @object.skip_validations = [:validation_method]
    @object.skip_validations = []

    assert_equal(@object.valid?, false)
  end

  class ClassWithTwoValidations
    include ActiveModel::Validations
    include ValidationsSkipable

    validate :validation_method1
    validate :validation_method2

    def validation_method1
      errors.add(:column, 'An error message')
    end

    def validation_method2
      errors.add(:column, 'Another error message')
    end
  end

  def test_skipping_first_validation
    @object = ClassWithTwoValidations.new
    @object.skip_validations = [:validation_method1]

    assert_equal(@object.valid?, false)
  end

  def test_skipping_last_validation
    @object = ClassWithTwoValidations.new
    @object.skip_validations = [:validation_method2]

    assert_equal(@object.valid?, false)
  end

  def test_skipping_both_validations
    @object = ClassWithTwoValidations.new
    @object.skip_validations = [:validation_method1, :validation_method2]

    assert_equal(@object.valid?, true)
  end

  def test_not_skipping_validations
    @object = ClassWithOneValidation.new

    assert_equal(@object.valid?, false)
  end

  class ClassWithPrivateValidation
    include ActiveModel::Validations
    include ValidationsSkipable

    validate :private_validation_method

    private

    def private_validation_method
      errors.add(:column, 'An error message')
    end
  end

  def test_skipping_private_validation
    @object = ClassWithPrivateValidation.new
    @object.skip_validations = [:private_validation_method]

    assert_equal(@object.valid?, true)
  end

  def test_not_skipping_private_validation
    @object = ClassWithPrivateValidation.new

    assert_equal(@object.valid?, false)
  end

  def test_toggleing_skipping_validation
    @object = ClassWithPrivateValidation.new
    @object.skip_validations = [:private_validation_method]
    @object.skip_validations = []

    assert_equal(@object.valid?, false)
  end
end
