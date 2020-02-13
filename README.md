# Validations Skipper :gem:

A repository dedicated to a ruby gem that allows classes to skip desired validations.

# Why it is necessary?

Currently, **the rails only enables to skip all validations** via:

```rb
item.save!(validate: false)
```

However, sometimes what you want is just to skip one or another validation, **not all of them**.

With this gem, you can easily skip the validations that you want.

# Instalation

Add `validations_skipper` to your Gemfile.

```rb
gem 'validations_skipper'
```

# Usage

1. First it is required to include the `ValidationsSkipable` module on the class you want to enable this feature.

```rb
class ClassExample
  include ActiveModel::Validations # this is not necessary if this class is a descendent of an ActiveRecord::Base
  include ValidationsSkipable
  
  validate :validation_method

  def validation_method
    errors.add(:column, 'An error message')
  end
end
```

2. Then you just need to assign the desired methods you want to skip on the new `skip_validations` attribute.

```rb
object = ClassExample.new
object.skip_validations = [:validation_method]
object.save! # Here you can see the object is saved and the validation method is skipped
```

# Author

contact: victorcorcos@gmail.com
name: Victor Cordeiro Costa
