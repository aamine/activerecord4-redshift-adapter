Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'activerecord4-redshift-adapter'
  s.version = '0.1.0'
  s.summary = 'Amazon Redshift adapter for ActiveRecord 4'
  s.description = 'Amazon Redshift _makeshift_ adapter for ActiveRecord 4.'
  s.license = 'MIT'

  s.author = ['Minero Aoki']
  s.email = 'mineroaoki@gmail.com'
  s.homepage = 'http://github.com/aamine/activerecord4-redshift-adapter'

  s.files = Dir.glob(['LICENSE', 'README.md', 'lib/**/*.rb'])
  s.require_path = 'lib'

  s.required_ruby_version = '>= 2.0.0'
  s.add_dependency 'pg'
  s.add_dependency 'activerecord', '>= 4.0.0'
end
