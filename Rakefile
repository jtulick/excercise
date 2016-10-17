require 'rake/testtask'
task default: %w[test]

Rake::TestTask.new do |t|
  t.test_files = FileList['tests/*_test.rb']
end
