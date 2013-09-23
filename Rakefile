require 'nanoc3/tasks'

Dir.glob('lib/tasks/*.rake').each {|r| import r}

desc "Compile the site"
task :compile do
  `nanoc compile`
end

desc 'deploy'
task :deploy do
  `./bin/deploy`
end
