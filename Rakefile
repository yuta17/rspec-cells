require 'rake'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :spec



desc 'Generate documentation for the rspec-cells plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'rspec-cells'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc', 'MIT-LICENSE')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  gem 'jeweler'
  require 'jeweler'

  Jeweler::Tasks.new do |spec|
    spec.name         = "rspec-cells"
    spec.version      = "0.1"
    spec.summary      = %{View Components for Rails.}
    spec.description  = %{Cells are lightweight controllers for Rails and can be rendered in views, providing an elegant and fast way for encapsulation and component-orientation.}
    spec.homepage     = "http://cells.rubyforge.org"
    spec.authors      = ["Nick Sutterer"]
    spec.email        = "apotonick@gmail.com"

    spec.files        = FileList["[A-Z]*", "lib/**/*"] - ["Gemfile.lock"]
    spec.test_files   = FileList["test/**/*"] - FileList["test/dummy/tmp", "test/dummy/tmp/**/*", "test/dummy/log/*"]

    # spec.add_dependency 'activesupport', '>= 2.3.0' # Dependencies and minimum versions?
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler - or one of its dependencies - is not available. " <<
  "Install it with: sudo gem install jeweler -s http://gemcutter.org"
end
