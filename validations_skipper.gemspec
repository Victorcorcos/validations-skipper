Gem::Specification.new do |s|
  s.name                  = 'validations-skipper'
  s.version               = '0.1.1'
  s.platform              = Gem::Platform::RUBY
  s.authors               = ['Victor Cordeiro Costa']
  s.email                 = ['victorcorcos@gmail.com']
  s.description           = %q{validations-skipper is a gem that enables objects
                               to skip specified validations with ease.
                               It can be applied to ActiveRecord::Base classes.}
  s.homepage              = 'https://github.com/Victorcorcos/validations-skipper'
  s.summary               = %q{validations-skipper is a gem that enables objects
                               to skip specified validations with ease.
                               It can be applied to ActiveRecord::Base classes.}
  s.files                 = ['lib/validations_skipper.rb']
  s.test_files            = ['test/test_validations_skipper.rb']
  s.require_paths         = ['lib']
  s.required_ruby_version = '>= 2.0'
  s.license               = 'MIT'

  s.add_development_dependency 'minitest', '~> 5.10'
  s.add_development_dependency 'rake', '~> 12.1'
  s.add_dependency 'activerecord', '>= 4.2'
end
