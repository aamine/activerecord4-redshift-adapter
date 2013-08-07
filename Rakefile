require 'rake/testtask'
require 'rubygems/package_task'

require "#{__dir__}/test/config"
require "#{__dir__}/test/support/config"

desc 'Run tests by default'
task :default => :test

### Tests

desc 'Run Redshift tests'
Rake::TestTask.new('test') do |t|
  t.libs << 'test'
  t.test_files = (Dir.glob( "test/cases/**/*_test.rb" )\
    .reject {|x| x =~ %r[/adapters/] } \
    + Dir.glob("test/cases/adapters/redshift/**/*_test.rb")).sort
  t.warning = true
  t.verbose = true
end

### Gem Handling

spec = eval(File.read('activerecord4-redshift-adapter.gemspec'))

desc 'Make gem'
Gem::PackageTask.new(spec) do |t|
  t.gem_spec = spec
end

desc 'Release to rubygems'
task :release => :package do
  require 'rake/gemcutter'
  Rake::Gemcutter::Tasks.new(spec).define
  Rake::Task['gem:push'].invoke
end
