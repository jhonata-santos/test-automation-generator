desc 'Start scaffold'
task :start do
end

desc 'Rubocop'
task :rubocop do
  start_rubocop
end

def start_rubocop
  puts '>>> START RUBOCOP'
  checklist = '-r rubocop/formatter/checkstyle_formatter'
  config = '--config .rubocop.yml'
  formatter = '--format RuboCop::Formatter::CheckstyleFormatter'
  output = '--out code_analyzer/checkstyle-result.xml --format html --out code_analyzer/index.html'
  system "rubocop #{checklist} #{config} #{formatter} #{output} -P"
  puts '>>> END RUBOCOP'
end
