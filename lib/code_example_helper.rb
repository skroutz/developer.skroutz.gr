module CodeExampleHelper
  def render_code(snippet, language)
    code language do
      snippet
    end
  end

  def render_code_from_file(filename)
    content = YAML.load_file(File.expand_path(File.join('./resources',
                                                        'code_examples',
                                                        "#{filename}.yml")))
    render_code content[:code], content[:language]
  end
end
