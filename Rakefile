require 'nanoc3/tasks'

Dir.glob('lib/tasks/*.rake').each {|r| import r}

desc "Compile the site"
task :compile do
  `nanoc compile`
end

# prompt user for a commit message; default: HEAD commit 1-liner
def commit_message
  last_commit = `git log -1 --pretty=format:"%s"`.chomp.strip
  last_commit = 'Publishing developer content to GitHub pages.' if last_commit == ''

  print "Enter a commit message (default: '#{last_commit}'): "
  STDOUT.flush
  mesg = STDIN.gets.chomp.strip

  mesg = last_commit if mesg == ''
  mesg.gsub(/'/, '') # to allow this to be handed off via -m '#{message}'
end
