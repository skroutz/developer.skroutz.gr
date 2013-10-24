Dir.glob('./lib/response_mate/*', &method(:require))

desc 'Generate API responses'
namespace :response_mate do
  task :record, :base_url, :requests_manifest do |t, args|
    ResponseMate::Recorder.new(args).record
    File.open(ResponseMate.configuration.output_dir + '.last_recording', 'w') do |f|
      f << Time.now
    end
  end

  task :clear do
    FileUtils.rm_rf(ResponseMate.configuration.output_dir + '.')
    FileUtils.rm('tmp/compiled_content') if File.exist?('tmp/compiled_content')
    STDOUT.print "All clean and shiny!\n"
  end

  task :list do
    STDOUT.print "Listing available responses\n"
    STDOUT.print "---------------------------\n"
    Dir.glob('output/**/*.yml').map { |k| 
      k.split('/').last.gsub('.yml', '') << "\n"
    }.sort.each { |k| STDOUT.print k }
  end

  task :last_recording_time do
    begin
      STDOUT.print 'Last was recording occured at: '
      STDOUT.print File.new(ResponseMate.configuration.output_dir + '.last_recording').read
    rescue Errno::ENOENT
      STDOUT.print "\n\tNo recording information present".red
    end
  end
end
