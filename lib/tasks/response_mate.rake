Dir.glob('./lib/response_mate/*', &method(:require))

desc 'Generate API responses'
namespace :response_mate do
  task :record, :base_url, :requests_manifest do |t, args|
    requests_manifest = args[:requests_manifest] || ResponseMate.configuration.
      requests_manifest

    requests = YAML.load_file(requests_manifest)
    p "Reading request manifest: #{requests_manifest}"

    base_url = args[:base_url] || ResponseMate.configuration
    p "Generating responses for #{args[:base_url]}"

    recorder = ResponseMate::Recorder.new args[:base_url] || requests['base_url']
    requests['requests'].each do |request|
      recorder.process request['key'], request['request']
    end
  end

  task :clear do
    FileUtils.rm_rf('output/responses/.')
    FileUtils.rm('tmp/compiled_content') if File.exist?('tmp/compiled_content')
    p "All clean and shiny!"
  end
end
