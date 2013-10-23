Dir.glob('./lib/response_mate/*', &method(:require))

desc 'Generate API responses'
namespace :response_mate do
  task :record, :base_url, :requests_manifest do |t, args|
    ResponseMate::Recorder.new(args).record
  end

  task :clear do
    FileUtils.rm_rf('output/responses/.')
    FileUtils.rm('tmp/compiled_content') if File.exist?('tmp/compiled_content')
    p "All clean and shiny!"
  end
end
