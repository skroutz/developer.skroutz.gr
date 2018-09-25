module CodeExampleHelper
  def render_code(snippet, language)
    code language do
      snippet
    end
  end

  def render_code_from_file(filename)
    content_file = File.expand_path File.join('./resources',
                                              'code_examples',
                                              "#{filename}.yml")
    content = YAML.load ERB.new(File.read(content_file)).result(binding)
    render_code content[:code], content[:language]
  end
end
