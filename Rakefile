require "rake/testtask"

desc "Runs all test"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["./tests/*_test.rb"]
end

task :default => :test