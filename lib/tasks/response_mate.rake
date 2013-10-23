desc 'Generate API responses'
namespace :response_mate do
  task :fetch, :base_url, :requests_filename do |t, args|
    p "Generating responses for #{args[:base_url]}"

    requests_filename = args[:requests_filename] || './requests.yml'
    p "Reading requests from: #{requests_filename}"

    requests = YAML.load_file(requests_filename)

    mate = ResponseMate.new args[:base_url] || requests['base_url']
    requests['requests'].each do |request|
      mate.process request['key'], request['request']
    end
  end

  task :clear do
    FileUtils.rm_rf('output/responses/.')
    FileUtils.rm('tmp/compiled_content') if File.exist?('tmp/compiled_content')
  end
end
